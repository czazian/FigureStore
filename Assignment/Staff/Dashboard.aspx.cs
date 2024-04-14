using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Staff
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                pnlNoLowStock.Visible = !HasLowStockProducts();

                if (Session["StaffID"] != null)
                {
                    int staffID;
                    if (int.TryParse(Session["StaffID"].ToString(), out staffID))
                    {
                        showstaffDetails(staffID);
                    }
                    else
                    {
                        Response.Redirect("/Login/StaffLogin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("/Login/StaffLogin.aspx");
                }
            }

            SqlConnection cnn1, cnn2, cnn3, cnn4, cnn5, cnn6, cnn7, cnn8, cnn9, cnn10, cnn11, cnn12, cnn13, cnn14, cnn15, cnn16, cnn17, cnn18, cnn19, cnn20, cnn21;
            string strConnection = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;
            cnn1 = new SqlConnection(strConnection);
            cnn2 = new SqlConnection(strConnection);
            cnn3 = new SqlConnection(strConnection);
            cnn4 = new SqlConnection(strConnection);
            cnn5 = new SqlConnection(strConnection);
            cnn6 = new SqlConnection(strConnection);
            cnn7 = new SqlConnection(strConnection);
            cnn8 = new SqlConnection(strConnection);
            cnn9 = new SqlConnection(strConnection);
            cnn10 = new SqlConnection(strConnection);
            cnn11 = new SqlConnection(strConnection);
            cnn12 = new SqlConnection(strConnection);
            cnn13 = new SqlConnection(strConnection);
            cnn14 = new SqlConnection(strConnection);
            cnn15 = new SqlConnection(strConnection);
            cnn16 = new SqlConnection(strConnection);
            cnn17 = new SqlConnection(strConnection);
            cnn18 = new SqlConnection(strConnection);
            cnn19 = new SqlConnection(strConnection);
            cnn20 = new SqlConnection(strConnection);
            cnn21 = new SqlConnection(strConnection);

            cnn1.Open();
            cnn2.Open();
            cnn3.Open();
            cnn4.Open();
            cnn5.Open();
            cnn6.Open();
            cnn7.Open();
            cnn8.Open();
            cnn9.Open();
            cnn10.Open();
            cnn11.Open();
            cnn12.Open();
            cnn13.Open();
            cnn14.Open();
            cnn15.Open();
            cnn16.Open();
            cnn17.Open();
            cnn18.Open();
            cnn19.Open();
            cnn20.Open();
            cnn21.Open();

            String sql1 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID";
            String sql2 = "SELECT SUM(OrderQuantity) FROM [OrderFigure], [Order] WHERE [OrderFigure].OrderID = [Order].OrderID";
            String sql3 = "SELECT SUM([OrderFigure].OrderQuantity*[Figure].FigurePrice) AS 'Total Price' FROM [OrderFigure], [Order], [Figure] WHERE [Figure].FigureID = [OrderFigure].FigureID AND [OrderFigure].OrderID = [Order].OrderID";
            String sql4 = "SELECT SUM(PaymentAmount) FROM [OrderFigure], [Order] WHERE [OrderFigure].OrderID = [Order].OrderID";
            String sql5 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 1 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql6 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 2 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql7 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 3 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql8 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 4 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql9 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 5 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql10 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 6 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql11 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 7 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql12 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 8 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql13 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 9 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql14 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 10 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql15 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 11 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql16 = "SELECT COUNT(*) FROM [Order], [OrderFigure] WHERE [Order].OrderID = [OrderFigure].OrderID AND MONTH([Order].OrderDate) = 12 AND YEAR([Order].OrderDate) = YEAR(GETDATE())";
            String sql17 = "SELECT SUM(OrderQuantity) FROM [OrderFigure] F JOIN [Figure] PF ON F.FigureID = PF.FigureID JOIN [Order] O ON F.OrderID = O.OrderID WHERE PF.FigureCategory = 'Scale Figures'";
            String sql18 = "SELECT SUM(OrderQuantity) FROM [OrderFigure] F JOIN [Figure] PF ON F.FigureID = PF.FigureID JOIN [Order] O ON F.OrderID = O.OrderID WHERE PF.FigureCategory = 'Nendoroids'";
            String sql19 = "SELECT SUM(OrderQuantity) FROM [OrderFigure] F JOIN [Figure] PF ON F.FigureID = PF.FigureID JOIN [Order] O ON F.OrderID = O.OrderID WHERE PF.FigureCategory = 'Dolls'";
            String sql20 = "SELECT SUM(OrderQuantity) FROM [OrderFigure] F JOIN [Figure] PF ON F.FigureID = PF.FigureID JOIN [Order] O ON F.OrderID = O.OrderID WHERE PF.FigureCategory = 'Gundam'";
            String sql21 = "SELECT SUM(OrderQuantity) FROM [OrderFigure] F JOIN [Figure] PF ON F.FigureID = PF.FigureID JOIN [Order] O ON F.OrderID = O.OrderID WHERE PF.FigureCategory = 'Goods'";

            SqlCommand cmdRetrieve1 = new SqlCommand(sql1, cnn1);
            SqlCommand cmdRetrieve2 = new SqlCommand(sql2, cnn2);
            SqlCommand cmdRetrieve3 = new SqlCommand(sql3, cnn3);
            SqlCommand cmdRetrieve4 = new SqlCommand(sql4, cnn4);
            SqlCommand cmdRetrieve5 = new SqlCommand(sql5, cnn5);
            SqlCommand cmdRetrieve6 = new SqlCommand(sql6, cnn6);
            SqlCommand cmdRetrieve7 = new SqlCommand(sql7, cnn7);
            SqlCommand cmdRetrieve8 = new SqlCommand(sql8, cnn8);
            SqlCommand cmdRetrieve9 = new SqlCommand(sql9, cnn9);
            SqlCommand cmdRetrieve10 = new SqlCommand(sql10, cnn10);
            SqlCommand cmdRetrieve11 = new SqlCommand(sql11, cnn11);
            SqlCommand cmdRetrieve12 = new SqlCommand(sql12, cnn12);
            SqlCommand cmdRetrieve13 = new SqlCommand(sql13, cnn13);
            SqlCommand cmdRetrieve14 = new SqlCommand(sql14, cnn14);
            SqlCommand cmdRetrieve15 = new SqlCommand(sql15, cnn15);
            SqlCommand cmdRetrieve16 = new SqlCommand(sql16, cnn16);
            SqlCommand cmdRetrieve17 = new SqlCommand(sql17, cnn17);
            SqlCommand cmdRetrieve18 = new SqlCommand(sql18, cnn18);
            SqlCommand cmdRetrieve19 = new SqlCommand(sql19, cnn19);
            SqlCommand cmdRetrieve20 = new SqlCommand(sql20, cnn20);
            SqlCommand cmdRetrieve21 = new SqlCommand(sql21, cnn21);

            SqlDataReader totalOrder = cmdRetrieve1.ExecuteReader();
            SqlDataReader quanSales = cmdRetrieve2.ExecuteReader();
            SqlDataReader salesProfit = cmdRetrieve3.ExecuteReader();
            SqlDataReader totalProfit = cmdRetrieve4.ExecuteReader();
            SqlDataReader totalJanOrder = cmdRetrieve5.ExecuteReader();
            SqlDataReader totalFebOrder = cmdRetrieve6.ExecuteReader();
            SqlDataReader totalMacOrder = cmdRetrieve7.ExecuteReader();
            SqlDataReader totalAprOrder = cmdRetrieve8.ExecuteReader();
            SqlDataReader totalMayOrder = cmdRetrieve9.ExecuteReader();
            SqlDataReader totalJuneOrder = cmdRetrieve10.ExecuteReader();
            SqlDataReader totalJulyOrder = cmdRetrieve11.ExecuteReader();
            SqlDataReader totalOgosOrder = cmdRetrieve12.ExecuteReader();
            SqlDataReader totalSepOrder = cmdRetrieve13.ExecuteReader();
            SqlDataReader totalOctOrder = cmdRetrieve14.ExecuteReader();
            SqlDataReader totalNovOrder = cmdRetrieve15.ExecuteReader();
            SqlDataReader totalDecOrder = cmdRetrieve16.ExecuteReader();
            SqlDataReader totalScaleFiguresSold = cmdRetrieve17.ExecuteReader();
            SqlDataReader totalNendoroidsSold = cmdRetrieve18.ExecuteReader();
            SqlDataReader totalDollsSold = cmdRetrieve19.ExecuteReader();
            SqlDataReader totalGundamSold = cmdRetrieve20.ExecuteReader();
            SqlDataReader totalGoodsSold = cmdRetrieve21.ExecuteReader();


            if ((totalOrder.HasRows && totalOrder.Read()) && (salesProfit.HasRows && salesProfit.Read()) && (quanSales.HasRows && quanSales.Read()) && (totalProfit.HasRows && totalProfit.Read()) && (totalJanOrder.HasRows && totalJanOrder.Read()) && (totalFebOrder.HasRows && totalFebOrder.Read()) && (totalMacOrder.HasRows && totalMacOrder.Read()) && (totalAprOrder.HasRows && totalAprOrder.Read()) && (totalMayOrder.HasRows && totalMayOrder.Read()) && (totalJuneOrder.HasRows && totalJuneOrder.Read()) && (totalJulyOrder.HasRows && totalJulyOrder.Read()) && (totalOgosOrder.HasRows && totalOgosOrder.Read()) && (totalSepOrder.HasRows && totalSepOrder.Read()) && (totalOctOrder.HasRows && totalOctOrder.Read()) && (totalNovOrder.HasRows && totalNovOrder.Read()) && (totalDecOrder.HasRows && totalDecOrder.Read()) && (totalScaleFiguresSold.HasRows && totalScaleFiguresSold.Read()) && (totalNendoroidsSold.HasRows && totalNendoroidsSold.Read()) && (totalDollsSold.HasRows && totalDollsSold.Read()) && (totalGundamSold.HasRows && totalGundamSold.Read()) && (totalGoodsSold.HasRows && totalGoodsSold.Read()))
            {
                lblTotalOrder.Text = totalOrder.GetValue(0).ToString();
                lblQuanSales.Text = quanSales.GetValue(0).ToString();
                lblSalesProfit.Text = salesProfit.GetValue(0).ToString();
                lblTotalProfit.Text = totalProfit.GetValue(0).ToString();

                lblTotalJanOrder.Value = totalJanOrder.GetValue(0).ToString();
                lblTotalFebOrder.Value = totalFebOrder.GetValue(0).ToString();
                lblTotalMacOrder.Value = totalMacOrder.GetValue(0).ToString();
                lblTotalAprOrder.Value = totalAprOrder.GetValue(0).ToString();
                 lblTotalMayOrder.Value = totalMayOrder.GetValue(0).ToString();
                lblTotalJuneOrder.Value = totalJuneOrder.GetValue(0).ToString();
                 lblTotalJulyOrder.Value = totalJulyOrder.GetValue(0).ToString();
                 lblTotalOgosOrder.Value = totalOgosOrder.GetValue(0).ToString();
                 lblTotalSepOrder.Value = totalSepOrder.GetValue(0).ToString();
                 lblTotalOctOrder.Value = totalOctOrder.GetValue(0).ToString();
                 lblTotalNovOrder.Value = totalNovOrder.GetValue(0).ToString();
                 lblTotalDecOrder.Value = totalDecOrder.GetValue(0).ToString();

                lbltotalScaleFiguresSold.Value = totalScaleFiguresSold.GetValue(0).ToString();
                lbltotalNendoroidsSold.Value= totalNendoroidsSold.GetValue(0).ToString();
                lbltotalDollsSold.Value = totalDollsSold.GetValue(0).ToString();
                lbltotalGundamSold.Value = totalGundamSold.GetValue(0).ToString();
                lbltotalGoodsSold.Value = totalGoodsSold.GetValue(0).ToString();

                //if total order = 0 means no sales then put 0 for all label
                if (totalOrder.GetValue(0).ToString() == "0")
                {
                    lblQuanSales.Text = "0";
                    lblSalesProfit.Text = "0";
                    lblTotalProfit.Text = "0";
                }
            }
            else
            {
                Response.Write("Invalid Records");
            }

        }

        private void showstaffDetails(int staffID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT * FROM Admin WHERE AdminID = @StaffID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffID", staffID);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtUsername.Text = reader["AdminName"].ToString();   
                        }
                    }
                }
            }
        }

        protected void RepeaterStatus_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label statusLabel = (Label)e.Item.FindControl("StatusLabel");

                if (statusLabel != null)
                {
                    string status = (string)DataBinder.Eval(e.Item.DataItem, "OrderStatus");

                    // Set color based on status
                    switch (status)
                    {
                        case "Pending":
                            statusLabel.ForeColor = System.Drawing.Color.Chocolate;
                            break;
                        case "Shipping":
                            statusLabel.ForeColor = System.Drawing.Color.Blue;
                            break;
                        case "Delivered":
                            statusLabel.ForeColor = System.Drawing.Color.Green;
                            break;
                    }
                }
            }
        }

        protected bool HasLowStockProducts()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApexOnlineShopDb"].ConnectionString))
            {
                conn.Open();

                string query = "SELECT TOP 5 FigureID, FigureImage1, FigureName, FigurePrice, FigureUnit FROM [Figure] WHERE FigureUnit < 10";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Check if there are low stock products
                        return reader.HasRows;
                    }
                }
            }
        }
    }
}