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
    public partial class StaffProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StaffID"] != null)
                {
                    int staffID;
                    if (int.TryParse(Session["StaffID"].ToString(), out staffID))
                    {
                        showstaffDetails(staffID);
                    }
                    else
                    {
                        Response.Redirect("StaffLogin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("StaffLogin.aspx");
                }

                string confirmScript = "return confirm('Are you sure you want to update the name and password?');";
                btnSubmit.OnClientClick = confirmScript;
            }
        }

        private void showstaffDetails(int staffID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT * FROM Admin WHERE AdminID = @StaffID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffID", staffID);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string staffName = reader["AdminName"].ToString();
                            string staffPassword = reader["AdminPassword"].ToString();
                            int staffRole;

                            if (int.TryParse(reader["AdminRoleID"].ToString(), out staffRole))
                            {
                                username.Text = staffName;
                                txtUsername.Text = staffName;
                                ddlRole.SelectedValue = staffRole.ToString();
                                prevPasswHashed.Value = staffPassword;
                            }
                            else
                            {
                                // Handle the case where parsing RoleID to int fails
                                Response.Redirect("StaffLogin.aspx");
                            }
                        }
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.CausesValidation && Page.IsValid)
            {
                // Perform the update operation
                UpdateStaffDetails();
            }
        }

        private void UpdateStaffDetails()
        {
            int staffID;
            if (int.TryParse(Session["StaffID"].ToString(), out staffID))
            {
                string newUsername = txtUsername.Text;

                string connectionString = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check for duplicate username
                    if (IsDuplicateUsername(newUsername, staffID, conn))
                    {
                        ShowErrorMessage("Username already exists. Please choose a different one.");
                        return;
                    }

                    if (!string.IsNullOrEmpty(txtPrevPassw.Text))
                    {
                        // Check if the previous password is correct
                        if (!IsPreviousPasswordCorrect(staffID, conn))
                        {
                            ShowErrorMessage("Incorrect Previous Password.");
                            return;
                        }
                    }

                    string query = "UPDATE Admin SET AdminName = @NewUsername, AdminPassword = @NewPassword WHERE AdminID = @StaffID";
                    string query2 = "UPDATE Admin SET AdminName = @NewUsername WHERE AdminID = @StaffID";

                    SqlCommand cmdUpdate;
                    //if empty, no need to update password
                    if (hiddenVal_prevPass.Value == "no")
                    {
                        cmdUpdate = new SqlCommand(query2, conn);
                    }
                    else
                    {
                        cmdUpdate = new SqlCommand(query, conn);
                        cmdUpdate.Parameters.AddWithValue("@NewPassword", txtNewPassw.Text);
                    }

                    cmdUpdate.Parameters.AddWithValue("@NewUsername", newUsername);
                    cmdUpdate.Parameters.AddWithValue("@StaffID", staffID);

                    int rowsAffected = cmdUpdate.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ShowSuccessMessage("Success to update!");
                    }
                    else
                    {
                        ShowErrorMessage("Failed to update!");
                    }
                }
            }
            else
            {
                // Handle the case where parsing StaffID to int fails
                Response.Redirect("StaffLogin.aspx");
            }
        }

        private bool IsDuplicateUsername(string username, int staffID, SqlConnection conn)
        {
            string query = "SELECT COUNT(*) FROM Admin WHERE AdminName = @Username AND AdminID != @StaffID";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@StaffID", staffID);

                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private bool IsPreviousPasswordCorrect(int staffID, SqlConnection conn)
        {
            string query = "SELECT COUNT(*) FROM Admin WHERE AdminID = @StaffID AND AdminPassword = @PrevPassword";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@StaffID", staffID);
                cmd.Parameters.AddWithValue("@PrevPassword", txtPrevPassw.Text);

                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "errorScript", $"alert('{message}');", true);
        }

        private void ShowSuccessMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", $"alert('{message}'); window.location ='{ResolveUrl("StaffProfile.aspx")}';", true);
        }

        protected void txtPrevPassw_TextChanged(object sender, EventArgs e)
        {
            //if the prev passw not empty
            if (txtPrevPassw.Text != "")
            {
                //if not match
                if (prevPasswHashed.Value != txtPrevPassw.Text)
                {
                    lblPrevPassErrorMsg.Text = "Incorrect Previous Password";
                    hiddenVal_prevPass.Value = "no";
                    lblPrevPassErrorMsg.ForeColor = System.Drawing.Color.Red;
                }
                else //if match
                {
                    lblPrevPassErrorMsg.Text = "Correct Previous Password";
                    hiddenVal_prevPass.Value = "yes";
                    lblPrevPassErrorMsg.ForeColor = System.Drawing.Color.Green;
                }
            }
            else //if empty
            {
                lblPrevPassErrorMsg.Text = "";
                hiddenVal_prevPass.Value = "no";
            }

        }
    }
}