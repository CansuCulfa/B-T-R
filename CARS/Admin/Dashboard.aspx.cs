using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CARS.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            if (!IsPostBack)
            {
                Users();
                Cars();
                AppliedCars();
                ContactCount();
            }
        }

        private void ContactCount()
        {
           con = new SqlConnection(str);
           sda = new SqlDataAdapter("Select Count(*) from [Contact]", con);
           dt = new DataTable();
           sda.Fill(dt);
           if(dt.Rows.Count > 0)
            {
                Session["Contact"] = dt.Rows[0][0];
            }
           else
            {
                Session["Contact"] = 0;
            }
        }

        private void AppliedCars()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from [AppliedCars]", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["AppliedCars"] = dt.Rows[0][0];
            }
            else
            {
                Session["AppliedCars"] = 0;
            }
        }

        private void Cars()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from [Cars]", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Cars"] = dt.Rows[0][0];
            }
            else
            {
                Session["Cars"] = 0;
            }
        }

        private void Users()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from [User]", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Users"] = dt.Rows[0][0];
            }
            else
            {
                Session["Users"] = 0;
            }
        }
    }
}