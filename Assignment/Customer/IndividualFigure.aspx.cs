using Assignment.Objects;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class IndividualFigure : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Query String
            string figureID = Request.QueryString["id"];
            if (!IsPostBack)
            {
                //Connection Establish
                SqlConnection conn;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();

                //Command & Execution 
                string retrieve = "SELECT * FROM FIGURE WHERE FigureID = @id";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                cmd.Parameters.AddWithValue("@id", figureID);

                SqlDataReader figure = cmd.ExecuteReader(); //More than 1 value

                if (figure.HasRows)
                {
                    while (figure.Read())
                    {
                        mainimg.ImageUrl = figure["FigureImage1"].ToString();
                        Image1.ImageUrl = figure["FigureImage1"].ToString();
                        Image2.ImageUrl = figure["FigureImage2"].ToString();
                        pname.Text = figure["FigureName"].ToString();
                        lblSeries.Text = figure["FigureSeries"].ToString();
                        prelease.Text = figure["FigureReleaseDate"].ToString();
                        pmanufacturer.Text = figure["FigureManufacturer"].ToString();
                        punit.Text = figure["FigureUnit"].ToString();
                        pStatus.Text = figure["FigureStatus"].ToString();
                        lblTopStatus.Text = figure["FigureStatus"].ToString();
                        pspecification.Text = figure["FigureSpecification"].ToString();
                        txtPrice.Text = Convert.ToDecimal(figure["FigurePrice"]).ToString("C2");
                        maxQty.Text = figure["FigureUnit"].ToString();
                    }
                }
                conn.Close();
            }
            //Check if cart already has it, then get it quantity in the cart, and compare with the quantity available in DB
            //to know how many quantity can be selected

            ShoppingCart shoppingCart = (ShoppingCart)Session["shoppingCart"];
            if (shoppingCart == null)
            {
                shoppingCart = new ShoppingCart();
                Session["shoppingCart"] = shoppingCart;
            }
            List<OrderCart> cartItems = shoppingCart.getCartItems();

            int currentQty = getCurrentQty(Convert.ToInt32(figureID), cartItems);
            int availableQty = getAvailableQuantity(Convert.ToInt32(figureID));


            int different = availableQty - currentQty;
            if (different == 0)
            {
                rangevalidator.MaximumValue = different.ToString();
                rangevalidator.MinimumValue = different.ToString();
            }
            else
            {
                rangevalidator.MaximumValue = different.ToString();
                rangevalidator.MinimumValue = "1";
            }

            if (lblTopStatus.Text == "Pre-Order")
            {
                lblTopStatus.BackColor = Color.DarkOrange;
            }
            else if (lblTopStatus.Text == "Available")
            {
                lblTopStatus.BackColor = Color.LimeGreen;
            }

            //Suggestion
            SqlConnection conn2;
            string str2 = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn2 = new SqlConnection(str2);

            conn2.Open();

            string suggestion = "SELECT TOP 2 * FROM FIGURE WHERE NOT FigureID = @fid ORDER BY NEWID()";
            SqlCommand cmd2 = new SqlCommand(suggestion, conn2);
            cmd2.Parameters.AddWithValue("@fid", figureID);

            SqlDataReader rdr = cmd2.ExecuteReader();
            if (rdr.HasRows)
            {
                SuggestionRpt.DataSource = rdr;
                SuggestionRpt.DataBind();
            }

            conn2.Close();
        }

        public int getAvailableQuantity(int figureID)
        {
            //Connection Establish
            SqlConnection conn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(strConnection);

            conn.Open();

            //To Get the available quantity
            string command2 = "SELECT FigureUnit FROM Figure WHERE FigureID = @figureID";
            SqlCommand cmd2 = new SqlCommand(command2, conn);
            cmd2.Parameters.AddWithValue("@figureID", figureID);

            return (int)cmd2.ExecuteScalar();
        }

        public int getCurrentQty(int figureID, List<OrderCart> cartItems)
        {
            int currentQty = 0;
            foreach (OrderCart cart in cartItems)
            {
                if (cart.figureID.Equals(figureID))
                {
                    currentQty = cart.selectedQuantity;
                    break;
                }
            }
            return currentQty;
        }
        protected void btnCart_Click(object sender, EventArgs e)
        {
            string postback = "~/Customer/Cart.aspx?bookID=" + Request.QueryString["figureID"] + "&qty=" + txtQuantity.Text;
            Response.Redirect(postback, false);
            Context.ApplicationInstance.CompleteRequest();
        }
        protected void view_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }
    }
}