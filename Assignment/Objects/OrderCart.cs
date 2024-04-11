using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment.Objects
{
    public class OrderCart
    {
        public int figureID {  get; set; }
        public string figureName {  get; set; }
        public decimal figurePrice { get; set; }
        public string figureSeries {  get; set; }
        public string figureImage1 { get; set; }
        public int selectedQuantity {  get; set; }

        public OrderCart(int figureID, string figureName, decimal figurePrice, string figureSeries, string figureImage1, int selectedQuantity) {
            this.figureID = figureID;
            this.figureName = figureName;
            this.figurePrice = figurePrice;
            this.figureSeries = figureSeries;
            this.figureImage1 = figureImage1;
            this.selectedQuantity = selectedQuantity;

        }

        public int getFigureID()
        {
            return figureID;
        }

        public string getFigureName()
        {
            return figureName;
        }
        public void setFigureName(string figureName)
        {
            this.figureName=figureName;
        }
        public decimal getFigurePrice()
        {
            return figurePrice;
        }
        public void setFigurePrice(decimal figurePrice)
        {
            this.figurePrice = figurePrice;
        }
        public string getFigureSeries()
        {
            return figureSeries;
        }
        public void setFigureSeries(string figureSeries)
        {
            this.figureSeries=figureSeries;
        }

        public string getFigureImage1()
        {
            return figureImage1;
        }

        public void setFigureImage1(string figureImage)
        {
            this.figureImage1 = figureImage;
        }
        public int getQuantity()
        {
            return selectedQuantity;
        }
        public void setQuantity(int selectedQuantity)
        {
            this.selectedQuantity= selectedQuantity;
        }
    }
}