using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineShopping
{
    public partial class Home : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["ShoppingDBConnection"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadProducts();
            }

            if (Session["Username"] != null)
            {
                lblUser.Text = "Welcome " + Session["Username"].ToString();
                lnkLogin.Visible = false;
            }
            else
            {
                lblUser.Text = "";
                lnkLogin.Visible = true;
            
        }

        }



        // Display all products

        private void LoadProducts()
        {

            SqlDataAdapter da = new SqlDataAdapter(
            "SELECT *, '~/Image/' + ProductName + '.jpg' AS ImagePath1 FROM Products",
            con);


            DataTable dt = new DataTable();

            da.Fill(dt);


            DataList1.DataSource = dt;

            DataList1.DataBind();

        }



        // Search Product or Category

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            SqlDataAdapter da = new SqlDataAdapter(

            @"SELECT *, '~/Image/' + ProductName + '.jpg' AS ImagePath1 
            FROM Products
            WHERE ProductName LIKE @search
            OR Category LIKE @search",

            con);



            da.SelectCommand.Parameters.AddWithValue(
            "@search",
            "%" + txtSearch.Text + "%");



            DataTable dt = new DataTable();


            da.Fill(dt);


            DataList1.DataSource = dt;

            DataList1.DataBind();

        }




        // Add Product To Cart

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if (e.CommandName == "AddCart")
            {


                int id = Convert.ToInt32(e.CommandArgument);



                SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Products WHERE Id=@Id",
                con);


                cmd.Parameters.AddWithValue("@Id", id);



                con.Open();



                SqlDataReader dr = cmd.ExecuteReader();



                if (dr.Read())
                {

                    string pname = dr["ProductName"].ToString();

                    string category = dr["Category"].ToString();

                    decimal price = Convert.ToDecimal(dr["Price"]);


                    string image = "~/Image/" + pname + ".jpg";


                    dr.Close();



                    SqlCommand cmd1 = new SqlCommand(

                    @"INSERT INTO Cart
                    (ProductId,ProductName,Category,Price,ImagePath,Quantity)
                    VALUES
                    (@ProductId,@ProductName,@Category,@Price,@ImagePath,@Quantity)",

                    con);



                    cmd1.Parameters.AddWithValue("@ProductId", id);

                    cmd1.Parameters.AddWithValue("@ProductName", pname);

                    cmd1.Parameters.AddWithValue("@Category", category);

                    cmd1.Parameters.AddWithValue("@Price", price);

                    cmd1.Parameters.AddWithValue("@ImagePath", image);

                    cmd1.Parameters.AddWithValue("@Quantity", 1);



                    cmd1.ExecuteNonQuery();



                    Response.Write("<script>alert('Product Added To Cart');</script>");

                }


                con.Close();

            }

        }

    }
}