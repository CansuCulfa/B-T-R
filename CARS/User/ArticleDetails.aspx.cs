using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace CARS.User
{
    public partial class ArticleDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt, dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public string ArticleTitle = string.Empty;
        public int commentCount = 0;

         
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                showArticleDetails();
                //list de olabilir
                DataBind();
            }
            else
            {
                Response.Redirect("BlogPage.aspx");
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

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


        protected void ddlArticleCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArticleCategory.SelectedValue != "0")
            {
                con = new SqlConnection(str);
                string query = @"Select ArticleId, ArticleTitle, Article, ArticleCategory, ArticlePhoto, CreatedDate from Articles where ArticleCategory ='" + ddlArticleCategory.SelectedValue + "' ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showArticleList();
               //*RBSelectedColorChange();
            }
            else
            {
                showArticleList();
                //RBSelectedColorChange();
            }
        }

        private void showArticleList()
        {
            if (dt == null)
            {
                con = new SqlConnection(str);
                string query = @"Select  ArticleId, ArticleTitle, Article, ArticleCategory, ArticlePhoto, CreatedDate from Articles";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
            DataList2.DataSource = dt;
            DataList2.DataBind();
            DataList3.DataSource = dt;
            DataList3.DataBind();

        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ReadArticles")
            {
                if (Session["user"] != null)
                {
                    try
                    {
                        con = new SqlConnection(str);
                        string query = @"Insert into ReadArticles values( @ArticleId , @UserId )";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@ArticleId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Article Read successfull";
                            lblMsg.CssClass = "alert alert-success";
                            showArticleDetails();
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Cannot reading articles please try later!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    catch (Exception ex)
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

        protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["user"] != null)
            {
                LinkButton btnReadArticles = e.Item.FindControl("lbReadArticle") as LinkButton;
                if (isRead())
                {
                    btnReadArticles.Enabled = false;
                    btnReadArticles.Text = "Makale daha önce okundu";
                }
                else
                {
                    btnReadArticles.Enabled = true;
                    btnReadArticles.Text = "Makaleyi okundu olarak işaretle";
                }
            }
        }


        bool isRead()
        {
            con = new SqlConnection(str);
            string query = @"Select * from ReadArticles where UserId = @UserId and ArticleId = @ArticleId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.Parameters.AddWithValue("@ArticleId", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);
            if (dt1.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        //{

        //}

        //protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        //{

        //}

        private void showArticleDetails()
        {

            con = new SqlConnection(str);
            string query = @"Select * from Articles where ArticleId = @id";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            DataList2.DataSource = dt;
            DataList2.DataBind();
            DataList3.DataSource = dt;
            DataList3.DataBind();
            ArticleTitle = dt.Rows[0]["ArticleTitle"].ToString();

        }

    }
}