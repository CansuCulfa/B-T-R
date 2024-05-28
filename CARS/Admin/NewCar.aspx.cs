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
    public partial class NewCar : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"]== null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            Session["CarTitle"] = "Add Car";
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
                query = "Select * from Cars where CarId = '" + Request.QueryString["id"] + "'";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtCarTitle.Text = sdr["CarTitle"].ToString();
                        txtNoOfPost.Text = sdr["NoOfPost"].ToString();
                        txtDescription.Text = sdr["Description"].ToString();
                        txtCarModelYear.Text = sdr["CarModelYear"].ToString();
                        txtCarKm.Text = sdr["CarKm"].ToString();
                        txtCarEnginePower.Text = sdr["CarEnginePower"].ToString();
                        txtCarEngineDisplacement.Text = sdr["CarEngineDisplacement"].ToString();
                        txtCarFuelType.Text = sdr["CarFuelType"].ToString();
                        txtCarGearShift.Text = sdr["CarGearShift"].ToString();
                        txtCarChassisType.Text = sdr["CarChassisType"].ToString();
                        txtCarStatus.Text = sdr["CarStatus"].ToString();
                        txtSwap.Text = sdr["Swap"].ToString();
                        txtSevereDamage.Text = sdr["SevereDamage"].ToString();
                        txtBrand.Text = sdr["Brand"].ToString();
                        txtModel.Text = sdr["Model"].ToString();
                        txtTraction.Text = sdr["Traction"].ToString();
                        txtColor.Text = sdr["Color"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtTelephoneNo.Text = sdr["TelephoneNo"].ToString();
                        ddlCountry.SelectedValue = sdr["Country"].ToString();
                        btnAdd.Text = "Update";
                        linkBack.Visible = true;
                        Session["CarId"] = "Edit Car";
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
                string type,concatQuery, imagePath = string.Empty;
                bool isValidToExecute = false;
                con = new SqlConnection(str);

                //UPDATE
                // urldeki id paramteresi alınır
                if (Request.QueryString["id"] != null)
                {
                    if (fuCarPhoto.HasFile)
                    {
                        if (IsValidExtension(fuCarPhoto.FileName))
                        {
                            concatQuery = "CarPhotos = @CarPhotos"; ;
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
                    // addwithvalue metodu sql sorgusundaki parametrelerdeki değerlerde ilişkilendiriyor
                    query = @"Update Cars set  CarTitle=@CarTitle, NoOfPost=@NoOfPost, Description=@Description,CarModelYear=@CarModelYear,CarKm=@CarKm,CarEnginePower=@CarEnginePower,CarEngineDisplacement=@CarEngineDisplacement,CarFuelType=@CarFuelType,CarGearShift=@CarGearShift,CarChassisType=@CarChassisType, CarStatus=@CarStatus, Swap=@Swap, SevereDamage=@SevereDamage, Brand=@Brand, Model=@Model, Traction=@Traction, Color=@Color, Email=@Email, TelephoneNo=@TelephoneNo, CreatedDate= @CreatedDate, Country= @Country, CarPhotos=@CarPhotos where CarId=@id";
                    type = "updated";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@CarTitle", txtCarTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@NoOfPost", txtNoOfPost.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarModelYear", txtCarModelYear.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarKm", txtCarKm.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarEnginePower", txtCarEnginePower.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarEngineDisplacement", txtCarEngineDisplacement.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarFuelType", txtCarFuelType.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarGearShift", txtCarGearShift.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarChassisType", txtCarChassisType.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarStatus", txtCarStatus.Text.Trim());
                    cmd.Parameters.AddWithValue("@Swap", txtSwap.Text.Trim());
                    cmd.Parameters.AddWithValue("@SevereDamage", txtSevereDamage.Text.Trim());
                    cmd.Parameters.AddWithValue("@Brand", txtBrand.Text.Trim());
                    cmd.Parameters.AddWithValue("@Model", txtModel.Text.Trim());
                    cmd.Parameters.AddWithValue("@Traction", txtTraction.Text.Trim());
                    cmd.Parameters.AddWithValue("@Color", txtColor.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@TelephoneNo", txtTelephoneNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@CreatedDate", time.ToString("yyyy-MM-dd HH:mm:ss"));
                    cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    // cmd.Parameters.AddWithValue("@CarPhotos", txtCarTitle.Text.Trim());
                    if (fuCarPhoto.HasFile)
                    {
                        if (IsValidExtension(fuCarPhoto.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCarPhoto.FileName;
                            fuCarPhoto.PostedFile.SaveAs(Server.MapPath(" ~/Images/") + obj.ToString() + fuCarPhoto.FileName);
                            cmd.Parameters.AddWithValue("@CarPhotos", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, .jpeg, .png file for Car Photo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CarPhotos", imagePath);
                        isValidToExecute = true;
                    }
                  
                }
                //INSERT
                else
                {
                    query = @"Insert into Cars values(@CarTitle, @NoOfPost, @Description,@CarModelYear,@CarKm,@CarEnginePower,@CarEngineDisplacement,@CarFuelType,@CarGearShift,@CarChassisType, @CarStatus,@Swap,@SevereDamage,@Brand,@Model,@Traction,@Color,@Email,@TelephoneNo,@CreatedDate,@Country,@CarPhotos)";
                    type = "saved";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@CarTitle", txtCarTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@NoOfPost", txtNoOfPost.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarModelYear", txtCarModelYear.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarKm", txtCarKm.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarEnginePower", txtCarEnginePower.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarEngineDisplacement", txtCarEngineDisplacement.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarFuelType", txtCarFuelType.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarGearShift", txtCarGearShift.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarChassisType", txtCarChassisType.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarStatus", txtCarStatus.Text.Trim());
                    cmd.Parameters.AddWithValue("@Swap", txtSwap.Text.Trim());
                    cmd.Parameters.AddWithValue("@SevereDamage", txtSevereDamage.Text.Trim());
                    cmd.Parameters.AddWithValue("@Brand", txtBrand.Text.Trim());
                    cmd.Parameters.AddWithValue("@Model", txtModel.Text.Trim());
                    cmd.Parameters.AddWithValue("@Traction", txtTraction.Text.Trim());
                    cmd.Parameters.AddWithValue("@Color", txtColor.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@TelephoneNo", txtTelephoneNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@CreatedDate", time.ToString("yyyy-MM-dd HH:mm:ss"));
                    cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                 //   cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                  //  cmd.Parameters.AddWithValue("@CarPhotos", txtCarTitle.Text.Trim());
                    if (fuCarPhoto.HasFile)
                    {
                        if (IsValidExtension(fuCarPhoto.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCarPhoto.FileName;
                            fuCarPhoto.PostedFile.SaveAs(Server.MapPath(" ~/Images/") + obj.ToString() + fuCarPhoto.FileName);
                            cmd.Parameters.AddWithValue("@CarPhotos", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, .jpeg, .png file for Car Photo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CarPhotos", imagePath);
                        isValidToExecute = true;
                    }
                   
                }
                if (isValidToExecute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = "Car" + type + "succesfully...";
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
                Response.Write("<script>alert('" +ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }
        private void clear()
        {
            txtCarTitle.Text = string.Empty;
            txtNoOfPost.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtCarModelYear.Text = string.Empty;
            txtCarKm.Text = string.Empty;
            txtCarEnginePower.Text = string.Empty;
            txtCarEngineDisplacement.Text = string.Empty;
            txtSwap.Text = string.Empty;
            txtSevereDamage.Text = string.Empty;
            txtBrand.Text = string.Empty;
            txtModel.Text = string.Empty;
            txtTraction.Text = string.Empty;
            txtColor.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelephoneNo.Text = string.Empty;
            ddlCountry.ClearSelection();
            // ddlCarFuelType.ClearSelection();
            //ddlCarChassisType.ClearSelection();
            //ddlCarStatus.ClearSelection();
            txtCarFuelType.Text = string.Empty;
            txtCarGearShift.Text = string.Empty;
            txtCarChassisType.Text = string.Empty;
            txtCarStatus.Text = string.Empty;

        }
        private bool IsValidExtension(string fileName)
        {
            bool isValid = false;
            string[] fileExtension = { ".jpg", ".png", ".jpeg" }; 
            for(int i = 0; i <= fileExtension.Length - 1; i++)
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