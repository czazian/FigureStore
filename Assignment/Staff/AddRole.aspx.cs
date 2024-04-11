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
    public partial class AddRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["role_permit"] == null || Session["role_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/AccessDenied.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "";

            sql = "INSERT INTO [AdminRole] (RoleName, ProductPermission, ReportPermission, MemberPermission, RolePermission, StaffPermission) values (@roleName, @product_permit, @report_permit, @member_permit, @role_permit, @staff_permit)";

            SqlCommand cmdInsert = new SqlCommand(sql, cnn);
            cmdInsert.Parameters.AddWithValue("@roleName", txtUserName.Text);
            cmdInsert.Parameters.AddWithValue("@product_permit", convertBool2String(cbProdPermit.Checked));
            cmdInsert.Parameters.AddWithValue("@report_permit", convertBool2String(cbReportPermit.Checked));
            cmdInsert.Parameters.AddWithValue("@member_permit", convertBool2String(cbMemberPermit.Checked));
            cmdInsert.Parameters.AddWithValue("@role_permit", convertBool2String(cbRolePermit.Checked));
            cmdInsert.Parameters.AddWithValue("@staff_permit", convertBool2String(cbStaffPermit.Checked));

            int i = cmdInsert.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("~/Staff/Role.aspx");
            }
            else
            {
                Response.Write("Fail to add!");
            }


            cmdInsert.Dispose();
            cnn.Close();
        }

        public String convertBool2String(Boolean TF)
        {
            String str = "0";
            switch (TF)
            {
                case true:
                    str = "1";
                    break;
                case false:
                    str = "0";
                    break;
            }

            return str;
        }
    }
}