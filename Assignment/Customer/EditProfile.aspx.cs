using MailChimp.Net.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "run();", true);

            string customerID = Session["CustomerID"].ToString();

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();
            string query = "SELECT * FROM Customer WHERE CustomerID = @id";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@id", customerID);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    profileimg.ImageUrl = reader["Image"].ToString();
                    txtUsername.Text = reader["Name"].ToString();
                    txtPhoneno.Text = reader["PhoneNo"].ToString();
                    txtHomeAddress.Text = reader["Address"].ToString();
                }
            }

        }

        protected void Delete_Click(object sender, EventArgs e)
        {

            string customerID = Session["CustomerID"].ToString();

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
                        "alert('Your profile photo has been successfully reset to default!');window.location ='EditProfile.aspx';",
                        true);
            } else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Something wrong when trying to update!');window.location ='EditProfile.aspx';",
                        true);
            }
        }

        protected void hideButton_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {
                try
                {
                    string customerID = Session["CustomerID"].ToString();
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
                                "alert('Your profile photo has been successfully updated!');window.location ='EditProfile.aspx';",
                                true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                                "alert",
                                "alert('Something wrong when trying to update!');window.location ='EditProfile.aspx';",
                                true);
                    }

                }
                catch
                {
                    System.Diagnostics.Debug.WriteLine("error");
                }
            }
        }

        protected void goLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("CustomerID");
            Response.Redirect("~/Customer/Home.aspx");
        }

        protected void Change_TextChanged(object sender, EventArgs e)
        {
            //Enable the edit button
            edit.Enabled = true;

            //Processing
            string customerID = Session["CustomerID"].ToString();
            string oriName = "";
            string oriPhone = "";
            string oriAddress = "";

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();
            string query = "SELECT * FROM Customer WHERE CustomerID = @id";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@id", customerID);

            SqlDataReader reader = command.ExecuteReader();

            if(reader.HasRows)
            {
                while (reader.Read())
                {
                    oriName = reader["Name"].ToString();
                    oriPhone = reader["PhoneNo"].ToString();
                    oriAddress = reader["Address"].ToString();
                }

                if(oriName != txtUsername.Text)
                {
                    modified1.Text = " - Modified";
                } else
                {
                    modified1.Text = "";
                }

                if(oriPhone != txtPhoneno.Text)
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
            }

        }

        protected void edit_Click(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"].ToString();

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();
            string query = "UPDATE Customer SET Name = @name, PhoneNo = @phone, Address = @address WHERE CustomerID = @id";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@name", txtUsername.Text);
            command.Parameters.AddWithValue("@phone", txtPhoneno.Text);
            command.Parameters.AddWithValue("@address", txtHomeAddress.Text);
            command.Parameters.AddWithValue("@id", customerID);
            int n = command.ExecuteNonQuery();


            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Your profile information has been successfully updated!');",
                        true);
                modified1.Text = "";
                modified2.Text = "";
                modified3.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Something wrong when trying to update!');",
                        true);
            }
        }

        private int getCount()
        {
            //Getting user id with email 
            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            string query = "SELECT COUNT(*) FROM Customer WHERE Email = @email";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@email", txtRecoverEmail.Text);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();

            return count;
        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            //Operation
            if (txtRecoverEmail.Text == "")
            {
                message1.Text = "Please do not leave email empty and enter your email with correct format.";
                message1.ForeColor = Color.Red;
            }
            else if (getCount() == 0)
            {
                message1.Text = "Email does not exist, please try another one.";
                message1.ForeColor = Color.Red;
            }
            else if (txtRecoverEmail.Text != "")
            {
                //Avoid user click again while email is sending
                btnSendEmail.Enabled = false;
                recBtn.Enabled = true;
                resendbtn.Enabled = true;
                //Correct operation
                message1.ForeColor = Color.ForestGreen;
                string recipient = txtRecoverEmail.Text;
                string code = sendEmail(recipient);
                Session["code"] = code.ToString();

            }
        }

        private string sendEmail(string recipient)
        {
            //Generate 6 digits random numbers 
            Random generator = new Random();
            string code = generator.Next(0, 1000000).ToString("D6");

            //Mail Object
            MailMessage mailMessage = new MailMessage();
            string fromMail = "apexonlineshop.noreply@gmail.com";
            string fromPassword = "mlgrtqinkgbiutmn";

            //Sender and Recipient
            mailMessage.From = new MailAddress(fromMail); //The sender
            mailMessage.To.Add(recipient); //The recipient
            mailMessage.Subject = "Verification Code"; //Email Subject

            //Mail Message
            mailMessage.Body = "Your Verification Code : " + code;
            mailMessage.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.Timeout = 20000;
            client.Credentials = new System.Net.NetworkCredential(fromMail, fromPassword);
            client.EnableSsl = true;

            //Send the email asynchronously - means send in background 
            ThreadPool.QueueUserWorkItem(delegate
            {
                client.Send(mailMessage);
            });

            message1.Text = "Verification code has been sent to your mainbox.";

            return code;
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string codeToCompare = "";
            string enteredCode = verificationCode.Text;
            if (Session["code"].ToString() != "")
            {
                codeToCompare = Session["code"].ToString();
                recBtn.Enabled = true;
            }

            if (enteredCode == codeToCompare.ToString())
            {
                //Obtain user id 
                SqlConnection conn;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();

                string query = "SELECT CustomerID FROM CUSTOMER WHERE Email = @email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", txtRecoverEmail.Text);

                string id = cmd.ExecuteScalar().ToString();

                if (id != "")
                {
                    Response.Redirect("~/Login/ChangePassword.aspx?id=" + id);
                }

            }
            else
            {
                message2.ForeColor = Color.Red;
                message2.Text = "Incorrect verification code, please enter again.";
            }
        }

        protected void resendbtn_Click(object sender, EventArgs e)
        {
            txtRecoverEmail.Text = "";
            verificationCode.Text = "";
            message1.Text = "";
            message2.Text = "";
            resendbtn.Enabled = false;
            btnSendEmail.Enabled = true;
            recBtn.Enabled = false;
            txtRecoverEmail.Focus();
        }
    }
}