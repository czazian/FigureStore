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
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Label adminNameLabel = FindControl("adminNameLabel") as Label;

                if (adminNameLabel != null && Session["StaffID"] != null)
                {
                    string staffID = Session["StaffID"].ToString();
                    // Assuming you have a method to retrieve StaffName based on StaffID
                    string staffName = GetStaffNameByStaffID(staffID);


                    if (!string.IsNullOrEmpty(staffName))
                    {
                        adminNameLabel.Text = staffName;
                    }
                    else
                    {
                        // StaffName is not found
                        Response.Redirect("/Staff/staffLogin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("/Staff/staffLogin.aspx");
                }
            }
        }

        private string GetStaffNameByStaffID(string staffID)
        {
            string staffName = string.Empty;

            string connectionString = ConfigurationManager.ConnectionStrings["NitroBooks"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT StaffName FROM Staff WHERE StaffID = @StaffID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffID", staffID);

                    object staffNameObj = cmd.ExecuteScalar();

                    if (staffNameObj != null)
                    {
                        staffName = staffNameObj.ToString();
                    }
                }
            }

            return staffName;
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session["StaffID"] = null;

            // Redirect to the homepage or the desired logout page
            Response.Redirect("~/Customer/home.aspx");
        }
    }
}