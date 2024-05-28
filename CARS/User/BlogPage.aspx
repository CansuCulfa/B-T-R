<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="BlogPage.aspx.cs" Inherits="CARS.User.BlogPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
   
    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">

                        <asp:DataList ID="DataList1" runat="server"> 
                            <ItemTemplate>

                                 <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" style="width:94%" src="<%# GetImageUrl( Eval("ArticlePhoto")) %>" alt="">
                                <a href="ArticleDetails.aspx?id=<%# Eval("ArticleId") %>" class="blog_item_date">
                                    <h3> <%# RelativeDate(Convert.ToDateTime(Eval("CreatedDate"))) %> </h3>
                                    <p> </p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="ArticleDetails.aspx?id=<%# Eval("ArticleId") %>">
                                    <h2><%# Eval("ArticleTitle") %> </h2>
                                </a>
                                <p>   
                                  Bu yazımızda başlığımızda da belirttiğimiz gibi...  </p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i><%# Eval("ArticleCategory") %></a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
                                </ul>
                            </div>
                        </article>

                            </ItemTemplate>
                        </asp:DataList>


                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">

                                        
                                        <div class="count-job mb-35">

                                            <asp:Label ID="lblarticleCount" runat="server"></asp:Label>

                                        </div>

                                        <%--<input type="text" class="form-control" placeholder='Search Keyword'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">--%>
                                        <%--<div class="input-group-append">
                                            <button class="btns" type="button"><i class="ti-search"></i></button>
                                        </div>--%>
                                    </div>
                                </div>
                               <%-- <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">Search</button>--%>
                            </form>
                        </aside>


                            <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Article Category</h4>
                            <ul class="list cat-list">

                                <li>
                                 
                                      <div class="select-job-items2">

                                    <asp:DropDownList ID="ddlArticleCategory" runat="server" name="select" CssClass="form-control w-100"

                                        DataSourceID="SqlDataSource1" AppendDataBoundItems="True" DataTextField="ArticleCategoryName"

                                        DataValueField="ArticleCategoryName" OnSelectedIndexChanged="ddlArticleCategory_SelectedIndexChanged"

                                        AutoPostBack="true">

                                        <asp:ListItem Value="0">Article Category</asp:ListItem>

                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"

                                        SelectCommand="SELECT [ArticleCategoryName] FROM [ArticleCategory]"></asp:SqlDataSource>

                                </div>


                                </li>


                              
                                
                                 
                               
                            </ul>
                        </aside>


                     <%--   <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                            <ul class="list cat-list">

                                <li>
                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True"
                                            RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="styled"
                                            TextAlign="Right" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                                            <asp:ListItem>Haberler</asp:ListItem>
                                            <asp:ListItem>Testler</asp:ListItem>
                                            <asp:ListItem>Otomobille Yaşam</asp:ListItem>
                                            <asp:ListItem>Elektrikli Dünyası</asp:ListItem>
                                            <asp:ListItem>Danışman</asp:ListItem>
                                    </asp:CheckBoxList>
                                </li>


                              
                                
                                 <div class="mb-1">

                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-sm" Width="100%"

                                        OnClick="LinkButton1_Click">Filter</asp:LinkButton>

                                </div>

                                <div class="mb-4">

                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-sm" Width="100%"

                                        OnClick="LinkButton2_Click">Reset</asp:LinkButton>

                                </div>
                               
                            </ul>
                        </aside>--%>

                        
                         <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Posted Within</h4>

                         <div class="select-Categories pb-50">

                                    <%--<div class="small-section-tittle2">

                                        <h4>Posted Within</h4>

                                    </div>--%>

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
                               <div class="mb-1">

                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-sm" Width="100%"

                                        OnClick="LinkButton1_Click">Filter</asp:LinkButton>

                                </div>

                                <div class="mb-4">

                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-sm" Width="100%"

                                        OnClick="LinkButton2_Click">Reset</asp:LinkButton>

                                </div>

                                </div>

                              </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Recent Post</h3>

                            <asp:DataList ID="DataList2" runat="server">

                                <ItemTemplate>
                                     <div class="media post_item">
                                             <img style="width:25%" src="<%# GetImageUrl( Eval("ArticlePhoto")) %>" alt="post">
                                                 <div class="media-body">
                                                      <a href="ArticleDetails.aspx?id=<%# Eval("ArticleId") %>">
                                                      <h3><%# Eval("ArticleTitle") %></h3>
                                                      </a>
                                              <p><%# RelativeDate(Convert.ToDateTime(Eval("CreatedDate"))) %></p>
                                             </div>
                                    </div>


                                </ItemTemplate>
                            </asp:DataList>

                           
                         
                        </aside>                   


                        <aside class="single_sidebar_widget newsletter_widget">
                            <h4 class="widget_title">Newsletter</h4>

                            <form action="#">
                                <div class="form-group">
                                    <input type="email" class="form-control" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Enter email'" placeholder='Enter email' required>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">Subscribe</button>
                            </form>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
   

</asp:Content>


