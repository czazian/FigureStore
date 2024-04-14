using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class OrderDetail : System.Web.UI.Page
    {
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
            DataTable distinctDataTable = dv.ToTable(true, "OrderID", "FigureID", "OrderDate", "PaymentAmount", "OrderStatus", "FigureName", "FigureImage1", "OrderQuantity");
            return distinctDataTable;
        }

        protected void goLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("CustomerID");
            Response.Redirect("~/Customer/Home.aspx");
        }

        protected void ItemRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}