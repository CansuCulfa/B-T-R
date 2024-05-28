<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="CARS.User.CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>



        <div>
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">

                    <ItemTemplate>
                        <!-- Hero Area Start-->
                       <%-- <div class="slider-container">
                            <div class="slider-height2" style="width:80vw; height:63vw;">
                                  <img style="width:100%" src="<%# GetImageUrl( Eval("CarPhotos")) %>" alt="">
                            </div>
                  
                            </div>--%>
                        </div>
                        <!-- Hero Area End -->
                        <div class="row justify-content-between">
                            <!-- Left Content -->
                          
                            <!-- Right Content -->

                              <div class="col-xl-7 col-lg-8">

                                <div class="single-job-items mb-50">
                                    <div class="job-items">
                                      
                                        <div class="job-tittle">
                                            <a href="#">
                                                <h4><%# Eval("CarTitle") %></h4>
                                            </a>
                                            <ul>
                                                <li><i class="fas fa-car"></i> <%# Eval("Brand") %></li>
                                                <li><i class="fas fa-map-marker-alt"></i><%# Eval("Country") %></li>
                                                <li><i class="fas fa-clock pr-1"></i><%# Eval("CarModelYear") %></li>

                                            </ul>
                                        </div>                                         
                                        
                                    </div>                           
                                </div>

                                
                                    <div class="slider-container">
                            <div class="slider-height2" style="width:80vw; height:1vw;">
                                  <img style="width:60%" src="<%# GetImageUrl( Eval("CarPhotos")) %>" alt="">
                            </div>
                  
                            </div>
                                    
                                        <div class="single-job-items mb-1">
                                          
                                   <div class="job-tittle">
                                            <a href="#">
                                                <h4> <i class="fas fa-car"></i> <%# Eval("NoOfPost") %> TL</h4>
                                            </a>
                                           
                                        </div>               
                                </div>

                                    <div class="job-post-details">

                                      <div class="post-details2  mb-50">
                                        <!-- Small Section Tittle -->
                                        <div class="small-section-tittle">
                                            <h3>Araç Özellikleri</h3>
                                        </div>
                                        <ul>
                                             <div class="post-details3  mb-50">
                                                  <h5>  <li>Araç Markası: <%# Eval("Brand") %> </li> </h5>
                                                  <h5>  <li>Araç Modeli: <%# Eval("Model") %> </li> </h5>
                                                  <h5>  <li>Araç Model Yılı: <%# Eval("CarModelYear") %> </li> </h5> 
                                                  <h5>  <li>Araç Rengi: <%# Eval("Color") %> </li></h5> 
                                                  <h5>  <li>Araç Kasa Tipi: <%# Eval("CarChassisType") %> </li></h5> 
                                                  <h5>  <li>Araç Vitesi: <%# Eval("CarGearShift") %> </li> </h5>
                                                  <h5>  <li>Araç Kilometresi: <%# Eval("CarKm") %> </li></h5>  
                                                  <h5>  <li>Araç Yakıtı: <%# Eval("CarFuelType") %> </li> </h5>
                                                  <h5>  <li>Araç Motor Gücü: <%# Eval("CarEnginePower") %> </li></h5> 
                                                  <h5>  <li>Araç Motor Hacmi: <%# Eval("CarEngineDisplacement") %> </li></h5>                                                  
                                                
                                                 
                                             </div>
                                        </ul>
                                       </div>                                                                           
                                </div>
                                  
                            </div>

                            <div class="col-xl-4 col-lg-4">

                                 <div class="post-details3  mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>İlan Sahibi Bilgileri </h4>
                                    </div>
                                    <ul>
                                     <h6> </h6>   
                                        <li>İl : <span> <%# Eval("Country") %></span></li>
                                        <li>Fiyat : <span> <%# Eval("NoOfPost") %> TL</span></li>
                                        <li>Adı Soyadı  : <span> Cansu Culfa </span></li>
                                        <li>Email : <span>  <%# Eval("Email") %> </span></li>
                                        <li>Telefon Numarası: <span> <%# Eval("TelephoneNo") %></span></li>
                                        <li>İlan Tarihi : <span> <%# DataBinder.Eval(Container.DataItem, "CreatedDate", "{0:dd MMMM yyyy}") %></span></li>
                                    </ul>
                                    <div class="apply-btn2">
                                       <%-- <a href="#" class="btn">Araç için görüşme talebi al</a>--%>
                                        <asp:LinkButton ID="lbApplyCar" runat="server" CssClass="btn" Text="Araç için görüşme talebi al" CommandName="ApplyCar"></asp:LinkButton>
                                    </div>
                                </div>

                                <div class="post-details3  mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>İlan Sahibi Açıklaması </h4>
                                    </div>                                                                
                                        <h6> <li> <%# Eval("Description") %> </li></h6>                                                                                                    
                                </div>

                                <div class="post-details3  mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Araç Durumu</h4>
                                    </div>
                                    <ul>
                                     <h6> </h6>   
                                        <li> Araç Durumu : <span><%# Eval("CarStatus") %></span></li>
                                        <li> Ağır Hasar : <span><%# Eval("SevereDamage") %></span></li>
                                        <li> Takas : <span><%# Eval("Swap") %></span></li>
                                        <li> Çekiş Türü :  <span><%# Eval("Traction") %></span></li>
                                    </ul>
                                   
                                </div>

                             
                            </div>
                        </div>

                    </ItemTemplate>

                </asp:DataList>

            </div>
        </div>
        <!-- job post company End -->

    </main>

</asp:Content>
