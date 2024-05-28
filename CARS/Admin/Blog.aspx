<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="CARS.Admin.Blog" %>
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
                    <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/ArticleLİst.aspx" CssClass="btn btn-secondary"
                        Visible="false">< Back</asp:HyperLink>
                </div>
            </div>
             
            <%--    <h3 class="text-center"> <%Response.Write(Session["CarTitle"]); %></h3>--%>
             <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-12 pt-5">
                     <label for="txtArticleTitle" style="font-weight: 600">Article Title</label>
                     <asp:TextBox ID="txtArticleTitle" runat="server" CssClass="form-control" placeholder="Ex. Elektrikli Arabalar"></asp:TextBox>
                 </div>

        </div>
             <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-12 pt-5">
                     <label for="txtArticle" style="font-weight: 600">Article</label>
                     <asp:TextBox ID="txtArticle" runat="server" CssClass="form-control" placeholder="Enter Article" TextMode="MultiLine"></asp:TextBox>
                 </div>
                

        </div>
           
               <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-12 pt-5">
                     <label for="ddlArticleCategory" style="font-weight: 600">Category</label>
                      <asp:DropDownList ID="ddlArticleCategory" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100"
                           AppendDataBoundItems="true" DataTextField="ArticleCategoryName" DataValueField="ArticleCategoryName">
                              <asp:ListItem Value="0">Select Article Category</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Category is required"
                           ForeColor="Red"  Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlArticleCategory"></asp:RequiredFieldValidator>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [ArticleCategoryName] FROM [ArticleCategory]"></asp:SqlDataSource>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="ddlArticleTitle" style="font-weight: 600"> Article Photos</label>
                     <asp:FileUpload ID="fuArticlePhoto" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png extension only"/>
                 </div>

        </div>


            <div class="row mr-lg-5 mi-lg-5 mb-3 pt-4">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#7200cf" Text="Add Article"
                    OnClick="btnAdd_Click"/>
            </div>

        </div>
    </div>

</asp:Content>
