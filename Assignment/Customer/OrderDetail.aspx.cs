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
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();

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
                conn.Close();
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