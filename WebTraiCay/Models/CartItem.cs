using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebTraiCay.Models
{
    public class CartItem
    {
        public int FruitID { get; set; }

        public string FruitName { get; set; }

        public decimal Price { get; set; }

        public int Qty { get; set; }

        public decimal TotalPrice
        {
            get { return Price * Qty; }
        }
    }
}