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
    public partial class EditRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["role_permit"] == null || Session["role_permit"].ToString() != "1")
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

                sql = "SELECT * FROM [AdminRole] WHERE AdminRoleID=@id";

                SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);

                cmdRetrieve.Parameters.AddWithValue("@id", Request.QueryString["roleID"]);
                SqlDataReader user = cmdRetrieve.ExecuteReader();

                if (user.HasRows && user.Read())
                {
                    //work, can get query string
                    txtRoleName.Text = user.GetValue(1).ToString();

                    cbProdPermit.Checked = determineTF(user.GetValue(2).ToString());
                    cbReportPermit.Checked = determineTF(user.GetValue(3).ToString());
                    cbMemberPermit.Checked = determineTF(user.GetValue(4).ToString());
                    cbRolePermit.Checked = determineTF(user.GetValue(5).ToString());
                    cbStaffPermit.Checked = determineTF(user.GetValue(6).ToString());
                }
                else
                {
                    Response.Write("Invalid Records");
                }

                cmdRetrieve.Dispose();
                cnn.Close();
            }
        }

        public Boolean determineTF(String value)
        {
            Boolean TF = false;
            switch (value)
            {
                case "0":
                    TF = false;
                    break;
                case "1":
                    TF = true;
                    break;
            }

            return TF;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "UPDATE [AdminRole] SET RoleName=@roleName, ProductPermission=@product_permit, ReportPermission=@report_permit, MemberPermission=@member_permit, RolePermission=@role_permit, StaffPermission=@staff_permit WHERE AdminRoleID=@id";

            SqlCommand cmdUpdate = new SqlCommand(sql, cnn);

            //update detail
            cmdUpdate.Parameters.AddWithValue("@roleName", txtRoleName.Text);
            cmdUpdate.Parameters.AddWithValue("@product_permit", convertBool2String(cbProdPermit.Checked));
            cmdUpdate.Parameters.AddWithValue("@report_permit", convertBool2String(cbReportPermit.Checked));
            cmdUpdate.Parameters.AddWithValue("@member_permit", convertBool2String(cbMemberPermit.Checked));
            cmdUpdate.Parameters.AddWithValue("@role_permit", convertBool2String(cbRolePermit.Checked));
            cmdUpdate.Parameters.AddWithValue("@staff_permit", convertBool2String(cbStaffPermit.Checked));

            //where condition
            cmdUpdate.Parameters.AddWithValue("@id", Request.QueryString["roleID"]);

            int i = cmdUpdate.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("~/Staff/Role.aspx");
            }
            else
            {
                Response.Write("Fail to update!");
            }


            cmdUpdate.Dispose();
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