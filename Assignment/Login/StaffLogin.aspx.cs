using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Login
{
    public partial class StaffLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                staffLogin();
            }
        }

        private void staffLogin()
        {
            string username = txtStaffusername.Text;
            string password = txtPassword.Text;

            // Validate inputs
            if (string.IsNullOrEmpty(username) && string.IsNullOrEmpty(password))
            {
                ShowErrorMessage("Please enter username", "Please enter password");
                return;
            }
            else if (string.IsNullOrEmpty(username))
            {
                ShowErrorMessage("Please enter username", "");
                return;
            }
            else if (string.IsNullOrEmpty(password))
            {
                ShowErrorMessage("", "Please enter password");
                return;
            }

            if (IsValidStaff(username, password))
            {
                // Authentication successful
                Response.Redirect("~/Staff/dashboard.aspx");
            }
            else
            {
                // Authentication failed
                ShowErrorMessage("Invalid username or password", "Invalid username or password");
            }
        }

        private void ShowErrorMessage(string emailMessage, string passwordMessage)
        {
            lblError.Text = emailMessage;
            lblError0.Text = passwordMessage;
        }

        private bool IsValidStaff(string username, string password)
        {
            string query = "SELECT AdminID FROM Admin WHERE AdminName = @Username AND AdminPassword = @Password";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    object staffID = cmd.ExecuteScalar();

                    if (staffID != null)
                    {
                        // Successful login, set session variable with StaffID
                        Session["StaffID"] = staffID.ToString();
                        return true;
                    }
                }
            }
            return false;
        }
    }
}