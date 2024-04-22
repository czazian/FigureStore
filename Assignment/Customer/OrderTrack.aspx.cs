using MailChimp.Net.Core;
using MailChimp.Net.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class OrderTrack : System.Web.UI.Page
    {
        string orderID = "";
        string orderDate = "";
        Label status;
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "run();", true);
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void goLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("CustomerID");
            Response.Redirect("~/Customer/Home.aspx");
        }

        private void BindData()
        {
            string custID = Session["CustomerID"].ToString();

            DataTable data = GetDataFromDatabase(custID);

            if(data.Rows.Count > 0)
            {
                OrderRepeater.DataSource = data;
                OrderRepeater.DataBind();
            }
            else
            {
                lblFail.Text = "*Sorry, You have no purchased record.";
            }
        }

        private DataTable GetDataFromDatabase(string custID)
        {
            TrackingSource.SelectParameters["custID"].DefaultValue = custID;
            DataView dv = (DataView)TrackingSource.Select(DataSourceSelectArguments.Empty);
            DataTable distinctDataTable = dv.ToTable(true, "OrderID", "FigureID", "OrderDate", "PaymentAmount", "OrderStatus", "FigureName", "FigureImage1", "OrderQuantity");
            return distinctDataTable;
        }

        protected void OrderRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Assign status to page variable
                status = (Label)e.Item.FindControl("lblStatus");


                // Get the current order's data
                DataRowView orderData = (DataRowView)e.Item.DataItem;
                int orderID = orderData.Row.Field<int>("OrderID");
                string orderStat = orderData["OrderStatus"].ToString();

                // Filter the DataTable to get items for the current order
                DataTable itemsForOrder = ((DataView)TrackingSource.Select(DataSourceSelectArguments.Empty))
                    .Table
                    .Select($"OrderID= {orderID}")
                    .OrderByDescending(x => x.Field<DateTime>("OrderDate"))
                    .CopyToDataTable();
                itemsForOrder.DefaultView.Sort = "OrderDate DESC";

                CalculateEstimatedShippingDate(e.Item);

                //Check if the order status is Delivered, hide the Rate button otherwise
                Button btnToRate = (Button)e.Item.FindControl("btnToRate");
                if(orderStat != "Delivered")
                {
                    btnToRate.Visible = false;
                }
            }
            else
            {
                lblFail.Text = "You have no purchased records.";
            }
        }

        private void CalculateEstimatedShippingDate(RepeaterItem item)
        {
            // Find the controls within the item
            Label lblOrderDate = (Label)item.FindControl("lblOrderDate");
            Label lblEstimateDate = (Label)item.FindControl("lblEstimateDate");

            if (lblOrderDate != null && lblEstimateDate != null)
            {
                // Assuming lblOrderDate.Text contains the payment date
                DateTime orderDate;

                // Specify the expected date format
                string[] dateFormats = { "dd-MM-yyyy" }; // Adjust according to your actual date format

                // Use DateTime.TryParseExact to handle specific date formats
                if (DateTime.TryParseExact(lblOrderDate.Text, dateFormats, CultureInfo.InvariantCulture, DateTimeStyles.None, out orderDate))
                {
                    // Calculate estimated arrival date
                    DateTime estimatedArrivalDate = orderDate.AddDays(5);

                    // Set the values for lblArrivalDate
                    lblEstimateDate.Text = estimatedArrivalDate.ToString("dd-MM-yyyy");
                }
                else
                {
                    // Handle parsing failure
                    lblEstimateDate.Text = "Invalid Date Format";
                }
            }
        }

        protected void viewOrder_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/OrderDetail.aspx?orderID=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get the FigureID from session
            string figureID = Session["rateFID"].ToString();
            int rating = Convert.ToInt32(Request.Form["rating"]); // Assuming the name of the radio button group is "rating"
            string comment = txtFeedback.Text;
            System.Diagnostics.Debug.WriteLine("rating start is: " + rating);
            System.Diagnostics.Debug.WriteLine("feedback is : " + comment);

            if (string.IsNullOrWhiteSpace(comment))
            {
                lblErrorMsg.Text = "Please enter a feedback";
                return;
            }

            // Insert the rating data into the database
            InsertRatingIntoDatabase(figureID, rating, comment);

            // Disable the Rate button
            foreach (RepeaterItem item in OrderRepeater.Items)
            {
                Button btnToRate = (Button)item.FindControl("btnToRate");
                if (btnToRate.CommandArgument == figureID)
                {
                    btnToRate.Enabled = false;
                    break;
                }
            }

            //// Get the FigureID from session
            //string figureID = Session["rateFID"].ToString();
            //int rating = Convert.ToInt32(r.SelectedValue); // Assuming r is the RadioButtonList ID

            //// Get the Comment from the TextBox
            //string comment = txtFeedback.Text;

            //// Insert the rating data into the database
            //InsertRatingIntoDatabase(figureID, rating, comment);
        }

        protected void btnToRate_Command(object sender, CommandEventArgs e)
        {
            //Testing
            System.Diagnostics.Debug.WriteLine("Button clicked!");

            // Store the FigureID in session for further processing
            Session["rateFID"] = e.CommandArgument.ToString();

            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "openModal", "openModal();", true);
        }

        private void InsertRatingIntoDatabase(string figureID, int rating, string comment)
        {
            DateTime date = DateTime.UtcNow.Date;

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            string query = "INSERT INTO [Rating] (RateStar, Comment, CommentDate, FigureID, CustomerID) VALUES (@RateStar, @Comment, @CommentDate, @FigureID, @CustomerID)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@RateStar", rating);
            cmd.Parameters.AddWithValue("@Comment", comment);
            cmd.Parameters.AddWithValue("@CommentDate", date);
            cmd.Parameters.AddWithValue("@FigureID", figureID);
            cmd.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);

            cmd.ExecuteNonQuery();
            
        }
    }
}