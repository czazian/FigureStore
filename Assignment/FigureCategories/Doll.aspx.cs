using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.FigureCategories
{
    public partial class Doll : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            //Initial View
            string status = Request.QueryString["status"];

            SqlConnection conn;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn = new SqlConnection(str);

            conn.Open();

            string retrieve = "";

            if (status == "all")
            {
                RadioButtonList.SelectedIndex = 0;
                retrieve = "SELECT * FROM FIGURE WHERE [FigureCategory] = 'Dolls' ";
            }
            else if (status == "pre")
            {
                RadioButtonList.SelectedIndex = 1;
                retrieve = "SELECT * FROM FIGURE WHERE [FigureCategory] = 'Dolls' AND FigureStatus = 'Pre-Order'";
            }
            else if (status == "available")
            {
                RadioButtonList.SelectedIndex = 2;
                retrieve = "SELECT * FROM FIGURE WHERE [FigureCategory] = 'Dolls' AND FigureStatus = 'Available'";
            }

            SqlCommand cmd = new SqlCommand(retrieve, conn);

            SqlDataReader dolls = cmd.ExecuteReader();

            if (dolls.HasRows)
            {
                dollRepeater.DataSource = dolls;
                dollRepeater.DataBind();

                resultno.Text = dollRepeater.Controls.Count + " Results";
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
            string allManufacturer = "SELECT DISTINCT [FigureManufacturer] FROM FIGURE WHERE [FigureCategory] = 'Dolls' ";
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
                    onlyOneM.Text = "There is only one manufacturer or no manufacturer.";
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
            string allSeries = "SELECT DISTINCT [FigureSeries] FROM FIGURE WHERE FigureCategory = 'Dolls'";
            SqlCommand cmd3 = new SqlCommand(allSeries, conn3);
            SqlDataReader rdr3 = cmd3.ExecuteReader();

            List<string> sList = new List<string>();

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
                    onlyOneS.Text = "There is only one series or no series.";
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
            //Clear Series and Manufacturer Filters 
            if (cbxSeries.SelectedIndex != -1)
            {
                cbxSeries.SelectedIndex = -1;
            }
            if (cbxManufacturer.SelectedIndex != -1)
            {
                cbxManufacturer.SelectedIndex = -1;
            }
            minPrice.Text = "";
            maxPrice.Text = "";
            errorPrice.Visible = false;
            ddlSort.SelectedIndex = -1;

            //Main Operation
            dollRepeater.DataSource = null;
            dollRepeater.DataBind();
            SqlConnection conn2;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn2 = new SqlConnection(str);

            conn2.Open();

            string retrieve = "";

            if (RadioButtonList.SelectedValue == "All Product")
            {
                retrieve = "SELECT * FROM FIGURE WHERE [FigureCategory] = 'Dolls'";
            }
            else if (RadioButtonList.SelectedValue == "Pre-Order")
            {
                retrieve = "SELECT * FROM FIGURE WHERE [FigureCategory] = 'Dolls' AND FigureStatus = 'Pre-Order' ";
            }
            else if (RadioButtonList.SelectedValue == "Available")
            {
                retrieve = "SELECT * FROM FIGURE WHERE [FigureCategory] = 'Dolls' AND FigureStatus = 'Available' ";
            }

            SqlCommand cmd = new SqlCommand(retrieve, conn2);

            SqlDataReader result = cmd.ExecuteReader();

            if (result.HasRows)
            {
                dollRepeater.DataSource = result;
                dollRepeater.DataBind();

                resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
            }
            else
            {
                resultno.Text = "0" + " Results";
            }
        }

        protected void cbxManufacturer_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Deselect Status and Manufacturer
            if (RadioButtonList.SelectedIndex != -1)
            {
                RadioButtonList.SelectedIndex = -1;
            }
            if (cbxSeries.SelectedIndex != -1)
            {
                cbxSeries.SelectedIndex = -1;
            }
            ddlSort.SelectedIndex = -1;
            minPrice.Text = "";
            maxPrice.Text = "";
            errorPrice.Visible = false;

            //If all filters is unselected
            if (cbxManufacturer.SelectedIndex == -1 && RadioButtonList.SelectedIndex == -1 && cbxSeries.SelectedIndex == -1)
            {
                RadioButtonList.SelectedIndex = 0;
                resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
            }

            //Main Operation
            SqlConnection conn5;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn5 = new SqlConnection(str);

            //Get all selected items
            List<ListItem> itemsSelected = cbxManufacturer.Items.Cast<ListItem>()
                                                    .Where(li => li.Selected)
                                                    .ToList();

            //resultno.Text = itemsSelected.Count + " Results";
            string commandManufacturer = "SELECT * FROM Figure WHERE [FigureCategory] = 'Dolls' AND FigureManufacturer IN(";
            conn5.Open();

            if (itemsSelected.Count != 0)
            {
                for (int i = 0; i < itemsSelected.Count; i++)
                {
                    commandManufacturer += "'" + itemsSelected[i].Text + "'";
                    if ((i + 1) != itemsSelected.Count)
                    {
                        commandManufacturer += " , ";
                    }
                    else
                    {
                        commandManufacturer += "); ";
                    }
                }

                SqlCommand cmd5 = new SqlCommand(commandManufacturer, conn5);

                SqlDataReader mresult = cmd5.ExecuteReader();

                if (mresult.HasRows)
                {
                    System.Diagnostics.Debug.Write("\n1 Round : " + commandManufacturer);

                    dollRepeater.DataSource = mresult;
                    dollRepeater.DataBind();

                    resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
                }
                else
                {
                    resultno.Text = "0" + " Results";
                }
            }

        }

        protected void cbxSeries_SelectedIndexChanged(object sender, EventArgs e)
        {

            //Deselect Status and Manufacturer
            if (RadioButtonList.SelectedIndex != -1)
            {
                RadioButtonList.SelectedIndex = -1;
            }
            if (cbxManufacturer.SelectedIndex != -1)
            {
                cbxManufacturer.SelectedIndex = -1;
            }
            minPrice.Text = "";
            maxPrice.Text = "";
            errorPrice.Visible = false;
            ddlSort.SelectedIndex = -1;

            //If all filters is unselected
            if (cbxManufacturer.SelectedIndex == -1 && RadioButtonList.SelectedIndex == -1 && cbxSeries.SelectedIndex == -1)
            {
                RadioButtonList.SelectedIndex = 0;
                resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
            }

            //Main Operation
            SqlConnection conn4;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn4 = new SqlConnection(str);

            //Get all selected items
            List<ListItem> itemsSelected = cbxSeries.Items.Cast<ListItem>()
                                                    .Where(li => li.Selected)
                                                    .ToList();
            //resultno.Text = itemsSelected.Count + " Results";
            string commandSeries = "SELECT * FROM Figure WHERE [FigureCategory] = 'Dolls' AND FigureSeries IN(";
            conn4.Open();

            if (itemsSelected.Count != 0)
            {
                for (int i = 0; i < itemsSelected.Count; i++)
                {
                    commandSeries += "'" + itemsSelected[i].Text + "'";
                    if ((i + 1) != itemsSelected.Count)
                    {
                        commandSeries += " , ";
                    }
                    else
                    {
                        commandSeries += "); ";
                    }
                }

                SqlCommand cmd4 = new SqlCommand(commandSeries, conn4);

                SqlDataReader sresult = cmd4.ExecuteReader();

                if (sresult.HasRows)
                {
                    System.Diagnostics.Debug.Write("\n1 Round : " + commandSeries);

                    dollRepeater.DataSource = sresult;
                    dollRepeater.DataBind();

                    resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
                }
                else
                {
                    resultno.Text = "0" + " Results";
                }
            }
        }

        protected void clearAll_Click(object sender, EventArgs e)
        {
            //Clear Selection
            cbxSeries.SelectedIndex = -1;
            cbxManufacturer.SelectedIndex = -1;
            minPrice.Text = "";
            maxPrice.Text = "";
            errorPrice.Visible = false;
            ddlSort.SelectedIndex = -1;

            //To Default
            RadioButtonList.SelectedIndex = 0;
            resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
        }

        protected void Apply_Click(object sender, EventArgs e)
        {
            //Deselect Status and Manufacturer
            if (RadioButtonList.SelectedIndex != -1)
            {
                RadioButtonList.SelectedIndex = -1;
            }
            if (cbxManufacturer.SelectedIndex != -1)
            {
                cbxManufacturer.SelectedIndex = -1;
            }
            if (cbxSeries.SelectedIndex != -1)
            {
                cbxSeries.SelectedIndex = -1;
            }
            ddlSort.SelectedIndex = -1;

            int min = 0;
            int max = 0;

            //Main Operation
            if (minPrice.Text == "" || maxPrice.Text == "")
            {
                errorPrice.Visible = true;
                resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
            }
            else
            {
                errorPrice.Visible = false;
                min = Convert.ToInt32(minPrice.Text);
                max = Convert.ToInt32(maxPrice.Text);

                if (min >= max)
                {
                    errorPrice.Visible = true;
                    resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
                }
                else
                {
                    errorPrice.Visible = false;
                    SqlConnection conn6;
                    string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                    conn6 = new SqlConnection(str);

                    conn6.Open();

                    string cmdPrice = "SELECT * FROM Figure WHERE FigureCategory = 'Dolls' AND FigurePrice >= @min AND FigurePrice <= @max;";
                    SqlCommand cmd6 = new SqlCommand(cmdPrice, conn6);
                    cmd6.Parameters.AddWithValue("@min", min);
                    cmd6.Parameters.AddWithValue("@max", max);
                    SqlDataReader reader = cmd6.ExecuteReader();

                    if (reader.HasRows)
                    {
                        dollRepeater.DataSource = reader;
                        dollRepeater.DataBind();
                        resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";
                    }
                    else
                    {
                        dollRepeater.DataSource = "";
                        dollRepeater.DataBind();
                        resultno.Text = "0" + " Results";
                    }
                }
            }
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Reset
            cbxSeries.SelectedIndex = -1;
            cbxManufacturer.SelectedIndex = -1;
            minPrice.Text = "";
            maxPrice.Text = "";
            errorPrice.Visible = false;
            RadioButtonList.SelectedIndex = 0;
            resultno.Text = dollRepeater.Controls.Count.ToString() + " Results";

            //Main Operation
            SqlConnection conn7;
            string str = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            conn7 = new SqlConnection(str);

            conn7.Open();

            string cmdSort = "SELECT * FROM Figure WHERE FigureCategory = 'Dolls'";

            if (ddlSort.SelectedValue == "1")
            {
                cmdSort += " ORDER BY FigurePrice ASC";
            }
            else if (ddlSort.SelectedValue == "2")
            {
                cmdSort += " ORDER BY FigurePrice DESC";
            }
            else if (ddlSort.SelectedValue == "3")
            {
                cmdSort += " ORDER BY FigureName ASC";
            }
            else if (ddlSort.SelectedValue == "4")
            {
                cmdSort += " ORDER BY FigureName DESC";
            }

            SqlCommand cmd7 = new SqlCommand(cmdSort, conn7);
            SqlDataReader r = cmd7.ExecuteReader();

            if (r.HasRows)
            {
                dollRepeater.DataSource = r;
                dollRepeater.DataBind();
            }
        }

    }
}