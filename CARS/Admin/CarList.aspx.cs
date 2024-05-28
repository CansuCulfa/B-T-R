using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CARS.Admin
{
    public partial class CarList : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_PreRender(object sender, EventArgs e)
        {
            // sadece adminin girş yapabilmesi için, sayfa yüklenmeden yönlendirme
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            if (!IsPostBack)
            {
                ShowCar();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowCar();
        }
  
        private void ShowCar()
        {
            // arabaları listelemek için. SQL sorgusu ile db den arabaların bilgilerini çekeriz. verileri gridviewe bağlarız.
            string query = string.Empty;
            con = new SqlConnection(str);
            query = @"Select Row_Number() over(Order by (Select 1)) as [Sr.No], CarId, CarTitle, NoOfPost, Description, CarModelYear, CarKm, CarEnginePower,
              CarEngineDisplacement, CarFuelType, CarGearShift, CarChassisType, CarStatus, Swap, SevereDamage, Brand, Model, Traction, Color, Email, TelephoneNo, Country, CreatedDate from Cars";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           // sayfa değiştirildiğinde yeniden listelemek için
            GridView1.PageIndex = e.NewPageIndex;
            ShowCar();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // araba db den silinir. ve uyarı mesajı gelir
            try
            {
                GridViewRow row  = GridView1.Rows[e.RowIndex];
                int carId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                con = new SqlConnection(str);
                cmd = new SqlCommand("Delete from Cars where CarId = @id", con);
                cmd.Parameters.AddWithValue("@id", carId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Text = "Car deleted successfully";
                    lblMsg.CssClass = "alert alert-success"; 
                }
                else
                {
                    lblMsg.Text = "Cannot delete this record";
                    lblMsg.CssClass = "alert alert-danger";
                }
                
                GridView1.EditIndex = -1;
                ShowCar();
            }
            catch(Exception ex)
            {
                
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //edit car butonuna tıklandığında seçilen arabayı editleriz
            if(e.CommandName== "EditCar")
            {
                Response.Redirect("NewCar.aspx?id=" + e.CommandArgument.ToString());

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}