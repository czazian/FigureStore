using MailChimp.Net.Models;
using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.EnterpriseServices;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Assignment.Login
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string HashPassword(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
        }

        protected void register_Click(object sender, EventArgs e)
        {
            bool valid = false;
            SqlConnection conn2;
            string str2 = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn2 = new SqlConnection(str2);

            conn2.Open();

            string query2 = "SELECT COUNT(*) FROM Customer WHERE Email = @email";
            SqlCommand cmd2 = new SqlCommand(query2, conn2);
            cmd2.Parameters.AddWithValue("@email", regEmail.Text);

            int n = Convert.ToInt32(cmd2.ExecuteScalar());
            if (n >= 1)
            {
                valid = false;
            }
            else
            {
                valid = true;
            }

            //Getting values
            string name = regName.Text;
            string phone = regPhone.Text;
            string email = regEmail.Text;
            string address = regAddress.Text;
            string password1 = pass1.Text;
            string password2 = pass2.Text;
            string defaultImagePath = "~/Image/Profile/default.jpg";


            //Hash Password
            string hashedPassword = HashPassword(password2);

            //Store into DB
            if (password1 == password2 && password1 != "" && password2 != "" && Page.IsValid && valid == true)
            {
                SqlConnection conn;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();

                string query = "INSERT INTO Customer (Name, Email, PhoneNo, Address, Password, Image) VALUES (@name, @email, @phone, @address, @password, @image)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@password", hashedPassword);
                cmd.Parameters.AddWithValue("@image", defaultImagePath);

                int i = cmd.ExecuteNonQuery();

                if (i >= 1)
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "registered()", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "error()", true);
                }
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            string query = "SELECT COUNT(*) FROM Customer WHERE Email = @email";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@email", regEmail.Text);

            int n = Convert.ToInt32(cmd.ExecuteScalar());
            if (n >= 1)
            {
                CustomValidator1.IsValid = false;
                error1.Text = "*Email has been registered, please try to use another email to register.";
            }
            else
            {
                CustomValidator1.IsValid = true;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {

            System.Diagnostics.Debug.WriteLine("Custom Validator is fired.");

            string password1 = pass1.Text;
            string password2 = pass2.Text;
            if (password1 == "" || password2 == "")
            {
                CustomValidator2.IsValid = false;
                error2.Text = "*Please do not leave your password 1 and password 2 empty.";
            }
            else if (password1 != password2)
            {
                CustomValidator2.IsValid = false;
                error2.Text = "*Please ensure your password 1 and password 2 is matched.";
            }
            else
            {
                CustomValidator2.IsValid = true;
            }
        }

        private string getID ()
        {
            //Getting user id with email 
            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            string query = "SELECT CustomerID FROM Customer WHERE Email = @email";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@email", txtRecoverEmail.Text);

            string id = cmd.ExecuteScalar().ToString();
            System.Diagnostics.Debug.WriteLine("ID = " + id);

            return id;
        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {

            //Operation
            if (txtRecoverEmail.Text == "")
            {
                message1.Text = "Please do not leave email empty / Email entered does not exist.";
                message1.ForeColor = Color.Red;
            }
            else if (txtRecoverEmail.Text != "")
            {
                message1.ForeColor = Color.ForestGreen;
                string recipient = txtRecoverEmail.Text;
                string code = sendEmail(recipient, getID());
                Session["code"] = code.ToString();

            } else
            {
                message1.Text = "Please do not leave email empty / Email entered does not exist.";
                message1.ForeColor = Color.Red;
            }
        }

        private string sendEmail(string recipient, string id)
        {

            //Avoid user click again while email is sending
            btnSendEmail.Enabled = false;

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
            client.Send(mailMessage);

            message1.Text = "Verification code has been sent to your mainbox.";
            recBtn.Enabled = true;

            return code;
        }

        protected void login_Click(object sender, EventArgs e)
        {

            //Obtain data
            string loginEmail = email.Text;
            string loginPassword = password.Text;

            //Hash Password
            string hashPassword = HashPassword(loginPassword);

            //Processing
            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            string query = "SELECT * FROM Customer WHERE Email = @email AND Password = @pass";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@email", loginEmail);
            cmd.Parameters.AddWithValue("@pass", hashPassword);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows) //mean match and yes
            {
                if (reader.Read())
                {
                    //Session
                    Session["CustomerID"] = reader["CustomerID"].ToString();
                }

                //Redirect
                Response.Redirect("~/Customer/UserProfile.aspx");

            }
            else //mean error
            {
                loginerr.Text = "Email or Password wrong, please try again.";
            }
        }

        //Verification Code Processing
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string codeToCompare = "";
            string enteredCode = verificationCode.Text;
            if(Session["code"].ToString() != "")
            {
                codeToCompare = Session["code"].ToString();
                recBtn.Enabled = true;
            }

            if(enteredCode == codeToCompare.ToString())
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

            } else
            {
                message2.ForeColor = Color.Red;
                message2.Text = "*Incorrect validation code, please enter again.";
            }
        }
    }
}