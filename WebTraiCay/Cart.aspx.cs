using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebTraiCay.Models;

namespace WebTraiCay
{
    public partial class Cart : System.Web.UI.Page
    {
        decimal grandTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        void LoadCart()
        {
            List<CartItem> cart = Session["cart"] as List<CartItem>;

            if (cart == null)
            {
                cart = new List<CartItem>();
            }

            string conn = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();

                foreach (var item in cart)
                {
                    string sql = "SELECT FruitName, Price FROM Fruits WHERE FruitID=@id";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@id", item.FruitID);

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        item.FruitName = dr["FruitName"].ToString();
                        item.Price = Convert.ToDecimal(dr["Price"]);
                    }

                    dr.Close();

                    grandTotal += item.TotalPrice;
                }
            }

            rptCart.DataSource = cart;
            rptCart.DataBind();
        }

        protected void rptCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Literal ltr = (Literal)e.Item.FindControl("ltrTotalCart");

                if (ltr != null)
                {
                    ltr.Text = grandTotal.ToString("N0") + " đ";
                }
            }
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            List<CartItem> cart = Session["cart"] as List<CartItem>;

            foreach (RepeaterItem item in rptCart.Items)
            {
                HiddenField hf = (HiddenField)item.FindControl("hfFruitID");
                TextBox txt = (TextBox)item.FindControl("txtQty");

                int id = Convert.ToInt32(hf.Value);
                int qty = Convert.ToInt32(txt.Text);

                CartItem c = cart.Find(x => x.FruitID == id);

                if (c != null)
                {
                    c.Qty = qty;
                }
            }

            Session["cart"] = cart;

            LoadCart();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            List<CartItem> cart = Session["cart"] as List<CartItem>;

            cart.RemoveAll(x => x.FruitID == id);

            Session["cart"] = cart;

            LoadCart();
        }
    }
}