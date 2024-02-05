using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Login
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string HashPassword(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string password1 = pass1.Text;
            string password2 = pass2.Text;
            string customerID = Request.QueryString["id"].ToString();

            //string customerID = "7"; //For Testing Purpose

            //Store into DB
            if (password1 == password2 && password1 != "" && password2 != "" && Page.IsValid)
            {
                //Hash Password
                string hashedPassword = HashPassword(password2);

                SqlConnection conn;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();

                string query = "UPDATE CUSTOMER SET Password = @pass WHERE CustomerID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@pass", hashedPassword);
                cmd.Parameters.AddWithValue("@id", customerID);

                int n = cmd.ExecuteNonQuery();


                if (n >= 1) //Mean succeed
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
"alert",
"alert('New Pasword has been updated!');window.location ='CustomerLogin.aspx';",
true);
                }
                else
                {
                    error2.Text = "*Something wrong when trying to change password.";
                }
            }
            else if (password1 == "" || password2 == "")
            {
                error2.Text = "*Please do not leave your password 1 and password 2 empty.";
            }
            else if (password1 != password2)
            {
                error2.Text = "*Please ensure your password 1 and password 2 is matched.";
            }
        }

    }
}