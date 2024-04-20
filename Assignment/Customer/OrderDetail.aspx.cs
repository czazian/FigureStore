using MailChimp.Net.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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
                SqlConnection conn4;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);
                conn2 = new SqlConnection(str);
                conn3 = new SqlConnection(str);
                conn4 = new SqlConnection(str);
                

                conn.Open();
                conn2.Open();
                conn3.Open();
                conn4.Open();


                //Figure Repeater
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

                //Order details
                string details = "SELECT O.OrderID, O.PaymentMethod, O.HomeAddress, O.State, O.PosCode, O.City, O.PurchaseFirstName, O.PurchaseLastName, O.PhoneNo FROM [Order] O JOIN [Customer] C ON O.CustomerID = C.CustomerID WHERE O.CustomerID = @custID AND O.OrderID=@orderID;";
                SqlCommand cmd2 = new SqlCommand(details, conn2);
                cmd2.Parameters.AddWithValue("@custID", custID);
                cmd2.Parameters.AddWithValue("@orderID", orderID);

                SqlDataReader detail = cmd2.ExecuteReader();
                if (detail.HasRows && detail.Read())
                {
                    string firstName = detail["PurchaseFirstName"].ToString();
                    string lastName = " " + detail["PurchaseLastName"].ToString();
                    string address = detail["HomeAddress"].ToString();
                    string poscode = ", " + detail["PosCode"].ToString();
                    string city = " " + detail["City"].ToString();
                    string state = ", " + detail["State"].ToString() + ".";
                    string[] finalAddress = { address, poscode, city, state };


                    purchaseName.Text = string.Concat(firstName, lastName);
                    phoneNo.Text = detail["PhoneNo"].ToString();
                    homeAddress.Text = string.Concat(finalAddress);
                    paymentMethod.Text = detail["PaymentMethod"].ToString();

                }

                //Order summary
                string summary = "SELECT R.OrderQuantity, O.PaymentAmount, F.FigureID, F.FigurePrice FROM [Order] O JOIN [Customer] C ON O.CustomerID = C.CustomerID JOIN [OrderFigure] R ON R.OrderID = O.OrderID JOIN [Figure] F ON R.FigureID = F.FigureID WHERE O.CustomerID =@custID AND O.OrderID =@orderID";
                SqlCommand cmd3 = new SqlCommand(summary, conn3);
                cmd3.Parameters.AddWithValue("@custID", custID);
                cmd3.Parameters.AddWithValue("@orderID", orderID);

                SqlDataReader summarys = cmd3.ExecuteReader();
                if (summarys.HasRows && summarys.Read())
                {
                    
                    decimal tax = (Convert.ToDecimal(summarys["PaymentAmount"].ToString()) - 25) / 106 * 6;
                    lblTotal.Text = "RM " + summarys["PaymentAmount"].ToString();
                    lblTax.Text = "RM " + tax.ToString("F2");
                    lblSubtotal.Text = "RM " + (Convert.ToDecimal(summarys["PaymentAmount"]) - tax - 25).ToString("F2");
                }

                //Order header
                string query = "SELECT O.OrderID, O.OrderDate, R.OrderStatus FROM [Order] O JOIN [Customer] C ON O.CustomerID = C.CustomerID JOIN [OrderFigure] R ON R.OrderID = O.OrderID WHERE O.CustomerID = @custID AND O.OrderID = @orderID";
                SqlCommand cmd4 = new SqlCommand(query, conn4);
                cmd4.Parameters.AddWithValue("@custID", custID);
                cmd4.Parameters.AddWithValue("@orderID", orderID);

                SqlDataReader orderHeader = cmd4.ExecuteReader();
                if (orderHeader.HasRows && orderHeader.Read())
                {
                    string date1 = orderHeader["OrderDate"].ToString();
                    var date = DateTime.Parse(date1);
                    string formatedDate = date.ToString("yyyyMMdd");
                    string formatedDate2 = date.ToString("dd-MM-yyyy");
                    string id = orderHeader["OrderID"].ToString();

                    //set label text
                    lblStatus.Text = orderHeader["OrderStatus"].ToString();
                    lblOrderID.Text = formatedDate + "-" + id;
                    lblOrderDate.Text = formatedDate2;
                    DateTime estimateDate = date.AddDays(5);
                    lblEstimateDate.Text = estimateDate.ToString("dd-MM-yyyy");

                    //create session
                    Session["orderStatus"] = orderHeader["OrderStatus"].ToString();
                    Session["orderDate"] = formatedDate2;



                    //start up order status script
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "orderStatus();", true);

                    //calculate date at the order status section
                    if (Session["orderDate"] != null)
                    {
                        string orderDate = Session["orderDate"].ToString();
                        DateTime parsedOrderDate;
                        if (DateTime.TryParseExact(orderDate, "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out parsedOrderDate))
                        {
                            // 设置lblOrderDate2
                            lblOrderDate2.Text = parsedOrderDate.ToString("dd-MM-yyyy");

                            // 设置lblPendingDate
                            DateTime pendingDate = parsedOrderDate.AddDays(1);
                            lblPendingDate.Text = pendingDate.ToString("dd-MM-yyyy");

                            // 设置lblShippingDate
                            DateTime shippingDate = parsedOrderDate.AddDays(2);
                            lblShippingDate.Text = shippingDate.ToString("dd-MM-yyyy");

                            // 设置lblDeliveredDate
                            DateTime deliveredDate = parsedOrderDate.AddDays(5);
                            lblDeliveredDate.Text = deliveredDate.ToString("dd-MM-yyyy");
                        }
                    }
                }

                conn.Close();
                conn2.Close();
                conn3.Close();
                conn4.Close();
            }
        }

        protected void goLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("CustomerID");
            Response.Redirect("~/Customer/Home.aspx");
        }

    }
}