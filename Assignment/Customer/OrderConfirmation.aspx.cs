using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class OrderDone : System.Web.UI.Page
    {
        string orderID = "";
        string reachDate = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            orderID = "-" + Request.QueryString["orderID"];
            reachDate = Request.QueryString["orderDate"];

            lblOrderID.Text = "#" + string.Concat(reachDate, orderID);
        }

        protected void btnCheckOrderStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/OrderTrack.aspx?orderID=" + orderID);
        }
    }
}