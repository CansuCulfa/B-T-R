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
    public partial class ArticleLİst : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            if (!IsPostBack)
            {
                ShowArticle();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowArticle();
        }

        private void ShowArticle()
        {
            string query = string.Empty;
            con = new SqlConnection(str);
            query = @"Select Row_Number() over(Order by (Select 1)) as [Sr.No], ArticleId, ArticleTitle, Article, ArticleCategory, CreatedDate from Articles";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowArticle();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int articleId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                con = new SqlConnection(str);
                cmd = new SqlCommand("Delete from Articles where ArticleId = @id", con);
                cmd.Parameters.AddWithValue("@id", articleId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 1)
                {
                    lblMsg.Text = "Cannot delete this record";
                    lblMsg.CssClass = "alert alert-danger";
                }
                else
                {
                    lblMsg.Text = "Article deleted successfully";
                    lblMsg.CssClass = "alert alert-success";
                }

                GridView1.EditIndex = -1;
                ShowArticle();
            }
            catch (Exception ex)
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
            if (e.CommandName == "EditArticle")
            {
                Response.Redirect("Blog.aspx?id=" + e.CommandArgument.ToString());

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}
