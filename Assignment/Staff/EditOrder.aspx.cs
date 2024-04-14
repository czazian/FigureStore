using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Staff
{
    public partial class EditOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["OrderID"]))
                {
                    int orderID;
                    if (int.TryParse(Request.QueryString["OrderID"], out orderID))
                    {
                        LoadOrderDetails(orderID);
                        Button1.Visible = ddlStatus.SelectedValue != "Delivered";
                    }
                    else
                    {
                        Response.Redirect("~/Staff/OrderList.aspx");
                    }
                }
                else
                {
                    Response.Redirect("~/Staff/OrderList.aspx");
                }
            }

        }

        protected void ddlStatus_DataBound(object sender, EventArgs e)
        {
            // hide the button when 'Delivered' is selected
            Button1.Visible = ddlStatus.SelectedValue != "Delivered";
        }


        private void LoadOrderDetails(int orderID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = @"SELECT
                                    C.Name,
                                    C.Email,
                                    C.PhoneNo,
                                    C.Image,
                                    O.PaymentMethod,
                                    O.HomeAddress,
                                    O.PaymentAmount,
                                    O.OrderDate,
                                    F.OrderStatus
                                FROM
                                    [Order] O
                                JOIN
                                    [Customer] C ON O.CustomerID = C.CustomerID
                                JOIN
                                    OrderFigure F ON O.OrderID = F.OrderID
                                WHERE
                                    O.OrderID = @OrderID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderID);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Populate customer info
                            txtFullName.Text = reader["Name"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                            txtPhoneNo.Text = reader["PhoneNo"].ToString();
                            //txtImg.ImageUrl = reader["Image"].ToString();

                            // Populate order info
                            txtPayMethod.Text = reader["PaymentMethod"].ToString();
                            txtShippingAdd.Text = reader["HomeAddress"].ToString();
                            txtTotalAmount.Text = reader["PaymentAmount"].ToString();
                            txtOrderDate.Text = Convert.ToDateTime(reader["OrderDate"]).ToString("dd/MM/yyyy");
                            ddlStatus.SelectedValue = reader["OrderStatus"].ToString();

                            // Order Detail
                            RepeaterNo.DataSource = SqlDataSource1;
                            RepeaterNo.DataBind();

                            RepeaterImage.DataSource = SqlDataSource1;
                            RepeaterImage.DataBind();

                            RepeaterProduct.DataSource = SqlDataSource1;
                            RepeaterProduct.DataBind();

                            RepeaterPrice.DataSource = SqlDataSource1;
                            RepeaterPrice.DataBind();

                            RepeaterQuantity.DataSource = SqlDataSource1;
                            RepeaterQuantity.DataBind();

                        }
                        else
                        {
                            Response.Redirect("~/Staff/OrderList.aspx");
                        }
                    }
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string selectedStatus = hdnSelectedStatus.Value;

            if (!string.IsNullOrEmpty(selectedStatus))
            {
                int orderID;
                if (int.TryParse(Request.QueryString["OrderID"], out orderID))
                {
                    bool updateSuccess = UpdateOrderStatus(orderID, selectedStatus);

                    if (updateSuccess)
                    {
                        // Show a confirmation message
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Status updated successfully to Order " + orderID + "!'); window.location ='" + ResolveUrl("~/Staff/OrderList.aspx") + "';", true);
                    }
                    else
                    {
                        // Show an error message if the update fails
                        ClientScript.RegisterStartupScript(GetType(), "confirmStatusUpdate", "alert('Failed to update status.');", true);
                    }
                }
                else
                {
                    // Handle invalid OrderID
                    ClientScript.RegisterStartupScript(GetType(), "confirmStatusUpdate", "alert('Invalid OrderID.');", true);
                }
            }
        }

        private bool UpdateOrderStatus(int orderID, string selectedStatus)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "UPDATE [OrderFigure] SET OrderStatus = @Status WHERE OrderID = @OrderID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Status", selectedStatus);
                        cmd.Parameters.AddWithValue("@OrderID", orderID);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.Write(ex.Message);
                // Log the exception or handle it as needed
                return false;
            }
        }
    }
}