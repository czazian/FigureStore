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
    public partial class AddStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["staff_permit"] == null || Session["staff_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/AccessDenied.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!IsUsernameDuplicate(txtUsername.Text))
            {
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "";

                sql = "INSERT INTO Admin(AdminName, AdminPassword, AdminRoleID) values (@name, @passw, @roleID)";

                SqlCommand cmdInsert = new SqlCommand(sql, cnn);

                cmdInsert.Parameters.AddWithValue("@name", txtUsername.Text);
                cmdInsert.Parameters.AddWithValue("@passw", txtPass.Text);
                cmdInsert.Parameters.AddWithValue("@roleID", ddlRole.SelectedItem.Value);

                int i = cmdInsert.ExecuteNonQuery();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to add staff " + txtUsername.Text + "!'); window.location ='" + ResolveUrl("~/Staff/Staff.aspx") + "';", true);
                }
                else
                {
                    Response.Write("Fail to add!");
                }


                cmdInsert.Dispose();
                cnn.Close();

            }
            else if (IsUsernameDuplicate(txtUsername.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Username already exists. Please choose a different username.'); window.location ='" + ResolveUrl("~/Staff/AddStaff.aspx") + "';", true);
            }
        }

        private bool IsUsernameDuplicate(string username)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            string sql = "SELECT COUNT(*) FROM Admin WHERE AdminName = @username";

            SqlCommand cmdCheckUsername = new SqlCommand(sql, cnn);
            cmdCheckUsername.Parameters.AddWithValue("@username", username);

            int count = (int)cmdCheckUsername.ExecuteScalar();

            cmdCheckUsername.Dispose();
            cnn.Close();

            return count > 0;
        }
    }
}