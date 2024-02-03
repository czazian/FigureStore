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
            string id = Request.QueryString["id"];
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
                cmd.Parameters.AddWithValue("@id", id);

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
                    }
                }
                conn.Close();
            }

            if(lblTopStatus.Text == "Pre-Order")
            {
                lblTopStatus.BackColor = Color.DarkOrange;
            } else if (lblTopStatus.Text == "Available")
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
            cmd2.Parameters.AddWithValue("@fid", id);

            SqlDataReader rdr = cmd2.ExecuteReader();
            if (rdr.HasRows)
            {
                SuggestionRpt.DataSource = rdr;
                SuggestionRpt.DataBind();
            }

            conn2.Close();
        }

        protected void view_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }
    }
}