using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Staff
{
    public partial class EditStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["prod_permit"] == null || Session["prod_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/AccessDenied.aspx");
            }

            if (!IsPostBack)
            {
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "";

                sql = "SELECT * FROM [Admin] WHERE AdminID=@id";

                SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);

                cmdRetrieve.Parameters.AddWithValue("@id", Request.QueryString["adminID"]);
                SqlDataReader staff = cmdRetrieve.ExecuteReader();

                if (staff.HasRows && staff.Read())
                {
                    //work, can get query string
                    txtUsername.Text = staff.GetValue(1).ToString();
                    ddlRole.SelectedValue = staff.GetValue(3).ToString();

                }
                else
                {
                    Response.Write("Invalid Records");
                }

                cmdRetrieve.Dispose();
                cnn.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check for duplicate username
            if (IsDuplicateUsername(txtUsername.Text, Request.QueryString["AdminID"]))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "duplicateUsername", "alert('Username already exists. Please choose a different username.');", true);
                return;
            }

            // Proceed with the update
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            // with update password
            String sql1 = "UPDATE Admin SET AdminName=@name, AdminPassword=@passw, AdminRoleID=@roleID WHERE AdminID=@id";

            SqlCommand cmdUpdate;

            cmdUpdate = new SqlCommand(sql1, cnn);
           
            // update detail
            cmdUpdate.Parameters.AddWithValue("@name", txtUsername.Text);
            cmdUpdate.Parameters.AddWithValue("@passw", txtNewPassw.Text);
            cmdUpdate.Parameters.AddWithValue("@roleID", ddlRole.SelectedItem.Value);
            // where condition
            cmdUpdate.Parameters.AddWithValue("@id", Request.QueryString["AdminID"]);

            int i = cmdUpdate.ExecuteNonQuery();
            if (i > 0)
            {
                System.Diagnostics.Debug.WriteLine("Idx of Item : " + i);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to edit staff " + txtUsername.Text + "!'); window.location ='" + ResolveUrl("~/Staff/Staff.aspx") + "';", true);
            }
            else
            {
                Response.Write("Fail to update!");
            }

            cmdUpdate.Dispose();
            cnn.Close();
        }

        private bool IsDuplicateUsername(string username, string staffID)
        {
            // Check if the given username already exists (excluding the current staff ID)
            string query = "SELECT COUNT(*) FROM Admin WHERE AdminName = @Username AND AdminID != @StaffID";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@StaffID", staffID);

                    int count = (int)cmd.ExecuteScalar();

                    return count > 0;
                }
            }
        }
    }
}