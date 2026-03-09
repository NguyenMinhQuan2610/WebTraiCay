using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTraiCay
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["FruitShopDB"].ConnectionString;

            SqlConnection con = new SqlConnection(conn);

            string sql = "SELECT * FROM Users WHERE Username=@u AND Password=@p";

            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@u", txtUser.Text);
            cmd.Parameters.AddWithValue("@p", txtPass.Text);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["username"] = dr["Username"].ToString();
                Session["role"] = dr["Role"].ToString();

                string role = dr["Role"].ToString();

                if (role == "Admin")
                {
                    Response.Redirect("Shop.aspx"); 
                }
                else
                {
                    Response.Redirect("Shop.aspx");
                }
            }
            else
            {
                lblMsg.Text = "Sai tài khoản hoặc mật khẩu";
            }

            con.Close();
        }
    }
}