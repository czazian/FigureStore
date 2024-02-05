using System;
using System.Collections.Generic;
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

        }

        protected void goLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("CustomerID");
            Response.Redirect("~/Customer/Home.aspx");
        }
    }
}