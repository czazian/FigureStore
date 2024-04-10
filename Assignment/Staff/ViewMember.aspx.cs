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
    public partial class ViewMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customerID = Request.QueryString["userID"];

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

                sql = "SELECT * FROM [Customer] WHERE CustomerID=@id";

                SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);

                cmdRetrieve.Parameters.AddWithValue("@id", customerID);
                SqlDataReader user = cmdRetrieve.ExecuteReader();

                if (user.HasRows && user.Read())
                {
                    //work, can get query string
                    txtName.Text = user.GetValue(1).ToString();
                    txtEmail.Text = user.GetValue(2).ToString();
                    txtPhoneno.Text = user.GetValue(3).ToString();
                    txtHomeAddress.Text = user.GetValue(4).ToString();
                    //prevPasswHashed.Value = user.GetValue(5).ToString();
                    profileimg.ImageUrl = user.GetValue(6).ToString();
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
}