<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="ArticleDetails.aspx.cs" Inherits="CARS.User.ArticleDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>

        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>

    </div>


    <section class="blog_area single-post-area section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">

        <asp:DataList ID="DataList1" runat="server" >

            <ItemTemplate>

                  <div class="single-post">
                  <div class="feature-img">
                     <img class="img-fluid" style="width:94%" src="<%# GetImageUrl( Eval("ArticlePhoto")) %>" alt="">
                  </div>
                  <div class="blog_details">
                     <h2>   <%# Eval("ArticleTitle") %>   </h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="fa fa-user"></i> <%# Eval("ArticleCategory") %> </a></li>
                        <li><a href="#"><i class="fa fa-comments"></i>  <asp:Label ID="lblcommentCount" runat="server"></asp:Label> </a></li>
                         <li><a href="#"><i class="fa fa-calendar"></i>  <%# Eval("CreatedDate" , "{0:dd MMMM yyyy}" ) %> </a></li>
                     </ul>
                    <%-- <p class="excert">
                        MCSE boot camps have its supporters and its detractors. Some people do not understand why you
                        should have to spend money on boot camp when you can get the MCSE study materials yourself at a
                        fraction of the camp price. However, who has the willpower
                     </p>
                     <p>
                        MCSE boot camps have its supporters and its detractors. Some people do not understand why you
                        should have to spend money on boot camp when you can get the MCSE study materials yourself at a
                        fraction of the camp price. However, who has the willpower to actually sit through a
                        self-imposed MCSE training. who has the willpower to actually
                     </p>--%>
                     <div class="quote-wrapper">
                        <div class="quotes">
                           Elektrikli araçlar, çevre dostu ve sürdürülebilir bir ulaşım alternatifi olarak giderek daha popüler hale geliyor. Ancak, bu araçların karşılaştığı en büyük zorluklardan biri, batarya teknolojisinin beraberinde getirdiği bazı sorunlardır.
                        </div>
                     </div>
                     <p class="excert">
                          <%# Eval("Article") %>
                     </p>
                    
                  </div>
               </div>

            </ItemTemplate>                      

        </asp:DataList>

             
               <div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4
                        people like this</p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     <ul class="social-icons">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                        <li><a href="#"><i class="fab fa-behance"></i></a></li>
                     </ul>
                  </div>
                  <div class="navigation-area">
                     <div class="row">
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                           <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="assets/img/post/preview.png" alt="">
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-left"></span>
                              </a>
                           </div>
                           <div class="detials">
                              <p>Prev Post</p>
                              <a href="#">
                                 <h4>Space The Final Frontier</h4>
                              </a>
                           </div>
                        </div>
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                           <div class="detials">
                              <p>Next Post</p>
                              <a href="#">
                                 <h4>Telescopes 101</h4>
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-right"></span>
                              </a>
                           </div>
                           <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="assets/img/post/next.png" alt="">
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
             
               <div class="comments-area">
                  <h4>

                       <asp:Label ID="lblcommentCount" runat="server"></asp:Label>

                  </h4>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="assets/img/comment/comment_1.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                 Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                 Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                    <p class="date">December 4, 2017 at 3:12 pm </p>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                 
               </div>
               <div class="comment-form">
                  <h4>Leave a Reply</h4>
                  <form class="form-contact comment_form" action="#" id="commentForm">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9"
                                 placeholder="Write Comment"></textarea>
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="name" id="name" type="text" placeholder="Name">
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="email" id="email" type="email" placeholder="Email">
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <input class="form-control" name="website" id="website" type="text" placeholder="Website">
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn">Send Message</button>
                     </div>
                  </form>
               </div>
            </div>
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
                  <aside class="single_sidebar_widget search_widget">
                     <form action="#">
                        <div class="form-group">
                           <div class="input-group mb-3">
                             <%-- <input type="text" class="form-control" placeholder='Search Keyword'
                                 onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">--%>
                              <%--<div class="input-group-append">
                                 <button class="btns" type="button"><i class="ti-search"></i>

                                     <asp:LinkButton ID="lbReadArticle" runat="server">Okundu Olarak işaretle</asp:LinkButton>

                                 </button>
                              </div>--%>

                               <asp:DataList ID="DataList3" runat="server" OnItemCommand="DataList3_ItemCommand" OnItemDataBound="DataList3_ItemDataBound">

                                   <ItemTemplate>

                                          <div class="apply-btn2">

                                             <asp:LinkButton ID="lbReadArticle" runat="server" CssClass="btn" Text="Okundu Olarak işaretle"></asp:LinkButton>

                                           </div>


                                   </ItemTemplate>




                               </asp:DataList>

                            
                           </div>
                        </div>
                       <%-- <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                           type="submit">Search</button>--%>
                     </form>
                  </aside>
                  <aside class="single_sidebar_widget post_category_widget">
                     <h4 class="widget_title">Category</h4>
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
                                              <p><%# Eval("CreatedDate" , "{0:dd MMMM yyyy}") %></p>
                                             </div>
                                    </div>


                                </ItemTemplate>
                            </asp:DataList>
                  </aside>
                  
                 
               </div>
            </div>
         </div>
      </div>
   </section>



</asp:Content>
