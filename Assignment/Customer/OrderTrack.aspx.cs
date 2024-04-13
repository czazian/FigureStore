using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class OrderTrack : System.Web.UI.Page
    {
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

        private DataTable GetDataFromDatabase (string custID)
        {
            TrackingSource
        }
    }
}