using MailChimp.Net.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{

    public partial class OrderDetail : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "run();", true);
            string custID = Session["CustomerID"].ToString();
            string orderID = Request.QueryString["orderID"];
            if (!IsPostBack)
            {
                SqlConnection conn;
                SqlConnection conn2;
                SqlConnection conn3;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);
                conn2 = new SqlConnection(str);
                conn3 = new SqlConnection(str);
                

                conn.Open();
                conn2.Open();
                conn3.Open();

                string retrieve = "SELECT O.OrderID AS OrderID,R.OrderQuantity AS OrderQuantity, F.FigureID AS FigureID, F.FigureName AS FigureName, F.FigureImage1 AS FigureImage1 FROM [Order] O JOIN [Customer] C ON O.CustomerID = C.CustomerID JOIN [OrderFigure] R ON R.OrderID = O.OrderID JOIN [Figure] F ON R.FigureID = F.FigureID WHERE O.CustomerID = @custID AND O.OrderID = @orderID";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                cmd.Parameters.AddWithValue("@custID", custID);
                cmd.Parameters.AddWithValue("@orderID", orderID);

                SqlDataReader order = cmd.ExecuteReader(); //More than 1 value

                if (order.HasRows)
                {
                    ItemRepeater.DataSource = order;
                    ItemRepeater.DataBind();
                }

                string details = "SELECT O.OrderID, O.PaymentMethod, O.HomeAddress, O.State, O.PosCode, O.City, O.PurchaseFirstName, O.PurchaseLastName, O.PhoneNo FROM [Order] O JOIN [Customer] C ON O.CustomerID = C.CustomerID WHERE O.CustomerID = @custID AND O.OrderID=@orderID;";
                SqlCommand cmd2 = new SqlCommand(details, conn2);
                cmd2.Parameters.AddWithValue("@custID",custID);
                cmd2.Parameters.AddWithValue("@orderID", orderID);

                SqlDataReader detail = cmd2.ExecuteReader();
                if (detail.HasRows)
                {
                    purchaseName.Text = Convert.ToString(detail["PurchaseFirstName"].ToString() + "" + detail["PurchaseLastName"].ToString());
                    phoneNo.Text = detail["PhoneNo"].ToString();
                    homeAddress.Text = Convert.ToString(detail["HomeAddress"].ToString() + ", " + detail["Poscode"].ToString() + " " + detail["City"].ToString() + ", " + detail["State"].ToString() + ".");
                    paymentMethod.Text = detail["PaymentMethod"].ToString();

                }

                string summary = "SELECT R.OrderQuantity, O.PaymentAmount, F.FigureID, F.FigurePrice FROM [Order] O JOIN [Customer] C ON O.CustomerID = C.CustomerID JOIN [OrderFigure] R ON R.OrderID = O.OrderID JOIN [Figure] F ON R.FigureID = F.FigureID WHERE O.CustomerID =@custID AND O.OrderID =@orderID";
                SqlCommand cmd3 = new SqlCommand(summary, conn3);
                cmd3.Parameters.AddWithValue("@custID", custID);
                cmd3.Parameters.AddWithValue("@orderID", orderID);

                SqlDataReader summarys = cmd3.ExecuteReader();
                if (summarys.HasRows)
                {
                    lblTotal.Text = summarys["PaymentAmount"].ToString();
                    lblTax.Text = Convert.ToString(Convert.ToInt32(summarys["PaymentAmount"]) / 106 * 6);
                    lblSubtotal.Text = Convert.ToString(Convert.ToInt32(summarys["PaymentAmount"]) - 25 - (Convert.ToInt32(summarys["PaymentAmount"]) / 106 * 6));
                }

                conn.Close();
                conn2.Close();
                conn3.Close();
            }
        }

        protected void goLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("CustomerID");
            Response.Redirect("~/Customer/Home.aspx");
        }

        protected void CalculateEstimatedAllDate(RepeaterItem item)
        {
            Label lblOrderDate = (Label)item.FindControl("lblOrderDate");
            Label lblEstimateDate = (Label)item.FindControl("lblEstimateDate");
            Label lblPendingDate = (Label)item.FindControl("lblPendingDate");
            Label lblShippingDate = (Label)item.FindControl("lblShippingDate");
            Label lblDeliveredDate = (Label)item.FindControl("lblDeliveredDate");

            if(lblOrderDate != null && lblEstimateDate != null && lblPendingDate != null && lblShippingDate != null && lblDeliveredDate !=null) 
            {
                DateTime paymentDate;

                string[] dateFormats = { "dd-MM-yyyy" };

                if(DateTime.TryParseExact(lblOrderDate.Text, dateFormats, CultureInfo.InvariantCulture, DateTimeStyles.None, out paymentDate))
                {
                    DateTime estimatedPendingDate = paymentDate.AddDays(1);
                    DateTime estimatedShippingDate = paymentDate.AddDays(2);
                    DateTime estimatedEstimateDate = paymentDate.AddDays(5);
                    DateTime estimatedArrivalDate = paymentDate.AddDays(5);

                    lblPendingDate.Text = estimatedPendingDate.ToString();
                    lblShippingDate.Text = estimatedShippingDate.ToString();
                    lblEstimateDate.Text = estimatedEstimateDate.ToString();
                    lblDeliveredDate.Text = estimatedArrivalDate.ToString();
                }
                else
                {
                    lblPendingDate.Text = "Invalid Date Format";
                    lblShippingDate.Text = "Invalid Date Format";
                    lblEstimateDate.Text = "Invalid Date Format";
                    lblDeliveredDate.Text = "Invalid Date Format";
                }
            }
        }
    }
}