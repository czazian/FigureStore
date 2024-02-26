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
    public partial class Staff : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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