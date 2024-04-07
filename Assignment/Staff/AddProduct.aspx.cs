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
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if no permission
            if (Session["prod_permit"] == null || Session["prod_permit"].ToString() != "1")
            {
                Response.Redirect("/Staff/AccessDenied.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //uploading image file
            //done successful
            if (newImgProd1.HasFile)
            {
                try
                {
                    newImgProd1.SaveAs(Server.MapPath("~/Image/Product/") + newImgProd1.FileName);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    Response.Write(ex.Message);
                }
            }

            if (newImgProd2.HasFile)
            {
                try
                {
                    newImgProd2.SaveAs(Server.MapPath("~/Image/Product/") + newImgProd2.FileName);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    Response.Write(ex.Message);
                }
            }

            SqlConnection cnn;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn = new SqlConnection(strConnection);
            cnn.Open();

            String sql = "";

            sql = "INSERT INTO Figure(FigureName, FigurePrice, FigureSeries, FigureUnit, FigureReleaseDate, FigureManufacturer, FigureSpecification, FigureCategory, FigureStatus, FigureImage1, FigureImage2) values (@figureName, @figurePrice, @figureSeries, @figureUnit, @figureReleaseDate, @figureManufacturer, @figureSpecification, @figureCategory, @figureStatus, @figureImage1, @figureImage2)";

            SqlCommand cmdInsert = new SqlCommand(sql, cnn);

            cmdInsert.Parameters.AddWithValue("@figureName", txtFigureName.Text);
            cmdInsert.Parameters.AddWithValue("@figurePrice", txtFigurePrice.Text);
            cmdInsert.Parameters.AddWithValue("@figureSeries", txtFigureSeries.Text);
            cmdInsert.Parameters.AddWithValue("@figureUnit", txtUnit.Text);
            cmdInsert.Parameters.AddWithValue("@figureReleaseDate", txtFigureReleaseDate.Text);
            cmdInsert.Parameters.AddWithValue("@figureManufacturer", txtFigureManufacturer.Text);
            cmdInsert.Parameters.AddWithValue("@figureSpecification", txtFigureSpecification.Text);
            cmdInsert.Parameters.AddWithValue("@figureCategory", ddlProductCategory.Text);
            cmdInsert.Parameters.AddWithValue("@figureStatus", ddlfigurestatus.Text);
            cmdInsert.Parameters.AddWithValue("@figureImage1", "~/Image/Product/" + newImgProd1.FileName.ToString());
            cmdInsert.Parameters.AddWithValue("@figureImage2", "~/Image/Product/" + newImgProd2.FileName.ToString());

            int i = cmdInsert.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successScript", "alert('Success to add " + txtFigureName.Text + "!'); window.location ='" + ResolveUrl("~/Staff/Product.aspx") + "';", true);
            }
            else
            {
                Response.Write("Fail to add!");
            }


            cmdInsert.Dispose();
            cnn.Close();

        }
    }
}