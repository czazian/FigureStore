using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Staff
{
    public partial class Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["member_permit"] == null || Session["member_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/AccessDenied.aspx");
            }
        }

        protected void delete_click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "deleteClick")
            {
                string usernameToDelete = GetUsernameToDelete(e.CommandArgument);

                //delete the record according to the argument
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "";

                sql = "DELETE FROM [Customer] WHERE CustomerID=@id";

                SqlCommand cmdDelete = new SqlCommand(sql, cnn);

                cmdDelete.Parameters.AddWithValue("@id", e.CommandArgument);
                cmdDelete.ExecuteNonQuery();
                cmdDelete.Dispose();
                cnn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to delete " + usernameToDelete + "!'); window.location ='" + ResolveUrl("~/Staff/Member.aspx") + "';", true);
            }
        }

        private string GetUsernameToDelete(object userID)
        {
            string username = string.Empty;

            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            string sql = "SELECT Name FROM [Customer] WHERE CustomerID=@id";

            SqlCommand cmdGetUsername = new SqlCommand(sql, cnn);
            cmdGetUsername.Parameters.AddWithValue("@id", userID);

            using (SqlDataReader reader = cmdGetUsername.ExecuteReader())
            {
                if (reader.Read())
                {
                    username = reader["Name"].ToString();
                }
            }

            cmdGetUsername.Dispose();
            cnn.Close();

            return username;
        }

        public String CreateConfirmation(Object name)
        {
            return String.Format("return confirm('Are you sure you want to delete {0}?');", name);
        }

        protected void linkBtnSearch_Click(object sender, EventArgs e)
        {
            //trigger here when search is click
            //if have search value is not null
            //use sqldataSource2
            if (txtSearch.Text != "")
            {
                Repeater1.DataSourceID = SqlDataSource2.ID;
                Repeater2.DataSourceID = SqlDataSource2.ID;
                Repeater3.DataSourceID = SqlDataSource2.ID;
                Repeater4.DataSourceID = SqlDataSource2.ID;
                Repeater5.DataSourceID = SqlDataSource2.ID;

            }
            else //if search value is empty
            {
                //use sqldataSource1
                Repeater1.DataSourceID = SqlDataSource1.ID;
                Repeater2.DataSourceID = SqlDataSource1.ID;
                Repeater3.DataSourceID = SqlDataSource1.ID;
                Repeater4.DataSourceID = SqlDataSource1.ID;
                Repeater5.DataSourceID = SqlDataSource1.ID;

            }
        }
    }
}