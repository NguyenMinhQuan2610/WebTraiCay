using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebTraiCay.Models;

namespace WebTraiCay
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateCartCount();
            var cart = Session["cart"] as List<WebTraiCay.Models.CartItem>;

            if (cart != null)
            {
                lblCartCount.Text = cart.Sum(x => x.Qty).ToString();
                lblCartCount.Visible = true;
            }

            if (Session["username"] != null)
            {
                string user = Session["username"].ToString();
                lblUser.Text = user;
                lnkLogout.Visible = true;
                if (user == "admin")
                {
                    lnkUser.NavigateUrl = "ManageFruit.aspx"; 
                }
                else
                {
                    lnkUser.NavigateUrl = "Cart.aspx"; 
                }
            }
            else
            {
                lblUser.Text = "Login";
                lnkUser.NavigateUrl = "Login.aspx";
                lnkLogout.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        public void UpdateCartCount()
        {
            List<CartItem> cart = Session["cart"] as List<CartItem>;

            int total = 0;

            if (cart != null)
                total = cart.Sum(x => x.Qty);

            lblCartCount.Text = total.ToString();
            lblCartCount.Visible = total > 0;
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

    }
}