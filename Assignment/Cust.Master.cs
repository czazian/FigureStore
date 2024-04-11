using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Mail
using System.Net.Mail;
using System.Net.Http;
using System.Threading;
using MailChimp.Net.Models;
using Assignment.Objects;

namespace Assignment
{
    public partial class Cust : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                SqlConnection conn;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();
                string query = "SELECT Image FROM Customer WHERE CustomerID = @id";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@id", Session["CustomerID"].ToString());
                string img = command.ExecuteScalar().ToString();

                topImage.ImageUrl = img;

                //Obtain shopping cart
                Assignment.Objects.ShoppingCart shoppingCart = (Assignment.Objects.ShoppingCart)Session["shoppingCart"];

                if (shoppingCart == null)
                {
                    shoppingCart = new Assignment.Objects.ShoppingCart();
                    Session["shoppingCart"] = shoppingCart;
                }

                List<Assignment.Objects.OrderCart> figures = shoppingCart.getCartItems();

                if(figures.Count == 0)
                {
                    cartcount.Text =  0.ToString();
                }
                else
                {
                    cartcount.Text = figures.Count.ToString();
                }
                
            }
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            string recipient = txtSubscribe.Text;
            sendEmail(recipient);
        }

        private void sendEmail(string recipient)
        {
            //Mail Object
            MailMessage mailMessage = new MailMessage();
            string fromMail = "apexonlineshop.noreply@gmail.com";
            string fromPassword = "mlgrtqinkgbiutmn";
            string path = Server.MapPath("~/Image/Element/promo.jpg");

            //Sender and Recipient
            mailMessage.From = new MailAddress(fromMail); //The sender
            mailMessage.To.Add(recipient); //The recipient
            mailMessage.Subject = "Promotion Notifications Activated"; //Email Subject
            //Mail Message
            mailMessage.Body = "You chose to receive our promotion information, Thank you! We will keep sending our latest promotion information to you.";
            mailMessage.Attachments.Add(new Attachment(path));
            mailMessage.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.Timeout = 20000;
            client.Credentials = new System.Net.NetworkCredential(fromMail, fromPassword);
            client.EnableSsl = true;

            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "call()", true);

            ThreadPool.QueueUserWorkItem(delegate
            {
                client.Send(mailMessage);
            });

            //Store email to database
            string date = DateTime.Now.ToString("MM/dd/yyyy");

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();
            string query = "INSERT INTO Promotion (PromotionRecipientEmail, PromotionActivatedDate) VALUES (@email,@date)";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@email", recipient);
            command.Parameters.AddWithValue("@date", date);

            command.ExecuteNonQuery();
        }


        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            txtSearch.Focus();
            string currentInput = txtSearch.Text;
            if (currentInput != "")
            {
                //Random 3 items 
                resultRepeater.Visible = true;
                SqlConnection conn;
                string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn = new SqlConnection(str);

                conn.Open();

                string retrieve = "SELECT TOP 3 * FROM FIGURE WHERE UPPER(FigureName) LIKE UPPER('%' + @name + '%')";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                cmd.Parameters.AddWithValue("@name", currentInput);

                SqlDataReader figure = cmd.ExecuteReader();

                if (figure.HasRows)
                {
                    resultRepeater.DataSource = figure;
                    resultRepeater.DataBind();
                }
                else
                {
                    resultRepeater.Visible = false;
                    resultRepeater.DataSource = "";
                }
                //Top header
                SqlConnection conn2;
                string str2 = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                conn2 = new SqlConnection(str2);

                conn2.Open();

                string retrieve2 = "SELECT COUNT(*) FROM FIGURE WHERE UPPER(FigureName) LIKE UPPER('%' + @name + '%')";
                SqlCommand cmd2 = new SqlCommand(retrieve2, conn2);
                cmd2.Parameters.AddWithValue("@name", currentInput);
                int n = Convert.ToInt32(cmd2.ExecuteScalar());

                if(n > 0)
                {
                    panelResult.Visible = true;
                    resultTopNumber.Text = n.ToString();
                } else
                {
                    panelResult.Visible = false;
                }

            }
            else
            {
                panelResult.Visible = false;
                resultRepeater.Visible = false;
                resultRepeater.DataSource = "";
            }
        }

        protected void toDestination_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }

        protected void btnSch_Click(object sender, EventArgs e)
        {
            string name = txtSearch.Text;
            Response.Redirect("~/Customer/Search.aspx?name=" + name);
        }
    }
}