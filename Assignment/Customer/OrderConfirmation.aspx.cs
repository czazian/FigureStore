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
        string orderDate = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            orderID = "-" + Request.QueryString["orderID"];
            orderDate = Request.QueryString["orderDate"];

            lblOrderID.Text = "#" + string.Concat(orderDate, orderID);
        }

        protected void btnCheckOrderStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/OrderTrack.aspx?orderID=" + orderID +"&orderDate=" + orderDate);
        }
    }
}