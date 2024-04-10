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
    public partial class ViewStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["prod_permit"] == null || Session["prod_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/AccessDenied.aspx");
            }

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
                txtPassword.Text = staff.GetValue(2).ToString();
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
}