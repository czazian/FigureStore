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
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "run();", true);

            //Obtain login session
            string customerID = Session["CustomerID"].ToString();

            //Processing
            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            string query = "SELECT * FROM Customer WHERE CustomerID = @custID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@custID", customerID);

            SqlDataReader reader = cmd.ExecuteReader();

            if(reader.HasRows)
            {
                while (reader.Read())
                {
                    profileimg.ImageUrl = reader["Image"].ToString();
                    username.Text = reader["Name"].ToString();
                    email.Text = reader["Email"].ToString();
                    phone.Text = reader["PhoneNo"].ToString();
                    address.Text = reader["Address"].ToString();
                }
            } else
            {
                Response.Redirect("~/Login/CustomerLogin.aspx");
            }

        }

        protected void goLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("CustomerID");
            Response.Redirect("~/Customer/Home.aspx");
        }
    }
}