using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Cust : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            string currentInput = txtSearch.Text;
            if (currentInput != "") {
                resultRepeater.Visible = true;
                SqlConnection conn;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();

                string retrieve = "SELECT TOP 3 * FROM FIGURE WHERE UPPER(FigureName) LIKE UPPER('%' + @name + '%')";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                cmd.Parameters.AddWithValue("@name", currentInput);

                SqlDataReader figure = cmd.ExecuteReader();
                
                if(figure.HasRows)
                {
                    resultRepeater.DataSource = figure;
                    resultRepeater.DataBind();
                } else
                {
                    resultRepeater.Visible = false;
                    resultRepeater.DataSource = "";
                }

            } else
            {
                resultRepeater.Visible = false;
                resultRepeater.DataSource = "";
            }
        }

        protected void toDestination_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }

        protected void btnSch_Click(object sender, EventArgs e)
        {
            string name = txtSearch.Text;
            Response.Redirect("~/Customer/Search.aspx?name=" + name);
        }
    }
}