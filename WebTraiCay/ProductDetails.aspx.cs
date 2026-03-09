using System;
using System.Collections.Generic;
using System.Web.UI;
using WebTraiCay.Models;

namespace WebTraiCay
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int id = Convert.ToInt32(Request.QueryString["id"]);

            List<CartItem> cart = Session["cart"] as List<CartItem>;

            if (cart == null)
            {
                cart = new List<CartItem>();
            }

            CartItem item = cart.Find(x => x.FruitID == id);

            if (item != null)
            {
                item.Qty++;
            }
            else
            {
                cart.Add(new CartItem
                {
                    FruitID = id,
                    Qty = 1
                });
            }

            Session["cart"] = cart;

            Response.Redirect("Cart.aspx");
        }
    }
}