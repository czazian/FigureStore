using MailChimp.Net.Models;
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
    public partial class EditMember : System.Web.UI.Page
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

        protected void Delete_Click(object sender, EventArgs e)
        {
            string customerID = Request.QueryString["userID"];

            //Update to db here
            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();
            string query = "UPDATE Customer SET Image = @img WHERE CustomerID = @id";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@img", "~/Image/Profile/default.jpg");
            command.Parameters.AddWithValue("@id", customerID);

            int n = command.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Your profile photo has been successfully reset to default!');window.location ='Member.aspx';",
                        true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Something wrong when trying to update!');window.location ='Member.aspx';",
                        true);
            }
        }

        protected void hideButton_Click(object sender, EventArgs e)
        {
            string customerID = Request.QueryString["userID"];

            if (FileUpload1.HasFile)
            {
                try
                {
                    //Saving file to destination
                    string filename = FileUpload1.FileName;
                    string path = Server.MapPath("~/Image/Profile/");
                    path += filename;
                    FileUpload1.SaveAs(path);

                    System.Diagnostics.Debug.WriteLine("PATH : " + path);

                    //Update to db here
                    SqlConnection conn;
                    string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                    conn = new SqlConnection(str);

                    conn.Open();
                    string query = "UPDATE Customer SET Image = @img WHERE CustomerID = @id";
                    SqlCommand command = new SqlCommand(query, conn);
                    command.Parameters.AddWithValue("@img", "~/Image/Profile/" + filename);
                    command.Parameters.AddWithValue("@id", customerID);

                    int n = command.ExecuteNonQuery();

                    if (n > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                                "alert",
                                "alert('Your profile photo has been successfully updated!');window.location ='Member.aspx';",
                                true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                                "alert",
                                "alert('Something wrong when trying to update!');window.location ='Member.aspx';",
                                true);
                    }

                    command.Dispose();
                    conn.Close();

                }
                catch
                {
                    System.Diagnostics.Debug.WriteLine("error");
                }

                
            }
        }

        protected void Change_TextChanged(object sender, EventArgs e)
        {
            //Enable the edit button
            edit.Enabled = true;

            //Processing
            string oriName = "";
            string oriEmail = "";
            string oriPhone = "";
            string oriAddress = "";

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();
            string query = "SELECT * FROM Customer WHERE CustomerID = @id";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@id", Request.QueryString["userID"]);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    oriName = reader["Name"].ToString();
                    oriEmail = reader["Email"].ToString();
                    oriPhone = reader["PhoneNo"].ToString();
                    oriAddress = reader["Address"].ToString();
                }

                if (oriName != txtName.Text)
                {
                    modified1.Text = " - Modified";
                }
                else
                {
                    modified1.Text = "";
                }

                if (oriPhone != txtPhoneno.Text)
                {
                    modified2.Text = " - Modified";
                }
                else
                {
                    modified2.Text = "";
                }

                if (oriAddress != txtHomeAddress.Text)
                {
                    modified3.Text = " - Modified";
                }
                else
                {
                    modified3.Text = "";
                }

                if (oriEmail != txtEmail.Text)
                {
                    modified4.Text = " - Modified";
                }
                else
                {
                    modified4.Text = "";
                }
            }

        }

        protected void edit_Click(object sender, EventArgs e)
        {
            string customerID = Request.QueryString["userID"];

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();
            string query = "UPDATE Customer SET Name = @name, Email = @email, PhoneNo = @phone, Address = @address WHERE CustomerID = @id";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@name", txtName.Text);
            command.Parameters.AddWithValue("@email", txtEmail.Text);
            command.Parameters.AddWithValue("@phone", txtPhoneno.Text);
            command.Parameters.AddWithValue("@address", txtHomeAddress.Text);
            command.Parameters.AddWithValue("@id", customerID);
            int n = command.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Member Personal Information has been successfully update!');window.location ='Member.aspx';",
                        true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Something wrong when trying to update!');window.location ='Member.aspx';",
                        true);
            }

            command.Dispose();
                    conn.Close();
        }
    }
}