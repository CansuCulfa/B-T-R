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
    public partial class BlogPage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public int articleCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showArticleList();
                RBSelectedColorChange();
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
            lblarticleCount.Text = ArticleCount(dt.Rows.Count);
        }


        string ArticleCount(int count)
        {
            if (count > 1)
            {
                return "Total <b>" + count + "</b> Articles found";
            }
            else if (count == 1)
            {
                return "Total <b>" + count + "</b>  Article found";
            }
            else
            {
                return "No article found";
            }
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


        // Getting RelativeDate for given date like -- '1 month ago'

        public static string RelativeDate(DateTime theDate)

        {

            Dictionary<long, string> thresholds = new Dictionary<long, string>();

            int minute = 60;

            int hour = 60 * minute;

            int day = 24 * hour;

            thresholds.Add(60, "{0} seconds ago");

            thresholds.Add(minute * 2, "a minute ago");

            thresholds.Add(45 * minute, "{0} minutes ago");

            thresholds.Add(120 * minute, "an hour ago");

            thresholds.Add(day, "{0} hours ago");

            thresholds.Add(day * 2, "yesterday");

            thresholds.Add(day * 30, "{0} days ago");

            thresholds.Add(day * 365, "{0} months ago");

            thresholds.Add(long.MaxValue, "{0} years ago");

            long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;

            foreach (long threshold in thresholds.Keys)

            {

                if (since < threshold)

                {

                    TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));

                    return string.Format(thresholds[threshold], (t.Days > 365 ? t.Days / 365 : (t.Days > 0 ? t.Days : (t.Hours > 0 ? t.Hours : (t.Minutes > 0 ? t.Minutes : (t.Seconds > 0 ? t.Seconds : 0))))).ToString());

                }

            }

            return "";

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ArticleCategory = string.Empty;
            //ArticleCategory = SelectedCheckBox();
            if (ArticleCategory != "")
            {
                con = new SqlConnection(str);
                string query = @"Select ArticleId, ArticleTitle, Article, ArticleCategory, ArticlePhoto, CreatedDate from Articles where ArticleCategory IN ( 'Haberler' , 'Testler' , 'Otomobille Yaşam' , 'Elektrikli Dünyası' , 'Danışman' ) ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showArticleList();
                RBSelectedColorChange();
            }
            else
            {
                showArticleList();
            }
        }

        void RBSelectedColorChange()
        {
            if (RadioButtonList2.SelectedItem.Selected == true)
            {
                RadioButtonList2.SelectedItem.Attributes.Add("class", "selectedradio");
            }
        }

        string SelectedRadioButton()
        {
            string PostedDate = string.Empty;
            DateTime date = DateTime.Today;
            if (RadioButtonList2.SelectedValue == "1")
            {
                PostedDate = "= Convert(DATE, '" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList2.SelectedValue == "2")
            {
                PostedDate = " between Convert(DATE, '" + DateTime.Now.AddDays(-2).ToString("yyyy/MM/dd") + "') and Convert(DATE, '" + date.ToString("yyyy/MM/dd") + "' ) ";
            }
            else if (RadioButtonList2.SelectedValue == "3")
            {
                PostedDate = " between Convert(DATE, '" + DateTime.Now.AddDays(-3).ToString("yyyy/MM/dd") + "') and Convert(DATE, '" + date.ToString("yyyy/MM/dd") + "' ) ";
            }
            else if (RadioButtonList2.SelectedValue == "4")
            {
                PostedDate = " between Convert(DATE, '" + DateTime.Now.AddDays(-5).ToString("yyyy/MM/dd") + "') and Convert(DATE, '" + date.ToString("yyyy/MM/dd") + "' ) ";
            }
            else
            {
                PostedDate = " between Convert(DATE, '" + DateTime.Now.AddDays(-10).ToString("yyyy/MM/dd") + "') and Convert(DATE, '" + date.ToString("yyyy/MM/dd") + "' ) ";
            }
            return PostedDate;
        }


        //string SelectedCheckBox()
        //{
        //    string ArticleCategory = string.Empty;
        //    for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        //    {
        //        if (CheckBoxList1.Items[i].Selected)
        //        {
        //            ArticleCategory = "'" + CheckBoxList1.Items[i].Text + " ' , "; // otomatik manuel 
        //        }

        //    }
        //    return ArticleCategory = ArticleCategory.TrimEnd(',');
        //}


        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (RadioButtonList2.SelectedValue != "0")
            {
                string PostedDate = string.Empty;
                PostedDate = SelectedRadioButton();
                con = new SqlConnection(str);
                string query = @"Select ArticleId, ArticleTitle, Article, ArticleCategory, ArticlePhoto, CreatedDate from Articles where Convert(DATE,CreatedDate)" + PostedDate + " ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showArticleList();
                RBSelectedColorChange();
            }
            else
            {
                showArticleList();
                RBSelectedColorChange();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCondition = false;
                string subquery = string.Empty;
                string ArticleCategory = string.Empty;
                string PostedDate = string.Empty;
                string addAnd = string.Empty;
                string query = string.Empty;
                List<string> queryList = new List<string>();
                con = new SqlConnection(str);

                if (ddlArticleCategory.SelectedValue != "0")
                {
                    queryList.Add(" ArticleCategory = '" + ddlArticleCategory.SelectedValue + "'");
                    isCondition = true;
                }
                //ArticleCategory = SelectedCheckBox();

                if (ArticleCategory != "")
                {
                    queryList.Add(" ArticleCategory IN (" + ArticleCategory + ")");
                    isCondition = true;
                }
                if (RadioButtonList2.SelectedValue != "0")
                {
                    PostedDate = SelectedRadioButton();
                    queryList.Add(" Convert(DATE, CreatedDate)" + ArticleCategory);
                    isCondition = true;
                }
                if (isCondition)
                {
                    foreach (string a in queryList)
                    {
                        subquery += a + "and"; // country and car gear shift and
                    }
                    subquery = subquery.Remove(subquery.LastIndexOf("and"), 3);
                    query = @"Select ArticleId, ArticleTitle, Article, ArticleCategory, ArticlePhoto, CreatedDate from ArticleCategory where" + subquery + "";
                }
                else
                {
                    query = @"Select ArticleId, ArticleTitle, Article, ArticleCategory, ArticlePhoto, CreatedDate from ArticleCategory";
                }
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                dt = new DataTable();
                sda.Fill(dt);
                showArticleList();
                RBSelectedColorChange();
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

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            // reset
            ddlArticleCategory.ClearSelection();
            //CheckBoxList1.ClearSelection();
            RadioButtonList2.SelectedValue = "0";
            RBSelectedColorChange();
            showArticleList();        }

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
                RBSelectedColorChange();
            }
            else
            {
                showArticleList();
                RBSelectedColorChange();
            }
        }
    }
}