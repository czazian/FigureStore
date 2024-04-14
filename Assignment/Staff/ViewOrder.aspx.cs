using Org.BouncyCastle.Asn1.Cmp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Staff
{
    public partial class ViewOrder : System.Web.UI.Page
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
                            //// Populate customer info
                            //txtFullName.Text = reader["Name"].ToString();
                            //txtEmail.Text = reader["Email"].ToString();
                            //txtPhoneNo.Text = reader["PhoneNo"].ToString();
                            //txtImg.ImageUrl = reader["Image"].ToString();

                            //// Populate order info
                            //txtPayMethod.Text = reader["PaymentMethod"].ToString();
                            //txtShippingAdd.Text = reader["HomeAddress"].ToString();
                            //txtTotalAmount.Text = reader["PaymentAmount"].ToString();
                            //txtOrderDate.Text = Convert.ToDateTime(reader["OrderDate"]).ToString("dd/MM/yyyy");
                            //ddlStatus.SelectedValue = reader["OrderStatus"].ToString();

                            //// Order Detail
                            //RepeaterNo.DataSource = SqlDataSource1;
                            //RepeaterNo.DataBind();

                            //RepeaterImage.DataSource = SqlDataSource1;
                            //RepeaterImage.DataBind();

                            //RepeaterProduct.DataSource = SqlDataSource1;
                            //RepeaterProduct.DataBind();

                            //RepeaterPrice.DataSource = SqlDataSource1;
                            //RepeaterPrice.DataBind();

                            //RepeaterQuantity.DataSource = SqlDataSource1;
                            //RepeaterQuantity.DataBind();

                        }
                        else
                        {
                            Response.Redirect("~/Staff/OrderList.aspx");
                        }
                    }
                }
            }

        }
    }
}