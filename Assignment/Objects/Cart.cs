using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment.Objects
{
    public class Cart
    {
        public int figureID {  get; set; }
        public string figureName {  get; set; }
        public decimal figurePrice { get; set; }
        public string figureSeries {  get; set; }
        public string figureImage { get; set; }
        public int selectedQuantity {  get; set; }

        public Cart(int figureID, string figureName, decimal figurePrice, string figureSeries, string figureImage, int selectedQuantity) {
            this.figureID = figureID;
            this.figureName = figureName;
            this.figurePrice = figurePrice;
            this.figureSeries = figureSeries;
            this.figureImage = figureImage;
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

        public string getFigureImage()
        {
            return figureImage;
        }

        public void setFigureImage(string figureImage)
        {
            this.figureImage = figureImage;
        }
        public int getSelectedQuantity()
        {
            return selectedQuantity;
        }
        public void setSelectedQuantity(int selectedQuantity)
        {
            this.selectedQuantity= selectedQuantity;
        }
    }
}