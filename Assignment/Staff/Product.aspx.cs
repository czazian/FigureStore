using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Staff
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["prod_permit"] == null || Session["prod_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/AccessDenied.aspx");
            }
        }

        protected void Repeater6_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
        }

        protected void delete_click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "deleteClick")
            {
                //delete the record according to the argument
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "";

                sql = "DELETE FROM Figure WHERE FigureID=@id";

                SqlCommand cmdDelete = new SqlCommand(sql, cnn);

                cmdDelete.Parameters.AddWithValue("@id", e.CommandArgument);
                cmdDelete.ExecuteNonQuery();
                cmdDelete.Dispose();
                cnn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to delete product!'); window.location ='" + ResolveUrl("~/Staff/Product.aspx") + "';", true);
            }
        }
        public String CreateConfirmation(Object title)
        {
            return String.Format("return confirm('Are you sure you want to delete {0}?');", title);
        }

        protected void linkBtnSearch_Click(object sender, EventArgs e)
        {
            //trigger here when search is click
            //if have search value is not null
            //use sqldataSource2
            if (txtSearch.Text != "")
            {
                Repeater1.DataSourceID = SqlDataSource2.ID;
                Repeater2.DataSourceID = SqlDataSource2.ID;
                Repeater3.DataSourceID = SqlDataSource2.ID;
                Repeater5.DataSourceID = SqlDataSource2.ID;
                Repeater6.DataSourceID = SqlDataSource2.ID;
                Repeater7.DataSourceID = SqlDataSource2.ID;
            }
            else //if search value is empty
            {
                //use sqldataSource1
                Repeater1.DataSourceID = SqlDataSource1.ID;
                Repeater2.DataSourceID = SqlDataSource1.ID;
                Repeater3.DataSourceID = SqlDataSource1.ID;
                Repeater5.DataSourceID = SqlDataSource1.ID;
                Repeater6.DataSourceID = SqlDataSource1.ID;
                Repeater7.DataSourceID = SqlDataSource1.ID;
            }
        }
    }
}