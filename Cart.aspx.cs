using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace OnlineShopping
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ShoppingDBConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Cart", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();

            decimal total = 0;

            foreach (DataRow row in dt.Rows)
            {
                total += Convert.ToDecimal(row["Price"]) * Convert.ToInt32(row["Quantity"]);
            }

            lblTotal.Text = total.ToString();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            con.Open();

            if (e.CommandName == "Plus")
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Cart SET Quantity=Quantity+1 WHERE CartId=@CartId", con);

                cmd.Parameters.AddWithValue("@CartId", e.CommandArgument);
                cmd.ExecuteNonQuery();
            }
            else if (e.CommandName == "Minus")
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Cart SET Quantity=Quantity-1 WHERE CartId=@CartId AND Quantity>1", con);

                cmd.Parameters.AddWithValue("@CartId", e.CommandArgument);
                cmd.ExecuteNonQuery();
            }
            else if (e.CommandName == "DeleteItem")
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Cart WHERE CartId=@CartId", con);

                cmd.Parameters.AddWithValue("@CartId", e.CommandArgument);
                cmd.ExecuteNonQuery();
            }

            con.Close();

            LoadCart();
        }
    }
}