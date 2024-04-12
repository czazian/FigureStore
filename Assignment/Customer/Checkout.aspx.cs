using Assignment.Objects;
using MailChimp.Net.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class Checkout : System.Web.UI.Page
    {
        decimal overallPrice = 0;
        decimal shippingFee = 25;
        protected void Page_Load(object sender, EventArgs e)
        {
            //In case the shopping cart is not empty, load the session into shoppingCart.
            ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];
            
            //In case the shopping cart is null, create a shopping cart, and add to the session.
            if (shoppingCart == null)
            {
                shoppingCart = new ShoppingCart();
                Session["shoppingCart"] = shoppingCart;
            }

            List<OrderCart> cartItems = shoppingCart.getCartItems();
            FigureRepeater.DataSource = cartItems;
            FigureRepeater.DataBind();

            if (Session["paymentMethod"] == null)
            {
                //Set default to cash
                Session["paymentMethod"] = "Cash On Delivery";
            }
        }

        protected void FigureRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];
                if (shoppingCart == null)
                {
                    shoppingCart = new ShoppingCart();
                    Session["shoppingCart"] = shoppingCart;
                }
                else
                {
                    Label qty = e.Item.FindControl("txtQty") as Label;
                    HiddenField figureID = e.Item.FindControl("hdnID") as HiddenField;
                    decimal subtotalPrice = shoppingCart.calculate(Convert.ToInt32(figureID.Value), Convert.ToInt32(qty.Text));

                    //Price for individual product
                    ((Label)e.Item.FindControl("itemSubtotal")).Text = "RM " + (subtotalPrice).ToString();
                    

                    //Calculate overall total
                    overallPrice += subtotalPrice;
                    //Price for overall
                    System.Diagnostics.Debug.WriteLine("Overall : " + overallPrice);
                    lblTotal.Text = "RM "+ overallPrice.ToString();



                    //Final Price Calculation
                    tax.Text = getTax().ToString("C2");
                    alltotal.Text = getOverAllTotal().ToString("C2");
                }

            }
        }

        public decimal getOverAllTotal()
        {
            return overallPrice + shippingFee + getTax();
        }

        public decimal getTax()
        {
            return overallPrice * (decimal)0.06;
        }

        protected void btnSubmitOdr_Click(object sender, EventArgs e)
        {
            //Obtian values required
            ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];
            if (shoppingCart == null)
            {
                shoppingCart = new ShoppingCart();
                Session["shoppingCart"] = shoppingCart;
            }

            List<OrderCart> items = shoppingCart.getCartItems();
            int userID = Convert.ToInt32(Session["CustomerID"]);
            
            //DB
            SqlConnection conn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(strConnection);

            conn.Open();

            //Processing
            //Insert to Order Table
            DateTime dateTime = DateTime.UtcNow.Date;
            dateTime.ToString("dd/MM/yyyy");
            string command1 = "INSERT INTO [Order] VALUES (@PaymentMethod, @PaymentAmount, @OrderDate, @HomeAddress, @HomeNo, @State, @PostCode, @City, @PurchaseFirstName, @PurchaseLastName, @PurchaseEmail, @PhoneNo, @CustomerID)" + "SELECT SCOPE_IDENTITY()";
            SqlCommand cmd1 = new SqlCommand(command1, conn);
            cmd1.Parameters.AddWithValue("@PaymentMethod", Session["paymentMethod"].ToString());
            cmd1.Parameters.AddWithValue("@PaymentAmount", getOverAllTotal());
            cmd1.Parameters.AddWithValue("@OrderDate", dateTime);
            cmd1.Parameters.AddWithValue("@HomeAddress", txtAddress.Text);
            cmd1.Parameters.AddWithValue("@HomeNo", txtHouse.Text);
            cmd1.Parameters.AddWithValue("@State", ddlState.Text);
            cmd1.Parameters.AddWithValue("@PostCode", Convert.ToInt32(txtPostCode.Text));
            cmd1.Parameters.AddWithValue("@City", txtCity.Text);
            cmd1.Parameters.AddWithValue("@PurchaseFirstName", txtFirstName.Text);
            cmd1.Parameters.AddWithValue("@PurchaseLastName", txtLastName.Text);
            cmd1.Parameters.AddWithValue("@PurchaseEmail", txtEmail.Text);
            cmd1.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd1.Parameters.AddWithValue("@CustomerID", userID);
            string insertedOrderID = Convert.ToString(cmd1.ExecuteScalar());

            //Insert to OrderFigure Table
            string command2 = "INSERT INTO [OrderFigure] VALUES (@OrderID, @FigureID, @OrderQuantity, @OrderStatus)";
            SqlCommand cmd2 = new SqlCommand( command2, conn);

            foreach(OrderCart item in items)
            {
                cmd2.Parameters.Clear();

                cmd2.Parameters.AddWithValue("@OrderID", insertedOrderID);
                cmd2.Parameters.AddWithValue("@FigureID", item.figureID);
                cmd2.Parameters.AddWithValue("@OrderQuantity", item.selectedQuantity);
                cmd2.Parameters.AddWithValue("@OrderStatus", "Pending");
                cmd2.ExecuteNonQuery();
            }

            //teesting
            SqlConnection conn2;
            string strConnection2 = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn2 = new SqlConnection(strConnection2);
            conn2.Open();
            //Update
            string updateQtyCmd = "UPDATE Figure SET FigureUnit = (FigureUnit - @qty) WHERE FigureID = @figureID";
            SqlCommand cmd3 = new SqlCommand(updateQtyCmd, conn);

            //testing & developing
            string commandSelectOrder = "SELECT * FROM OrderFigure WHERE OrderID = @orderID";
            SqlCommand cmdSelectOrder = new SqlCommand(commandSelectOrder, conn2);
            cmdSelectOrder.Parameters.AddWithValue("@orderID", insertedOrderID);
            SqlDataReader orderDetails = cmdSelectOrder.ExecuteReader();

            if(orderDetails.HasRows)
            {
                while(orderDetails.Read())
                {
                    cmd3.Parameters.Clear();
                    string figureID = orderDetails.GetValue(0).ToString();
                    int quantity = int.Parse(orderDetails.GetValue(2).ToString());
                    cmd3.Parameters.AddWithValue("@qty", quantity);
                    cmd3.Parameters.AddWithValue("@figureID", figureID);
                    int i = cmd3.ExecuteNonQuery();
                }
            }

            //Make the cart empty
            clearCart();
            //Redirect to the complete order page
            Response.Redirect("~/Customer/OrderConfirmation.aspx?orderID=" + insertedOrderID + "&reachDate=" + dateTime.AddDays(5).ToString("dd/MM/yyyy"));
        }
        public void clearCart()
        {
            Session.Remove("shoppingCart");
        }

        protected void method_Click(object sender, ImageClickEventArgs e)
        {

            ImageButton clickedButton = (ImageButton)sender;
            

            switch (clickedButton.ID)
            {
                case "cash":
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "cash()", true);
                    Session["paymentMethod"] = "Cash On Delivery";
                    break;
                case "visa":
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "visa()", true);
                    Session["paymentMethod"] = "Visa Card";
                    break;
                case "master":
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "master()", true);
                    Session["paymentMethod"] = "Master Card";
                    break;
                default:
                    throw new InvalidOperationException("Unknown payment method selected.");
            }
        }
        
    }
}