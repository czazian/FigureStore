using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.FigureCategories
{
    public partial class Doll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            string retrieve = "SELECT * FROM FIGURE WHERE FigureCategory = 'Dolls'";
            SqlCommand cmd = new SqlCommand(retrieve, conn);

            SqlDataReader doll = cmd.ExecuteReader();

            if (doll.HasRows)
            {
                while (doll.Read())
                {
                    dollRepater.DataSource = doll;
                    dollRepater.DataBind();
                }
            }

        }

        protected void destination_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }
    }
}