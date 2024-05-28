using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CARS.User
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public string CarTitle = string.Empty;

       
        protected void Page_Load(object sender, EventArgs e)
        {
            showCarList();
        }

        private void showCarList()
        {
            if (dt == null)
            {
                con = new SqlConnection(str);
                string query = @"Select CarId, CarTitle, CarModelYear, CarGearShift, Brand, Model, Country, CreatedDate, NoOfPost, CarPhotos from Cars";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        //private void showCarDetails()
        //{

        //    con = new SqlConnection(str);
        //    string query = @"Select * from Cars where CarId = @id";
        //    cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    sda.Fill(dt);
        //    DataList1.DataSource = dt;
        //    DataList1.DataBind();
        //    CarTitle = dt.Rows[0]["CarTitle"].ToString();

        //}

        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);
        }


    }
}