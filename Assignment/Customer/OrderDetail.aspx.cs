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

    public partial class OrderDetail : System.Web.UI.Page
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

        private void BindData()
        {
            string custID = Session["CustomerID"].ToString();

            DataTable data = GetDataFromDatabase(custID);

            if (data.Rows.Count > 0)
            {
                ItemRepeater.DataSource = data;
                ItemRepeater.DataBind();
            }
            
        }

        private DataTable GetDataFromDatabase(string custID)
        {
            TrackingSource.SelectParameters["custID"].DefaultValue = custID;
            DataView dv = (DataView)TrackingSource.Select(DataSourceSelectArguments.Empty);
            DataTable distinctDataTable = dv.ToTable(true, "OrderID", "PaymentMethod", "PaymentAmount", "OrderDate", "homeAddress", "State", "PosCode", "City", "PurchaseFirstName", "PurchaseLastName", "PhoneNo", "OrderQuantity", "OrderStatus", "FigureID", "FigureName", "FigurePrice", "FigureImage1");
            return distinctDataTable;
        }

        protected void goLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("CustomerID");
            Response.Redirect("~/Customer/Home.aspx");
        }

        protected void ItemRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                status = (Label)e.Item.FindControl("lblStatus");

                DataRowView orderData = (DataRowView)e.Item.DataItem;
                int orderID = orderData.Row.Field<int>("OrderID");

                DataTable itemsForOrder = ((DataView)TrackingSource.Select(DataSourceSelectArguments.Empty))
                    .Table
                    .Select($"OrderID = {orderID}")
                    .OrderByDescending(x => x.Field<DateTime>("PaymentDate"))
                    .CopyToDataTable();

                CalculateEstimatedAllDate(e.Item);
                //CalculateSummary(e.Item);
            }
        }

        protected void CalculateEstimatedAllDate(RepeaterItem item)
        {
            Label lblOrderDate = (Label)item.FindControl("lblOrderDate");
            Label lblEstimateDate = (Label)item.FindControl("lblEstimateDate");
            Label lblPendingDate = (Label)item.FindControl("lblPendingDate");
            Label lblShippingDate = (Label)item.FindControl("lblShippingDate");
            Label lblDeliveredDate = (Label)item.FindControl("lblDeliveredDate");

            if(lblOrderDate != null && lblEstimateDate != null && lblPendingDate != null && lblShippingDate != null && lblDeliveredDate !=null) 
            {
                DateTime paymentDate;

                string[] dateFormats = { "dd-MM-yyyy" };

                if(DateTime.TryParseExact(lblOrderDate.Text, dateFormats, CultureInfo.InvariantCulture, DateTimeStyles.None, out paymentDate))
                {
                    DateTime estimatedPendingDate = paymentDate.AddDays(1);
                    DateTime estimatedShippingDate = paymentDate.AddDays(2);
                    DateTime estimatedEstimateDate = paymentDate.AddDays(5);
                    DateTime estimatedArrivalDate = paymentDate.AddDays(5);

                    lblPendingDate.Text = estimatedPendingDate.ToString();
                    lblShippingDate.Text = estimatedShippingDate.ToString();
                    lblEstimateDate.Text = estimatedEstimateDate.ToString();
                    lblDeliveredDate.Text = estimatedArrivalDate.ToString();
                }
                else
                {
                    lblPendingDate.Text = "Invalid Date Format";
                    lblShippingDate.Text = "Invalid Date Format";
                    lblEstimateDate.Text = "Invalid Date Format";
                    lblDeliveredDate.Text = "Invalid Date Format";
                }
            }
        }

        //private void CalculateSummary(RepeaterItem item)
        //{
            
        //}
    }
}