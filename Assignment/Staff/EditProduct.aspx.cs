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
    public partial class EditProduct : System.Web.UI.Page
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

                //get figure ID from query string
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
                    defaultImgProd1.ImageUrl = figure.GetValue(10).ToString();
                    defaultImgProd2.ImageUrl = figure.GetValue(11).ToString();

                }
                else
                {
                    Response.Write("Invalid Records");
                }

                cmdRetrieve.Dispose();
                cnn.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "UPDATE Figure SET FigureName=@figureName, FigurePrice=@figurePrice, FigureSeries=@figureSeries, FigureUnit=@figureUnit, FigureReleaseDate=@figureReleaseDate, FigureManufacturer=@figureManufacturer, FigureSpecification=@figureSpecification, FigureCategory=@figureCategory, FigureStatus=@figureStatus, FigureImage1=@image1, FigureImage2=@image2 WHERE FigureID=@id";

            SqlCommand cmdUpdate = new SqlCommand(sql, cnn);

            //update detail
            cmdUpdate.Parameters.AddWithValue("@figureName", txtFigureName.Text);
            cmdUpdate.Parameters.AddWithValue("@figurePrice", txtFigurePrice.Text);
            cmdUpdate.Parameters.AddWithValue("@figureSeries", txtFigureSeries.Text);
            cmdUpdate.Parameters.AddWithValue("@figureUnit", txtUnit.Text);
            cmdUpdate.Parameters.AddWithValue("@figureReleaseDate", txtFigureReleaseDate.Text);
            cmdUpdate.Parameters.AddWithValue("@figureManufacturer", txtFigureManufacturer.Text);
            cmdUpdate.Parameters.AddWithValue("@figureSpecification", txtFigureSpecification.Text);
            cmdUpdate.Parameters.AddWithValue("@figureCategory", ddlProductCategory.Text);
            cmdUpdate.Parameters.AddWithValue("@figureStatus", ddlfigurestatus.Text);


            //uploading image file
            //done successful
            if (newImgProd1.HasFile)
            {
                try
                {
                    newImgProd1.SaveAs(Server.MapPath("~/Image/Product/") + newImgProd1.FileName);
                    cmdUpdate.Parameters.AddWithValue("@image1", "~/Image/Product/" + newImgProd1.FileName.ToString());
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    Response.Write(ex.Message);
                }
            }
            else //remain old img
            {
                cmdUpdate.Parameters.AddWithValue("@image1", defaultImgProd1.ImageUrl);
            }

            if (newImgProd2.HasFile)
            {
                try
                {
                    newImgProd2.SaveAs(Server.MapPath("~/Image/Product/") + newImgProd2.FileName);
                    cmdUpdate.Parameters.AddWithValue("@image2", "~/Image/Product/" + newImgProd2.FileName.ToString());
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    Response.Write(ex.Message);
                }
            }
            else //remain old img
            {
                cmdUpdate.Parameters.AddWithValue("@image2", defaultImgProd2.ImageUrl);
            }
            //where condition
            cmdUpdate.Parameters.AddWithValue("@id", Request.QueryString["figureID"]);

            int i = cmdUpdate.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to edit " + txtFigureName.Text + "!'); window.location ='" + ResolveUrl("~/Staff/Product.aspx") + "';", true);
            }
            else
            {
                Response.Write("Fail to update!");
            }


            cmdUpdate.Dispose();
            cnn.Close();
        }
    }
}