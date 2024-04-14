using MailChimp.Net.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class OrderTrack : System.Web.UI.Page
    {
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
            DataTable distinctDataTable = dv.ToTable(true, "OrderID", "OrderDate", "PaymentAmount", "OrderStatus");
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

                // Filter the DataTable to get items for the current order
                DataTable itemsForOrder = ((DataView)TrackingSource.Select(DataSourceSelectArguments.Empty))
                    .Table
                    .Select($"OrderID= {orderID}")
                    .OrderByDescending(x => x.Field<DateTime>("OrderDate"))
                    .CopyToDataTable();
                itemsForOrder.DefaultView.Sort = "OrderDate DESC";

                CalculateEstimatedShippingDate(e.Item);
            }
            else
            {
                lblFail.Text = "You have no purchased records.";
            }
        }

        private void CalculateEstimatedShippingDate(RepeaterItem item)
        {
            // Find the controls within the item
            HiddenField hdnDate = (HiddenField)item.FindControl("hdnDate");
            Label estimate = (Label)item.FindControl("estimate");

            if (hdnDate != null && estimate != null)
            {
                // Assuming lblOrderDate.Text contains the payment date
                DateTime orderDate;

                // Specify the expected date format
                string[] dateFormats = { "dd-MM-yyyy" }; // Adjust according to your actual date format

                // Use DateTime.TryParseExact to handle specific date formats
                if (DateTime.TryParseExact(hdnDate.ToString(), dateFormats, CultureInfo.InvariantCulture, DateTimeStyles.None, out orderDate))
                {
                    // Calculate estimated arrival date
                    DateTime estimatedArrivalDate = orderDate.AddDays(5);

                    // Set the values for lblArrivalDate
                    estimate.Text = estimatedArrivalDate.ToString("dd-MM-yyyy");
                }
                else
                {
                    // Handle parsing failure
                    estimate.Text = "Invalid Date Format";
                }
            }
        }

    }
}