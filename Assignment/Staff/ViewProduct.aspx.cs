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
    public partial class ViewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["prod_permit"] == null || Session["prod_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/AccessDenied.aspx");
            }

            //only load when first time initialize the page
            if (!IsPostBack)
            {
                //retrieve query string and display it
                SqlConnection cnn;
                string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
                cnn = new SqlConnection(strConnection);
                cnn.Open();

                String sql = "SELECT * FROM Figure WHERE FigureID=@id";

                SqlCommand cmdRetrieve = new SqlCommand(sql, cnn);

                //get book ID from query string
                cmdRetrieve.Parameters.AddWithValue("@id", Request.QueryString["figureID"]);
                SqlDataReader figure = cmdRetrieve.ExecuteReader();

                if (figure.HasRows && figure.Read())
                {
                    //work, can get query string
                    txtFigureName.Text = figure.GetValue(1).ToString();
                    txtFigurePrice.Text = figure.GetValue(2).ToString();
                    txtFigureSeries.Text = figure.GetValue(3).ToString();
                    txtUnit.Text = figure.GetValue(4).ToString();
                    txtFigureReleaseDate.Text = figure.GetValue(5).ToString();
                    txtFigureManufacturer.Text = figure.GetValue(6).ToString();
                    txtFigureSpecification.Text = figure.GetValue(7).ToString();
                    ddlProductCategory.Text = figure.GetValue(8).ToString();
                    ddlfigurestatus.Text = figure.GetValue(9).ToString();
                    mainimg.ImageUrl = figure.GetValue(10).ToString();
                    newImgProd1.ImageUrl = figure.GetValue(10).ToString();
                    newImgProd2.ImageUrl = figure.GetValue(11).ToString();
                    //latest = current + add (0)
                    txtLatestQuantity.Text = (int.Parse(figure.GetValue(4).ToString()) + int.Parse(txtAddQuantity.Text)).ToString();

                }
                else
                {
                    Response.Write("Invalid Records");
                }

                cmdRetrieve.Dispose();
                cnn.Close();
            }
            else //post back when user input add quantity
            {
                //latest = current + add (integer)
                int currentQuantity;
                if (int.TryParse(txtUnit.Text, out currentQuantity))
                {
                    int addQuantity;
                    if (int.TryParse(txtAddQuantity.Text, out addQuantity))
                    {
                        txtLatestQuantity.Text = (currentQuantity + addQuantity).ToString();
                    }
                    else
                    {
                        // Handle the case where txtAddQuantity is not a valid integer
                    }
                }
                else
                {
                    // Handle the case where txtCurrentQuantity is not a valid integer
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "UPDATE Figure SET FigureUnit = (FigureUnit + @quantityAdd) WHERE FigureID=@id";

            SqlCommand cmdUpdate = new SqlCommand(sql, cnn);

            //update detail
            cmdUpdate.Parameters.AddWithValue("@quantityAdd", txtAddQuantity.Text);

            //where condition
            cmdUpdate.Parameters.AddWithValue("@id", Request.QueryString["figureID"]);

            int i = cmdUpdate.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to add stock to " + txtFigureName.Text + "!'); window.location ='" + ResolveUrl("~/Staff/Product.aspx") + "';", true);
            }
            else
            {
                Response.Write("Fail to update!");
            }


            cmdUpdate.Dispose();
            cnn.Close();
        }

        protected void btnShortCutQuantity_Click(object sender, EventArgs e)
        {
            Button clickedShortCutQuantityBtn = sender as Button;
            switch (clickedShortCutQuantityBtn.ID)
            {
                case "btn10":
                    txtAddQuantity.Text = "10";
                    break;
                case "btn20":
                    txtAddQuantity.Text = "20";
                    break;
                case "btn30":
                    txtAddQuantity.Text = "30";
                    break;
                case "btn40":
                    txtAddQuantity.Text = "40";
                    break;
                case "btn50":
                    txtAddQuantity.Text = "50";
                    break;
                default:
                    txtAddQuantity.Text = "0";
                    break;
            }

            txtLatestQuantity.Text = (int.Parse(txtUnit.Text) + int.Parse(txtAddQuantity.Text)).ToString();
        }

        protected void btnCal_Click(object sender, EventArgs e)
        {
            txtLatestQuantity.Text = (int.Parse(txtUnit.Text) + int.Parse(txtAddQuantity.Text)).ToString();
        }
    }
}