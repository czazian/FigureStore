using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics.Tracing;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.FigureCategories
{
    public partial class Gundam : System.Web.UI.Page
    {

        string commandStatus = "";
        string commandManufacturer = "";
        string commandSeries = "";


        protected void Page_Init(object sender, EventArgs e)
        {
            //Initial View
            string status = Request.QueryString["status"];
            string retrieve = "";

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            if (status == "all")
            {
                RadioButtonList.SelectedIndex = 0;
                commandStatus = "SELECT * FROM FIGURE WHERE FigureCategory = 'Gundam' ";
                retrieve = commandStatus;
            }
            else if (status == "pre")
            {
                RadioButtonList.SelectedIndex = 1;
                commandStatus = "SELECT * FROM FIGURE WHERE FigureCategory = 'Gundam' AND FigureStatus = 'Pre-Order' ";
                retrieve = commandStatus;
            }
            else if (status == "available")
            {
                RadioButtonList.SelectedIndex = 2;
                commandStatus = "SELECT * FROM FIGURE WHERE FigureCategory = 'Gundam' AND FigureStatus = 'Available' ";
                retrieve = commandStatus;
            }

            SqlCommand cmd = new SqlCommand(retrieve, conn);

            SqlDataReader gundam = cmd.ExecuteReader();

            if (gundam.HasRows)
            {
                while (gundam.Read())
                {
                    gundamRepater.DataSource = gundam;
                    gundamRepater.DataBind();
                }
                resultno.Text = gundamRepater.Controls.Count.ToString() + " Results";
            }
            else
            {
                resultno.Text = "0" + " Results";
            }
            conn.Close();





            //Manufacturer Selection
            SqlConnection conn2;
            string str2 = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn2 = new SqlConnection(str2);

            conn2.Open();
            string allManufacturer = "SELECT DISTINCT FigureManufacturer FROM FIGURE WHERE FigureCategory = 'Gundam' ";
            SqlCommand cmd2 = new SqlCommand(allManufacturer, conn2);
            SqlDataReader rdr2 = cmd2.ExecuteReader();

            List<String> mList = new List<String>();

            if (rdr2.HasRows)
            {
                while (rdr2.Read())
                {
                    mList.Add(rdr2["FigureManufacturer"].ToString());
                }

                if (mList.Count == 1)
                {
                    cbxManufacturer.Enabled = false;
                    onlyOneM.Visible = true;
                    onlyOneM.Text = "There is only one manufacturer.";
                }
                else
                {
                    cbxManufacturer.DataSource = mList;
                    cbxManufacturer.DataBind();
                }
            }
            conn2.Close();





            //Series Selection
            SqlConnection conn3;
            string str3 = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn3 = new SqlConnection(str3);

            conn3.Open();
            string allSeries = "SELECT DISTINCT FigureSeries FROM FIGURE WHERE FigureCategory = 'Gundam'";
            SqlCommand cmd3 = new SqlCommand(allSeries, conn3);
            SqlDataReader rdr3 = cmd3.ExecuteReader();


            List<String> sList = new List<String>();

            if (rdr3.HasRows)
            {
                while (rdr3.Read())
                {
                    sList.Add(rdr3["FigureSeries"].ToString());
                }

                if (sList.Count == 1)
                {
                    cbxSeries.Enabled = false;
                    onlyOneS.Visible = true;
                    onlyOneS.Text = "There is only one series.";
                }
                else
                {
                    cbxSeries.DataSource = sList;
                    cbxSeries.DataBind();
                }
            }
            conn3.Close();
        }

        protected void destination_Command(object sender, CommandEventArgs e)
        {
            string url = "~/Customer/IndividualFigure.aspx?id=" + e.CommandArgument.ToString();
            Response.Redirect(url);
        }

        protected void RadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            gundamRepater.DataSource = null;
            gundamRepater.DataBind();
            SqlConnection conn2;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn2 = new SqlConnection(str);

            conn2.Open();

            string retrieve = "";

            if (RadioButtonList.SelectedValue == "All Product")
            {
                commandStatus = "SELECT * FROM FIGURE WHERE FigureCategory = 'Gundam' ";
                retrieve = commandStatus;
            }
            else if (RadioButtonList.SelectedValue == "Pre-Order")
            {
                commandStatus = "SELECT * FROM FIGURE WHERE FigureCategory = 'Gundam' AND FigureStatus = 'Pre-Order' ";
                retrieve = commandStatus;
            }
            else if (RadioButtonList.SelectedValue == "Available")
            {
                commandStatus = "SELECT * FROM FIGURE WHERE FigureCategory = 'Gundam' AND FigureStatus = 'Available' ";
                retrieve = commandStatus;
            }

            SqlCommand cmd = new SqlCommand(retrieve, conn2);

            SqlDataReader result = cmd.ExecuteReader();

            if (result.HasRows)
            {
                while (result.Read())
                {
                    gundamRepater.DataSource = result;
                    gundamRepater.DataBind();
                }
                resultno.Text = gundamRepater.Controls.Count.ToString() + " Results";
            }
            else
            {
                resultno.Text = "0" + " Results";
            }
        }

        protected void cbxManufacturer_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cbxSeries_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}