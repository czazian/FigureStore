using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment.Objects
{
    public class ShoppingCart
    {
        protected List<OrderCart> figure;
        public int numberOfItems = 0;

        public ShoppingCart()
        {
            figure = new List<OrderCart>();
        }

        public List<OrderCart> getCartItems()
        {
            return figure;
        }


        public void addItem(OrderCart newItem)
        {

            //Loop through a list, until the last item, or until a match item found
            foreach (OrderCart currentItem in figure)
            {
                //If there is any match elements, the quantity of the book will increase based on the customer new entered quantity
                if (currentItem.figureID.Equals(newItem.figureID))
                {
                    System.Diagnostics.Debug.WriteLine("This is equal objects");
                    currentItem.selectedQuantity += newItem.selectedQuantity;

                    //Return since, everytime, only added one book. The book is found, so stop it.
                    return;
                }
            }


            //If the book is not found / it is the first item, baru add into the cart
            figure.Add(newItem);
            numberOfItems++;
            System.Diagnostics.Debug.WriteLine("This is not equal objects");
        }

        public void removeItem(int figureID)
        {
            for (int i = 0; i < figure.Count; i++)
            {
                {
                    if (figure[i].figureID.Equals(figureID))
                    {
                        figure.RemoveAt(i);
                        return;
                    }
                }
            }
        }

        public decimal calculate(int figureID, int qty)
        {
            decimal total = 0;
            foreach (OrderCart currentItem in figure)
            {
                if (currentItem.figureID.Equals(figureID))
                {
                    total = currentItem.figurePrice * qty;
                }
            }

            return total;
        }
    }
}