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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Request.QueryString["name"];
            if (name != "")
            {
                SqlConnection conn;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();

                string retrieve = "SELECT DISTINCT * FROM FIGURE WHERE UPPER(FigureName) LIKE UPPER('%' + @name + '%')";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                cmd.Parameters.AddWithValue("@name", name);

                SqlDataReader figure = cmd.ExecuteReader();

                if (figure.HasRows)
                {

                    figuresRepeater.DataSource = figure;
                    figuresRepeater.DataBind();

                    searchCount.Text = figuresRepeater.Controls.Count.ToString();
                    div.Visible = false;
                }
                else
                {
                    searchCount.Text = "0";
                    div.Visible = true;
                    noResult.Text = "No Result was found with the Product Name <b>\"" + name + "\"</b>.";
                }
            }
        }
        protected void ToDestination_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }
    }
}