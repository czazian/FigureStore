using Assignment.Objects;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class cart : System.Web.UI.Page
    {
        decimal overallPrice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("~/Login/CustomerLogin.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    //SESSION
                    //In case the shopping cart is not empty, load the session into shoppingCart.
                    ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];

                    //In case the shopping cart is null, create a shopping cart, and add to the session.
                    if (shoppingCart == null)
                    {
                        shoppingCart = new ShoppingCart();
                        Session["shoppingCart"] = shoppingCart;
                    }


                    //Obtain values
                    int figureID = Convert.ToInt32(Request.QueryString["id"]);
                    int selectedQuantity = Convert.ToInt32(Request.QueryString["qty"]);

                    SqlConnection conn;
                    string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                    conn = new SqlConnection(strConnection);

                    conn.Open();

                    string command = "SELECT * FROM Figure WHERE FigureID = @figureID";
                    SqlCommand cmd = new SqlCommand(command, conn);
                    cmd.Parameters.AddWithValue("@figureID", figureID);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        string msg = "";
                        while (reader.Read())
                        {
                            msg += reader["FigureName"].ToString() + "|" + reader["FigurePrice"] + "|" + reader["FigureSeries"].ToString() + "|" + reader["FigureImage1"].ToString();
                        }

                        string[] data = msg.Split('|');

                        //Object creation
                        decimal p = Convert.ToDecimal(data[1]);
                        Assignment.Objects.OrderCart figure = new Assignment.Objects.OrderCart(figureID, data[0], Decimal.Round(p, 2), data[2], data[3], selectedQuantity);

                        shoppingCart.addItem(figure);
                    }

                    //Define the data source for the repeater
                    FigureRepeater.DataSource = shoppingCart.getCartItems();
                    FigureRepeater.DataBind();


                }

            }

        }

        //protected void imgBook_Output(object sender, CommandEventArgs e)
        //{
        //    string destination = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument;
        //    Response.Redirect(destination, false);
        //    Context.ApplicationInstance.CompleteRequest();
        //}



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Obtian the bookid of the clicked item in the cart 
            int index = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            System.Diagnostics.Debug.WriteLine("Idx of Item : " + index);

            //Get all cart items stored in the session
            ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];


            if (shoppingCart == null)
            {
                shoppingCart = new ShoppingCart();
                Session["shoppingCart"] = shoppingCart;
            }

            shoppingCart.removeItem(index);
            Response.Redirect("~/Customer/Cart.aspx"); //Refresh page
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
                    TextBox qty = e.Item.FindControl("txtQty") as TextBox;
                    HiddenField figureID = e.Item.FindControl("hdnID") as HiddenField;
                    decimal subtotalPrice = shoppingCart.calculate(Convert.ToInt32(figureID.Value), Convert.ToInt32(qty.Text));


                    //Subtotal Price for individual product
                    ((Label)e.Item.FindControl("itemSubtotal")).Text = "RM " + (subtotalPrice).ToString();


                    //Calculate overall total
                    overallPrice += subtotalPrice;
                    //Price for overall
                    System.Diagnostics.Debug.WriteLine("Overall : " + overallPrice);
                    lblTotal.Text = overallPrice.ToString();

                }

            }
        }

        protected void ProductImage_Command(object sender, CommandEventArgs e)
        {
            string destination = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument;
            Response.Redirect(destination, false);
            Context.ApplicationInstance.CompleteRequest();
        }

    }
}