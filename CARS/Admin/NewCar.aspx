<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewCar.aspx.cs" Inherits="CARS.Admin.NewCar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height:720px; background-repeat: no-repeat;
background-size: cover; background-attachment: fixed; ">
        <div class="container pt-4 pb-4">
          
            <div class="btn-toolbar justify-content-between mb-3">
                <div class="btn-group">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <div class="input-group h-25">
                    <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/CarList.aspx" CssClass="btn btn-secondary"
                        Visible="false">< Back</asp:HyperLink>
                </div>
            </div>
             
                <h3 class="text-center"> <%Response.Write(Session["CarTitle"]); %></h3>
             <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtCarTitle" style="font-weight: 600">Car Title</label>
                     <asp:TextBox ID="txtCarTitle" runat="server" CssClass="form-control" placeholder="Ex. Opel Astra Full Paket, Honda Civic 1.6 Otomatik vites"></asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtNoOfPost" style="font-weight: 600">Number of Post</label>
                     <asp:TextBox ID="txtNoOfPost" runat="server" CssClass="form-control" placeholder="Enter Number Of Position"
                         TextMode="Number"></asp:TextBox>

                 </div>

        </div>
             <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-12 pt-3">
                     <label for="txtDescription" style="font-weight: 600">Description</label>
                     <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Car Description" TextMode="MultiLine"></asp:TextBox>
                 </div>
                

        </div>
              <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtCarModelYear" style="font-weight: 600">Car Model Year</label>
                     <asp:TextBox ID="txtCarModelYear" runat="server" CssClass="form-control" placeholder="2015 Model, 2023 Model  DD-MM-YYYY"></asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtCarKm" style="font-weight: 600">Car's KM</label>
                     <asp:TextBox ID="txtCarKm" runat="server" CssClass="form-control" placeholder="Enter Car's KM"
                         TextMode="Number"></asp:TextBox>
                 </div>
             </div>
              <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtCarEnginePower" style="font-weight: 600">Car Engine Power</label>
                     <asp:TextBox ID="txtCarEnginePower" runat="server" CssClass="form-control" placeholder="136 HP, 150 HP"></asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtCarEngineDisplacement" style="font-weight: 600">Car Engine displacement</label>
                     <asp:TextBox ID="txtCarEngineDisplacement" runat="server" CssClass="form-control" placeholder="1.6 CC, 0.9 CC"></asp:TextBox>
                 </div>
             </div>
              <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtCarFuelType" style="font-weight: 600">Car Fuel Type</label>
                    <asp:TextBox ID="txtCarFuelType" runat="server" CssClass="form-control" placeholder="LPG / DIESEL / PETROL "></asp:TextBox>
                   
                 </div>
                   <div class="col-md-6 pt-3">
                     <label for="txtCarGearShift" style="font-weight: 600">Car Gearshift</label>
                     <asp:TextBox ID="txtCarGearShift" runat="server" CssClass="form-control" placeholder="MANUAL, AUTOMATIC / SEMI-AUTOMATIC"></asp:TextBox>
                     
                 </div>
                    <div class="col-md-6 pt-3">
                     <label for="txtCarChassisType" style="font-weight: 600">Car Chassis</label>
                     <asp:TextBox ID="txtCarChassisType" runat="server" CssClass="form-control" placeholder="SEDAN / SUV / HATCHBACK"></asp:TextBox>
                 </div>
                    <div class="col-md-6 pt-3">
                     <label for="txtCarStatus" style="font-weight: 600">Car Status</label>
                     <asp:TextBox ID="txtCarStatus" runat="server" CssClass="form-control" placeholder="NEW / SECOND-HAND"></asp:TextBox>
                      
                 </div>

             </div>
              <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtSwap" style="font-weight: 600">Car Swap</label>
                     <asp:TextBox ID="txtSwap" runat="server" CssClass="form-control" placeholder="Yes or No"></asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtSevereDamage" style="font-weight: 600">Severe Damage</label>
                     <asp:TextBox ID="txtSevereDamage" runat="server" CssClass="form-control" placeholder="Severe Damage"></asp:TextBox>
                 </div>

        </div>
              <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtBrand" style="font-weight: 600">Car Brand</label>
                     <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" placeholder="Opel, Honda, BMW"></asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtModel" style="font-weight: 600">Car Model</label>
                     <asp:TextBox ID="txtModel" runat="server" CssClass="form-control" placeholder="Corsa, A6"></asp:TextBox>
                 </div>

        </div>
              <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtTraction" style="font-weight: 600">Car Traction</label>
                     <asp:TextBox ID="txtTraction" runat="server" CssClass="form-control" placeholder="Önden Çekiş, Arkadan Çekiş"></asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtColor" style="font-weight: 600">Car Color</label>
                     <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" placeholder="Black, White, Blue"></asp:TextBox>
                 </div>

        </div>
              <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtEmail" style="font-weight: 600">Email</label>
                     <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="@gmail.com" TextMode="Email"></asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtTelephoneNo" style="font-weight: 600">Telephone No</label>
                     <asp:TextBox ID="txtTelephoneNo" runat="server" CssClass="form-control" placeholder="Telephone Number"></asp:TextBox>
                 </div>

        </div>
               <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="ddlCountry" style="font-weight: 600">Country</label>
                      <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100"
                           AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryName">
                              <asp:ListItem Value="0">Select Country</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Country is required"
                           ForeColor="Red"  Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry"></asp:RequiredFieldValidator>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [CountryName] FROM [Country]"></asp:SqlDataSource>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="ddlCarTitle" style="font-weight: 600"> Car Photos</label>
                     <asp:FileUpload ID="fuCarPhoto" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png extension only"/>
                 </div>

        </div>


            <div class="row mr-lg-5 mi-lg-5 mb-3 pt-4">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#7200cf" Text="Add Car"
                    OnClick="btnAdd_Click"/>
            </div>

        </div>
    </div>

</asp:Content>
