using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTraiCay
{
    public partial class ManageFruit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["role"] == null || Session["role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCategory();
                LoadFruit();
                LoadStats();
                LoadStatus();
            }
        }
        void LoadStatus()
        {
            string conn = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            SqlConnection con = new SqlConnection(conn);

            string sql = "SELECT COUNT(*) FROM Fruits WHERE StockQuantity > 0";

            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            if (count > 0)
                lblStatus.Text = "Đang bán";
            else
                lblStatus.Text = "Hết hàng";
        }
        void LoadStats()
        {
            string conn = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            SqlConnection con = new SqlConnection(conn);

            string sql = "SELECT COUNT(*) FROM Fruits";

            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            lblTotalProducts.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }
        void LoadCategory()
        {
            SqlDataSource ds = new SqlDataSource();

            ds.ConnectionString = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            ds.SelectCommand = "SELECT CategoryID, CategoryName FROM Categories";

            DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);

            ddlCat.DataSource = dv;
            ddlCat.DataTextField = "CategoryName";
            ddlCat.DataValueField = "CategoryID";
            ddlCat.DataBind();
        }

        void LoadFruit()
        {
            SqlDataSource ds = new SqlDataSource();

            ds.ConnectionString = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            ds.SelectCommand = "SELECT * FROM Fruits";

            gvFruits.DataSource = ds;

            gvFruits.DataBind();


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            decimal price = Convert.ToDecimal(txtPrice.Text);
            string brand = txtBrand.Text;
            string desc = txtDesc.Text;
            int cat = Convert.ToInt32(ddlCat.SelectedValue);

            string path = "";

            if (fuImage.HasFile)
            {
                string filename = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fuImage.FileName);
                path = "images/" + filename;
                fuImage.SaveAs(Server.MapPath(path));
            }

            SqlDataSource ds = new SqlDataSource();
            ds.ConnectionString = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            ds.InsertCommand =
            "INSERT INTO Fruits(FruitName,Price,Brand,Description,ImagePath,CategoryID) VALUES(@n,@p,@b,@d,@i,@c)";

            ds.InsertParameters.Add("n", name);
            ds.InsertParameters.Add("p", price.ToString());
            ds.InsertParameters.Add("b", brand);
            ds.InsertParameters.Add("d", desc);
            ds.InsertParameters.Add("i", path);
            ds.InsertParameters.Add("c", cat.ToString());

            ds.Insert();

            lblMessage.Text = "✔ Thêm sản phẩm thành công";

            LoadFruit();
        }
        protected void gvFruits_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFruits.EditIndex = e.NewEditIndex;
            LoadFruit();
        }
        protected void gvFruits_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFruits.EditIndex = -1;
            LoadFruit();
        }
        protected void gvFruits_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvFruits.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvFruits.Rows[e.RowIndex];

            string name = ((TextBox)row.FindControl("txtEditName")).Text;
            decimal price = Convert.ToDecimal(((TextBox)row.FindControl("txtEditPrice")).Text);
            string brand = ((TextBox)row.FindControl("txtEditBrand")).Text;
            int stock = Convert.ToInt32(((TextBox)row.FindControl("txtEditStock")).Text);

            string conn = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conn))
            {
                string sql = "UPDATE Fruits SET FruitName=@name, Price=@price, Brand=@brand, StockQuantity=@stockquantity WHERE FruitID=@id";
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@brand", brand);
                cmd.Parameters.AddWithValue("@stockquantity", stock);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvFruits.EditIndex = -1;
            LoadFruit();
        }
        protected void gvFruits_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvFruits.DataKeys[e.RowIndex].Value);

            string conn = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conn))
            {
                string sql = "DELETE FROM Fruits WHERE FruitID=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadFruit();
        }
    }
}