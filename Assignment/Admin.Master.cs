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
            if (Session["StaffID"] != null)
            {

                string staffID = Session["StaffID"].ToString();
                //everytime user load this page need to check permission
                //Get the staff & role
                SqlConnection cnn, cnn2;
                string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn2 = new SqlConnection(strConnection);
                cnn.Open();
                cnn2.Open();
                String sql1 = "SELECT AdminRoleID FROM Admin WHERE AdminID=@id";
                String sql2 = "SELECT * FROM AdminRole WHERE AdminRoleID=@id";
                SqlCommand cmdRetrieve = new SqlCommand(sql1, cnn);
                SqlCommand cmdRetrieve2 = new SqlCommand(sql2, cnn2);

                cmdRetrieve.Parameters.AddWithValue("@id", staffID);
                SqlDataReader staff = cmdRetrieve.ExecuteReader();

                //if staff found
                //find the role and initiallize the permission
                if (staff.HasRows && staff.Read())
                {
                    //get roleID from the staff
                    String roleID = staff.GetValue(0).ToString();

                    //get details of the role
                    cmdRetrieve2.Parameters.AddWithValue("@id", roleID);
                    SqlDataReader role = cmdRetrieve2.ExecuteReader();

                    if (role.HasRows && role.Read())
                    {
                        String prod_permit = role.GetValue(2).ToString();
                        String report_permit = role.GetValue(3).ToString();
                        String member_permit = role.GetValue(4).ToString();
                        String role_permit = role.GetValue(5).ToString();
                        String staff_permit = role.GetValue(6).ToString();

                        //set login staff role permission into session for permission checking
                        Session["prod_permit"] = prod_permit;
                        Session["report_permit"] = report_permit;
                        Session["member_permit"] = member_permit;
                        Session["role_permit"] = role_permit;
                        Session["staff_permit"] = staff_permit;
                        //display none if no permission to the corresponding module
                        if (prod_permit == "0")
                        {
                            prodLi.Style.Add("display", "none");
                        }

                        if (report_permit == "0")
                        {
                            reportLi.Style.Add("display", "none");
                        }
                        if (member_permit == "0")
                        {
                            memberLi.Style.Add("display", "none");
                        }
                        if (role_permit == "0")
                        {
                            roleLi.Style.Add("display", "none");
                        }
                        if (staff_permit == "0")
                        {
                            staffLi.Style.Add("display", "none");
                        }
                    }
                }
            }
            else
            {
                //if session expired or something
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Login Session Expired", "alert('Your login session have expired. Please try to login again!')", true);
                Response.Redirect("/Login/StaffLogin.aspx");
            }

            if (!IsPostBack)
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
                        Response.Redirect("/Staff/StaffLogin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("/Staff/StaffLogin.aspx");
                }
            }
        }

        private string GetStaffNameByStaffID(string staffID)
        {
            string staffName = string.Empty;

            string connectionString = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT AdminName FROM Admin WHERE AdminID = @StaffID";

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