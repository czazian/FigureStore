using Assignment.Objects;
using Assignment;
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
        public decimal percentageOfOne;
        public decimal percentageOfTwo;
        public decimal percentageOfThree;
        public decimal percentageOfFour;
        public decimal percentageOfFive;

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


            //Rating
            SqlConnection conn3;
            string str3 = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn3 = new SqlConnection(str3);

            conn3.Open();

            string command = "SELECT * FROM [Rating] R, [Customer] C, [Figure] F WHERE R.CustomerID = C.CustomerID AND F.FigureID = R.FigureID AND R.FigureID = @FigureID ORDER BY R.RateStar ASC";

            SqlCommand sqlCommand = new SqlCommand(command, conn3);
            sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
            SqlDataReader reader1 = sqlCommand.ExecuteReader();
            CommentRepeater.DataSource = reader1;
            CommentRepeater.DataBind();

            conn3.Close();


            //Count the 1,2,3,4,5 stars of each book comment
            SqlConnection conn4;
            string str4 = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn4 = new SqlConnection(str4);

            conn4.Open();

            int one;
            int two;
            int three;
            int four;
            int five;

            string cmd1Star = "SELECT COUNT(*) FROM [Rating] R, [Figure] F WHERE R.FigureID = F.FigureID AND R.RateStar = 1 AND R.FigureID = @FigureID";
            string cmd2Star = "SELECT COUNT(*) FROM [Rating] R, [Figure] F WHERE R.FigureID = F.FigureID AND R.RateStar = 2 AND R.FigureID = @FigureID";
            string cmd3Star = "SELECT COUNT(*) FROM [Rating] R, [Figure] F WHERE R.FigureID = F.FigureID AND R.RateStar = 3 AND R.FigureID = @FigureID";
            string cmd4Star = "SELECT COUNT(*) FROM [Rating] R, [Figure] F WHERE R.FigureID = F.FigureID AND R.RateStar = 4 AND R.FigureID = @FigureID";
            string cmd5Star = "SELECT COUNT(*) FROM [Rating] R, [Figure] F WHERE R.FigureID = F.FigureID AND R.RateStar = 5 AND R.FigureID = @FigureID";
            SqlCommand star1 = new SqlCommand(cmd1Star, conn4);
            SqlCommand star2 = new SqlCommand(cmd2Star, conn4);
            SqlCommand star3 = new SqlCommand(cmd3Star, conn4);
            SqlCommand star4 = new SqlCommand(cmd4Star, conn4);
            SqlCommand star5 = new SqlCommand(cmd5Star, conn4);
            star1.Parameters.AddWithValue("@FigureID", figureID);
            star2.Parameters.AddWithValue("@FigureID", figureID);
            star3.Parameters.AddWithValue("@FigureID", figureID);
            star4.Parameters.AddWithValue("@FigureID", figureID);
            star5.Parameters.AddWithValue("@FigureID", figureID);

            one = (int)star1.ExecuteScalar();
            two = (int)star2.ExecuteScalar();
            three = (int)star3.ExecuteScalar();
            four = (int)star4.ExecuteScalar();
            five = (int)star5.ExecuteScalar();

            lblOneStar.Text = one.ToString();
            lblTwoStar.Text = two.ToString();
            lblThreeStar.Text = three.ToString();
            lblFourStar.Text = four.ToString();
            lblFiveStar.Text = five.ToString();

            int totalNumberOfItems = one + two + three + four + five;
            if (one != 0)
            {
                percentageOfOne = (decimal)one * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfOne = 0;
            }

            if (two != 0)
            {
                percentageOfTwo = (decimal)two * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfTwo = 0;
            }

            if (three != 0)
            {
                percentageOfThree = (decimal)three * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfThree = 0;
            }

            if (four != 0)
            {
                percentageOfFour = (decimal)four * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfFour = 0;
            }

            if (five != 0)
            {
                percentageOfFive = (decimal)five * 100 / totalNumberOfItems;
            }
            else
            {
                percentageOfFive = 0;
            }

            //Calculate the customer reviews by 5.0 decimal point

            lblRate.Text = totalNumberOfItems.ToString();
            decimal circleMark = 0;
            if (totalNumberOfItems != 0)
            {
                circleMark = ((one * 1) + (two * 2) + (three * 3) + (four * 4) + (five * 5)) / (one + two + three + four + five);
                lblRate.Text = circleMark.ToString("F1");
                if (circleMark >= 4)
                {
                    ranking.Text = "Excellent";
                }
                else if (circleMark >= 3)
                {
                    ranking.Text = "Good";
                }
                else
                {
                    ranking.Text = "Unsatisfied";
                }
            }
            else
            {
                lblRate.Text = circleMark.ToString("F1");
                ranking.Text = "N/A";
            }

            //Get Number of records
            people.Text = totalNumberOfItems.ToString() + " People Rated";
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
            string postback = "~/Customer/Cart.aspx?id=" + Request.QueryString["id"] + "&qty=" + txtQuantity.Text;
            Response.Redirect(postback, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void view_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            string figureID = Request.QueryString["id"];

            SqlConnection conn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(strConnection);

            conn.Open();

            if (ddlFilter.SelectedValue.Equals("0"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "ORDER BY R.RateStar ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }else if (ddlFilter.SelectedValue.Equals("1"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "ORDER BY R.RateStar DESC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("2"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "ORDER BY R.CommentDate DESC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("3"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "ORDER BY R.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("4"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "AND R.RateStar = 1 " +
                    "ORDER BY R.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("5"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "AND R.RateStar = 2 " +
                    "ORDER BY R.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("6"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "AND R.RateStar = 3 " +
                    "ORDER BY R.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("7"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "AND R.RateStar = 4 " +
                    "ORDER BY R.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
            else if (ddlFilter.SelectedValue.Equals("8"))
            {
                string command = "SELECT * " +
                    "FROM [Rating] R, [Customer] C, [Figure] F " +
                    "WHERE R.CustomerID = C.CustomerID " +
                    "AND F.FigureID = R.FigureID " +
                    "AND R.FigureID = @FigureID " +
                    "AND R.RateStar = 5 " +
                    "ORDER BY R.CommentDate ASC";
                SqlCommand sqlCommand = new SqlCommand(command, conn);
                sqlCommand.Parameters.AddWithValue("@FigureID", figureID);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                CommentRepeater.DataSource = reader;
                CommentRepeater.DataBind();
            }
        }
    }
}