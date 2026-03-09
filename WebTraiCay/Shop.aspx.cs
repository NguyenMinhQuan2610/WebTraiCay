using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebTraiCay.Models;

namespace WebTraiCay
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { if (!IsPostBack) { lvProducts.DataBind(); } }

        protected void btnSearch_Click(object sender, EventArgs e) { lvProducts.DataBind(); }

        protected void btnAddToCart_Command(object sender, CommandEventArgs e)
        {
            if (Session["username"] == null) { Response.Redirect("Login.aspx"); return; }
            int id = Convert.ToInt32(e.CommandArgument);
            List<CartItem> cart = Session["cart"] as List<CartItem>;
            if (cart == null) { cart = new List<CartItem>(); }
            CartItem item = cart.Find(x => x.FruitID == id);
            if (item != null) { item.Qty++; } else { cart.Add(new CartItem { FruitID = id, Qty = 1 }); }
            Session["cart"] = cart;
            MasterPage master = (MasterPage)this.Master;
            if (master != null) { master.UpdateCartCount(); }
        }

        protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pager = (DataPager)lvProducts.FindControl("DataPager1");
            pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            lvProducts.DataBind();
        }
    }
}