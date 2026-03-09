using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTraiCay
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rptFruits_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void btnAdd_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            var cart = Session["cart"] as List<int> ?? new List<int>();
            cart.Add(id);
            Session["cart"] = cart;
        }

    }
}