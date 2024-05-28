using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CARS.User
{
    public partial class CarDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt, dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public string CarTitle = string.Empty;
        protected void Page_Init(object sender, EventArgs e)
        {
            if(Request.QueryString["id"] != null)
            {
                showCarDetails();
                //list de olabilir
                DataBind();
            }
            else
            {
                Response.Redirect("CarListing.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private void showCarDetails()
        {
           
                con = new SqlConnection(str);
                string query = @"Select * from Cars where CarId = @id";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                DataList1.DataSource = dt;
                DataList1.DataBind();
                CarTitle = dt.Rows[0]["CarTitle"].ToString();
            
        }
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

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "ApplyCar")
            {
                if (Session["user"] != null)
                {
                    try
                    {
                        con = new SqlConnection(str);
                        string query = @"Insert into AppliedCars values( @CarId , @UserId )";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@CarId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if(r > 0)
                        {
                            lblMsg.Visible=true;
                            lblMsg.Text = "Car applied successfull";
                            lblMsg.CssClass = "alert alert-success";
                            showCarDetails();
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Cannot apply the car please try later!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    catch(Exception ex)
                    {
                        Response.Write("<scipt>alert('" + ex.Message + "');</scipt>");
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["user"] != null)
            {
                LinkButton btnApplyCar = e.Item.FindControl("lbApplyCar") as LinkButton;
                if (isApplied())
                {
                    btnApplyCar.Enabled = false;
                    btnApplyCar.Text = "Görüşme talebi alındı";
                }
                else
                {
                    btnApplyCar.Enabled = true;
                    btnApplyCar.Text = "Araç için görüşme talebi al";
                }
            }
        }

        bool isApplied()
        {
            con = new SqlConnection(str);
            string query = @"Select * from AppliedCars where UserId = @UserId and CarId = @CarId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.Parameters.AddWithValue("@CarId", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);
            if(dt1.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}