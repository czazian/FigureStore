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
            SqlConnection cnn1, cnn2, cnn3, cnn4, cnn5, cnn6, cnn7, cnn8, cnn9, cnn10, cnn11, cnn12, cnn13, cnn14, cnn15, cnn16;
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

            if ((totalOrder.HasRows && totalOrder.Read()) && (salesProfit.HasRows && salesProfit.Read()) && (quanSales.HasRows && quanSales.Read()) && (totalProfit.HasRows && totalProfit.Read()) && (totalJanOrder.HasRows && totalJanOrder.Read()) && (totalFebOrder.HasRows && totalFebOrder.Read()) && (totalMacOrder.HasRows && totalMacOrder.Read()) && (totalAprOrder.HasRows && totalAprOrder.Read()) && (totalMayOrder.HasRows && totalMayOrder.Read()) && (totalJuneOrder.HasRows && totalJuneOrder.Read()) && (totalJulyOrder.HasRows && totalJulyOrder.Read()) && (totalOgosOrder.HasRows && totalOgosOrder.Read()) && (totalSepOrder.HasRows && totalSepOrder.Read()) && (totalOctOrder.HasRows && totalOctOrder.Read()) && (totalNovOrder.HasRows && totalNovOrder.Read()) && (totalDecOrder.HasRows && totalDecOrder.Read()))
            {
                lblTotalOrder.Text = totalOrder.GetValue(0).ToString();
                lblQuanSales.Text = quanSales.GetValue(0).ToString();
                lblSalesProfit.Text = salesProfit.GetValue(0).ToString();
                lblTotalProfit.Text = totalProfit.GetValue(0).ToString();

                int lblTotalJanOrder = Convert.ToInt32(totalJanOrder.GetValue(0));
                int lblTotalFebOrder = Convert.ToInt32(totalFebOrder.GetValue(0));
                int lblTotalMacOrder = Convert.ToInt32(totalMacOrder.GetValue(0));
                int lblTotalAprOrder = Convert.ToInt32(totalAprOrder.GetValue(0));
                Debug.Write("testing: " + lblTotalAprOrder);
                int lblTotalMayOrder = Convert.ToInt32(totalMayOrder.GetValue(0));
                int lblTotalJuneOrder = Convert.ToInt32(totalJuneOrder.GetValue(0));
                int lblTotalJulyOrder = Convert.ToInt32(totalJulyOrder.GetValue(0));
                int lblTotalOgosOrder = Convert.ToInt32(totalOgosOrder.GetValue(0));
                int lblTotalSepOrder = Convert.ToInt32(totalSepOrder.GetValue(0));
                int lblTotalOctOrder = Convert.ToInt32(totalOctOrder.GetValue(0));
                int lblTotalNovOrder = Convert.ToInt32(totalNovOrder.GetValue(0));
                int lblTotalDecOrder = Convert.ToInt32(totalDecOrder.GetValue(0));

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

        
    }
}