using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CARS.User
{
    public partial class CarListing : System.Web.UI.Page

    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public int carCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //  sayfa postback değilse, fonksiyonları çağırır.
            if (!IsPostBack)
            {
                showCarList();
                RBSelectedColorChange();
            } 
        }

        private void showCarList()
        {
           // list metodu. db den listeyi çeker datalist kontrolüne bağlar ve listeler
            if (dt == null)
            {
                con = new SqlConnection(str);
                string query = @"Select CarId, CarTitle, CarModelYear, CarGearShift, Brand, Model, Country, CreatedDate, NoOfPost, CarPhotos from Cars";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
            DataList2.DataSource = dt;
            DataList2.DataBind();
            lblcarCount.Text = CarCount(dt.Rows.Count);
        }

        string CarCount(int count)
        {
            //toplam araba sayısını görüntüleme
            if(count > 1)
            {
                return "Total <b>" + count + "</b> cars found";
            }
            else if(count == 1)
            {
                return "Total <b>" + count + "</b> car found";
            }
            else
            {
                return "No car found";
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            // dropdown listesi seçilince çalışır. seçilene göre araba listesini getirir.
            if (ddlCountry.SelectedValue != "0")
            {
                con = new SqlConnection(str);
                string query = @"Select CarId, CarTitle, CarModelYear, CarGearShift, Brand, Model, Country, CreatedDate,NoOfPost, CarPhotos from Cars where Country ='" + ddlCountry.SelectedValue + "' ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showCarList();
                RBSelectedColorChange();
            }
            else
            {
                showCarList();
                RBSelectedColorChange();
            }
        }
        protected string GetImageUrl(Object url)
        {
            // Resim URL'si alır. Eğer URL boşsa veya null ise, varsayılan resim URL'sini döndürür.
            string url1 = "";
            if(string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
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
            // verilen tarihin ne kadar önce lduğunu hesaplar. metin üretir.
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

        protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // vites tipi check box listesi. 
            string CarGearShift = string.Empty;
            CarGearShift = SelectedCheckBox();
            if (CarGearShift != "")
            {
                con = new SqlConnection(str);
                string query = @"Select CarId, CarTitle, CarModelYear, CarGearShift, Brand, Model, Country, CreatedDate, NoOfPost, CarPhotos from Cars where CarGearShift IN ( 'Manual' , 'Automatic' , 'H-Automatic') ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showCarList();
                RBSelectedColorChange();
            }
            else
            {
                showCarList();
            }
        }

        string SelectedCheckBox()
        {
            // seçilen seçenek.
            string CarGearShift = string.Empty;
            for (int i =0; i < CheckBoxList2.Items.Count; i++)
            {
                if (CheckBoxList2.Items[i].Selected)
                {
                     CarGearShift = "'" + CheckBoxList2.Items[i].Text + " ' , "; // otomatik manuel 
                }
               
            }
            return CarGearShift = CarGearShift.TrimEnd(',');
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // seçilen tarihe göre araba listesini yeniden getirir.
            if (RadioButtonList2.SelectedValue != "0")
            {
                string PostedDate = string.Empty;
                PostedDate = SelectedRadioButton();
                con = new SqlConnection(str);
                string query = @"Select CarId, CarTitle, CarModelYear, CarGearShift, Brand, Model, Country, CreatedDate, NoOfPost, CarPhotos from Cars where Convert(DATE,CreatedDate)" + PostedDate + " ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showCarList();
                RBSelectedColorChange();
            }
            else
            {
                showCarList();
                RBSelectedColorChange();
            }
        }

        string SelectedRadioButton()
        {
            // seçilen radio butonu 
            string PostedDate = string.Empty;
            DateTime date = DateTime.Today;
            if(RadioButtonList2.SelectedValue == "1")
            {
                PostedDate = "= Convert(DATE, '" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if(RadioButtonList2.SelectedValue == "2")
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // filter
            try
            {
                bool isCondition = false;
                string subquery = string.Empty;
                string CarGearShift = string.Empty;
                string PostedDate = string.Empty;
                string addAnd = string.Empty;
                string query = string.Empty;
                List<string> queryList = new List<string>();
                con = new SqlConnection(str);

                if(ddlCountry.SelectedValue != "0")
                {
                    queryList.Add(" Country = '" + ddlCountry.SelectedValue + "'");
                    isCondition = true;
                }
                CarGearShift = SelectedCheckBox();

                if(CarGearShift != "")
                {
                    queryList.Add(" CarGearShift IN (" + CarGearShift + ")");
                    isCondition = true;
                }
                if(RadioButtonList2.SelectedValue != "0")
                {
                    PostedDate = SelectedRadioButton();
                    queryList.Add(" Convert(DATE, CreatedDate)" + CarGearShift);
                    isCondition = true;
                }
                if (isCondition)
                {
                    foreach(string a in queryList)
                    {
                        subquery += a + "and"; // country and car gear shift and
                    }
                    subquery = subquery.Remove(subquery.LastIndexOf("and"), 3);
                    query = @"Select CarId, CarTitle, CarModelYear, CarGearShift, Brand, Model, Country, CreatedDate, NoOfPost, CarPhotos from Cars where" + subquery + "";
                }
                else
                {
                    query = @"Select CarId, CarTitle, CarModelYear, CarGearShift, Brand, Model, Country, CreatedDate, NoOfPost, CarPhotos from Cars";
                }
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                dt = new DataTable();
                sda.Fill(dt);
                showCarList();
                RBSelectedColorChange();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" +ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            // reset
            ddlCountry.ClearSelection();
            CheckBoxList2.ClearSelection();
            RadioButtonList2.SelectedValue = "0";
            RBSelectedColorChange();
            showCarList();
        }

        void RBSelectedColorChange()
            // seçilen butonun rengini değiştirir.
        {
            if(RadioButtonList2.SelectedItem.Selected == true)
            {
                RadioButtonList2.SelectedItem.Attributes.Add("class", "selectedradio");
            }
        }
    }
}