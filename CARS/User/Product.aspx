<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="CARS.User.Product" %>
<%@ Import Namespace="CARS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"

        rel="stylesheet" type="text/css" />

    <style type="text/css">

        .checkbox {

            padding-left: 20px;

        }


            .checkbox label {

                display: inline-block;

                vertical-align: middle;

                position: relative;

                padding-left: 5px;

            }


                .checkbox label::before {

                    content: "";

                    display: inline-block;

                    position: absolute;

                    width: 17px;

                    height: 17px;

                    left: 0;

                    margin-left: -20px;

                    border: 1px solid #cccccc;

                    border-radius: 3px;

                    background-color: #fff;

                    -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;

                    -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;

                    transition: border 0.15s ease-in-out, color 0.15s ease-in-out;

                }


                .checkbox label::after {

                    display: inline-block;

                    position: absolute;

                    width: 16px;

                    height: 16px;

                    left: 0;

                    top: 0;

                    margin-left: -20px;

                    padding-left: 3px;

                    padding-top: 1px;

                    font-size: 11px;

                    color: #FF4357;

                }


            .checkbox input[type="checkbox"] {

                opacity: 0;

                z-index: 1;

            }


                .checkbox input[type="checkbox"]:checked + label::after {

                    font-family: "FontAwesome";

                    content: "\f00c";

                }


        .checkbox-primary input[type="checkbox"]:checked + label::before {

            background-color: #FF4357;

            border-color: #FF4357;

        }


        .checkbox-primary input[type="checkbox"]:checked + label::after {

            color: #fff;

        }

    </style>

    <style>

        .radiobuttonlist {

            font: 12px Verdana, sans-serif;

            color: #000; /* non selected color */

        }


            .radiobuttonlist input {

                width: 0px;

                height: 20px;

            }


            .radiobuttonlist label {

                color: #FF4357;

                background-color: #FFF;

                padding-left: 6px;

                padding-right: 6px;

                padding-top: 2px;

                padding-bottom: 2px;

                border: 1px solid #FF4357;

                border-radius: 10%;

                margin: 0px 0px 0px 0px;

                white-space: nowrap;

                clear: left;

                margin-right: 5px;

            }


            .radiobuttonlist span.selectedradio label {

                background-color: #FF4357;

                color: #FFF;

                font-weight: bold;

                border-bottom-color: #F3F2E7;

                padding-top: 4px;

            }


            .radiobuttonlist label:hover {

                color: #CC3300;

                background: #D1CFC2;

            }


        .radiobuttoncontainer {

            position: relative;

            z-index: 1;

        }


        .radiobuttonbackground {

            position: relative;

            z-index: 0;

            border: solid 1px #AcA899;

            padding: 10px;

            background-color: #F3F2E7;

        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   
        <!-- Job List Area Start -->
        <div class="job-listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Left content -->
                    <div class="col-xl-3 col-lg-3 col-md-4">
                        <div class="row">
                            <div class="col-12">
                                    <div class="small-section-tittle2 mb-45">
                                    <div class="ion"> <svg 
                                        xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink"
                                        width="20px" height="12px">
                                    <path fill-rule="evenodd"  fill="rgb(27, 207, 107)"
                                        d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z"/>
                                    </svg>
                                    </div>
                                        <div class="">
                                            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    <h4>Filter Jobs</h4>
                                </div>
                            </div>
                        </div>
                        <!-- Job Category Listing start -->
                        <div class="job-category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                               <div class="small-section-tittle2">
                                     <h4>Job Category</h4>
                               </div>
                                <!-- Select job items start -->
                                <div class="select-job-items2">
                                    <select name="select">
                                        <option value="">All Category</option>

                                        <asp:Repeater  ID="rCategory" runat="server">

                                               <ItemTemplate>
                                                    
                                                     <option value=" .<%#  Regex.Replace( Eval("Name").ToString().ToLower(), @"\s+", "" ) %>"> <%# Eval("Name") %></option>

                                                      </ItemTemplate>

                                        </asp:Repeater>

                                        <option value="">Category 1</option>
                                        <option value="">Category 2</option>
                                        <option value="">Category 3</option>
                                        <option value="">Category 4</option>
                                    </select>
                                </div>
                                <!--  Select job items End-->
                                <!-- select-Categories start -->
                              <%--  <div class="select-Categories pt-80 pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Job Type</h4>
                                    </div>
                                      <asp:Repeater  ID="rCategory" runat="server">

                                               <ItemTemplate>
                                                    
                                                     <label class="container"> .<%# Eval("Name").ToString().ToLower() %>
                                        <input type="checkbox" >
                                        <span class="checkmark"></span>
                                    </label>
                                  

                                                      </ItemTemplate>

                                        </asp:Repeater>
                                  
                                </div>--%>
                                <!-- select-Categories End -->
                            </div>
                            
                            <!-- single three -->
                            <div class="single-listing">
                                <!-- select-Categories start -->
                                <div class="select-Categories pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Posted Within</h4>
                                    </div>
                                    <label class="container">Any
                                        <input type="checkbox" >
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Today
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Last 2 days
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Last 3 days
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Last 5 days
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Last 10 days
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <!-- select-Categories End -->
                            </div>
                           
                        </div>
                        <!-- Job Category Listing End -->
                    </div>
                    <!-- Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-8">
                        <!-- Featured_job_start -->
                        <section class="featured-job-area">
                            <div class="container">
                                <!-- Count of Job list Start -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="count-job mb-35">
                                            <span>39, 782 Jobs found</span>
                                            <!-- Select job items start -->
                                            <div class="select-job-items">
                                                <span>Sort by</span>
                                                <select name="select">
                                                    <option value="">None</option>
                                                    <option value="">job list</option>
                                                    <option value="">job list</option>
                                                    <option value="">job list</option>
                                                </select>
                                            </div>
                                            <!--  Select job items End-->
                                        </div>
                                    </div>
                                </div>
                                <!-- Count of Job list End -->
                                <!-- single-job-content -->
                                <div class="single-job-items mb-30">
                                    <div class="section-top-border">
				<h3 class="mb-30">Definition</h3>
				<div class="row">

            <asp:Repeater ID="rProducts" runat="server" OnItemCommand="rProducts_ItemCommand">

                <ItemTemplate>

                    	<div class="col-md-4">
                            <div class="col-md-3">
						
					</div>
                            <div class="single-defination">
							
                                <img width="700" src=" <%# Utils.GetImageUrl( Eval("ImageUrl")  ) %> " alt="" class="img-fluid">
                                <h4 class="mb-20"> <%# Regex.Replace( Eval("CategoryName").ToString().ToLower(), @"\s+", "" ) %> </h4>	
                                <p>
                                     <%# Eval("Description") %>
                                </p>
						</div>
                        <a href="#" class="genric-btn info circle arrow">  <%# Eval("Price") %> TL <span class="lnr lnr-arrow-right"></span></a>

                            <asp:DataList ID="DataList1" runat="server">
                            <ItemTemplate>>
                                 <asp:LinkButton ID="lbAddToCart" runat="server" CommandName="addToCart" CommandArgument='  <%# Eval("ProductId") %> '>




                           <a href="#" class="genric-btn info circle arrow"> Sepete Ekle <span class="lnr lnr-arrow-right"></span></a>
                 




                            </asp:LinkButton>
                             

                            </ItemTemplate>

                                </asp:DataList>
                           
					</div>

                </ItemTemplate>


            </asp:Repeater>

				
				</div>
			</div>
                                </div>
                                <!-- single-job-content -->
                              
                            </div>
                        </section>
                        <!-- Featured_job_end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Job List Area End -->
        <!--Pagination Start  -->
        <div class="pagination-area pb-115 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="single-wrap d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-start">
                                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Pagination End  -->  
      

    <%--  <main>


        <!-- Job List Area Start -->

        <div class="job-listing-area pt-50 pb-120">

            <div class="container">

                <div class="row">

                    <!-- Left content -->

                    <div class="col-xl-2 col-lg-3 col-md-4">

                        <div class="row">

                            <div class="col-12">

                                <div class="small-section-tittle2 mb-45">

                                    <div class="ion">

                                        <svg

                                            xmlns="http://www.w3.org/2000/svg"

                                            xmlns:xlink="http://www.w3.org/1999/xlink"

                                            width="20px" height="12px">

                                            <path fill-rule="evenodd" fill="rgb(27, 207, 107)"

                                                d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z" />

                                        </svg>

                                    </div>

                                    <h4>Filter Cars</h4>

                                </div>

                            </div>

                        </div>

                        <!-- Job Category Listing start -->

                        <div class="job-category-listing mb-50 pb-0">

                            <!-- single one -->

                            <div class="single-listing">

                                <div class="small-section-tittle2">

                                    <h4>Car Location</h4>

                                </div>

                                <!-- Select job items start -->

                                <div class="select-job-items2">

                                    <asp:DropDownList ID="ddlCountry" runat="server" name="select" CssClass="form-control w-100"

                                        DataSourceID="SqlDataSource1" AppendDataBoundItems="True" DataTextField="CountryName"

                                        DataValueField="CountryName" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" 

                                        AutoPostBack="true">

                                        <asp:ListItem Value="0">Country</asp:ListItem>

                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"

                                        SelectCommand="SELECT [CountryName] FROM [Country]"></asp:SqlDataSource>

                                </div>

                                <!--  Select job items End-->

                                <!-- select-Categories start -->

                                <div class="select-Categories pt-80 pb-50">

                                    <div class="small-section-tittle2">

                                        <h4>Car Type</h4>

                                    </div>

                                    <div class="checkbox checkbox-primary">

                                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" AutoPostBack="True"

                                            RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="styled"

                                            TextAlign="Right" OnSelectedIndexChanged="CheckBoxList2_SelectedIndexChanged">

                                            <asp:ListItem>Manual</asp:ListItem>

                                            <asp:ListItem>Automatic</asp:ListItem>

                                            <asp:ListItem>H-Automatic</asp:ListItem>

                                        </asp:CheckBoxList>

                                    </div>

                                </div>

                                <!-- select-Categories End -->

                            </div>

                            <!-- single two -->


                            <!-- single three -->

                            <div class="single-listing">

                                <!-- select-Categories start -->

                                <div class="select-Categories pb-50">

                                    <div class="small-section-tittle2">

                                        <h4>Posted Within</h4>

                                    </div>

                                    <div class="radiobuttoncontainer">

                                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" CssClass="radiobuttonlist" AutoPostBack="true"

                                            OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" RepeatLayout="Flow">

                                            <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>

                                            <asp:ListItem Value="1">Today</asp:ListItem>

                                            <asp:ListItem Value="2">Last 2 days</asp:ListItem>

                                            <asp:ListItem Value="3">Last 3 days</asp:ListItem>

                                            <asp:ListItem Value="4">Last 5 days</asp:ListItem>

                                            <asp:ListItem Value="5">Last 10 days</asp:ListItem>

                                        </asp:RadioButtonList>

                                    </div>

                                </div>

                                <!-- select-Categories End -->

                                <div class="mb-1">

                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-sm" Width="100%"

                                        OnClick="LinkButton1_Click">Filter</asp:LinkButton>

                                </div>

                                <div class="mb-4">

                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-sm" Width="100%"

                                        OnClick="LinkButton2_Click">Reset</asp:LinkButton>

                                </div>


                            </div>


                        </div>

                        <!-- Job Category Listing End -->

                    </div>

                    <!-- Right content -->

                    <div class="col-xl-10 col-lg-9 col-md-8">

                        <!-- Featured_job_start -->

                        <section class="featured-job-area">

                            <div class="container">

                                <!-- Count of Job list Start -->

                                <div class="row">

                                    <div class="col-lg-12">

                                        <div class="count-job mb-35">

                                            <asp:Label ID="lblcarCount" runat="server"></asp:Label>

                                        </div>

                                    </div>

                                </div>

                                <!-- Count of Job list End -->

                                <!-- single-job-content -->

                                <asp:DataList ID="DataList2" runat="server">

                                    <ItemTemplate>

                                        <div class="single-job-items mb-30">

                                            <div class="job-items">

                                                <div class="company-img">

                                                    <a href="CarDetails.aspx?id=<%# Eval("CarId") %>">

                                                        <img width="80" src="<%# GetImageUrl( Eval("CarPhotos")) %>" alt="">

                                                    </a>

                                                &nbsp;</div>

                                                <div class="job-tittle job-tittle2">

                                                    <a href="CarDetails.aspx?id=<%# Eval("CarId") %>">

                                                        <h5><%# Eval("CarTitle") %></h5>

                                                    </a>

                                                    <ul>

                                                        <li> <i class="fas fa-car"></i><%# Eval("Brand") %></li>

                                                        <li><i class="fas fa-map-marker-alt"></i> <%# Eval("Country") %></li>

                                                        <li><i class="fas fa-clock pr-1"></i><%# Eval("CarModelYear") %></li>

                                                    </ul>

                                                </div>

                                            </div>

                                            <div class="items-link items-link2 f-right">

                                                <a href="CarDetails.aspx?id=<%# Eval("CarId") %>"> <%# Eval("NoOfPost") %> TL </a>

                                                <span class="text-secondary">

                                                    <i class="fas fa-clock pr-1"></i>

                                                    <%# RelativeDate(Convert.ToDateTime(Eval("CreatedDate"))) %>

                                                </span>

                                            </div>

                                        </div>

                                    </ItemTemplate>

                                </asp:DataList>

                            </div>

                        </section>

                        <!-- Featured_job_end -->

                    </div>

                </div>

            </div>

        </div>

        <!-- Job List Area End -->


    </main>--%>



</asp:Content>



