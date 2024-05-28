using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CARS.Admin
{
    public partial class Blog : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            Session["ArticleTitle"] = "Add Article";
            if (!IsPostBack)
            {
                fillData();
            }
        }

        private void fillData()
        {
            if (Request.QueryString["id"] != null)
            {
                con = new SqlConnection(str);
                query = "Select * from Articles where ArticleId = '" + Request.QueryString["id"] + "'";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtArticleTitle.Text = sdr["ArticleTitle"].ToString();
                        txtArticle.Text = sdr["Article"].ToString();
                        ddlArticleCategory.SelectedValue = sdr["ArticleCategory"].ToString();
                        btnAdd.Text = "Update";
                        linkBack.Visible = true;
                        Session["ArticleId"] = "Edit Article";
                    }
                }
                else
                {
                    lblMsg.Text = "Car not found...";
                    lblMsg.CssClass = "alert alert-danger";
                }

                sdr.Close();
                con.Close();

            }

        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string type, concatQuery, imagePath = string.Empty;
                bool isValidToExecute = false;
                con = new SqlConnection(str);

                //UPDATE
                if (Request.QueryString["id"] != null)
                {
                    if (fuArticlePhoto.HasFile)
                    {
                        if (IsValidExtension(fuArticlePhoto.FileName))
                        {
                            concatQuery = "ArticlePhotos = @ArticlePhotos"; ;
                        }
                        else
                        {
                            concatQuery = string.Empty;
                        }

                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }
                    query = @"Update Articles set  ArticleTitle=@ArticleTitle, Article=@Article, ArticleCategory= @ArticleCategory, ArticlePhotos=@ArticlePhotos, CreatedDate=@CreatedDate  where ArticleId=@id";
                    type = "updated";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ArticleTitle", txtArticleTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Article", txtArticle.Text.Trim());
                    cmd.Parameters.AddWithValue("@ArticleCategory", ddlArticleCategory.SelectedValue);                   
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    // cmd.Parameters.AddWithValue("@CarPhotos", txtCarTitle.Text.Trim());
                    if (fuArticlePhoto.HasFile)
                    {
                        if (IsValidExtension(fuArticlePhoto.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuArticlePhoto.FileName;
                            fuArticlePhoto.PostedFile.SaveAs(Server.MapPath(" ~/Images/") + obj.ToString() + fuArticlePhoto.FileName);
                            cmd.Parameters.AddWithValue("@ArticlePhotos", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, .jpeg, .png file for Article Photo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ArticlePhotos", imagePath);
                        isValidToExecute = true;
                    }
                    cmd.Parameters.AddWithValue("@CreatedDate", time.ToString("yyyy-MM-dd HH:mm:ss"));

                }
                //INSERT
                else
                {
                    query = @"Insert into Articles values(@ArticleTitle, @Article,  @ArticleCategory, @ArticlePhotos, @CreatedDate)";
                    type = "saved";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ArticleTitle", txtArticleTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Article", txtArticle.Text.Trim());
                    cmd.Parameters.AddWithValue("@ArticleCategory", ddlArticleCategory.SelectedValue);
                   
                   
                    //   cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    //  cmd.Parameters.AddWithValue("@CarPhotos", txtCarTitle.Text.Trim());
                    if (fuArticlePhoto.HasFile)
                    {
                        if (IsValidExtension(fuArticlePhoto.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuArticlePhoto.FileName;
                            fuArticlePhoto.PostedFile.SaveAs(Server.MapPath(" ~/Images/") + obj.ToString() + fuArticlePhoto.FileName);
                            cmd.Parameters.AddWithValue("@ArticlePhotos", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, .jpeg, .png file for Article Photo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ArticlePhotos", imagePath);
                        isValidToExecute = true;
                    }
                    cmd.Parameters.AddWithValue("@CreatedDate", time.ToString("yyyy-MM-dd HH:mm:ss"));
                }
                if (isValidToExecute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = "Article" + type + "succesfully...";
                        lblMsg.CssClass = "alert alert-success";
                        clear();
                    }
                    else
                    {
                        lblMsg.Text = "Cannot" + type + "the records, please try after sometime...";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }

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


        private void clear()
        {
            txtArticleTitle.Text = string.Empty;
            txtArticle.Text = string.Empty;
            ddlArticleCategory.ClearSelection();
           

        }

        private bool IsValidExtension(string fileName)
        {
            bool isValid = false;
            string[] fileExtension = { ".jpg", ".png", ".jpeg" };
            for (int i = 0; i <= fileExtension.Length - 1; i++)
            {
                if (fileName.Contains(fileExtension[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }
    }
}