<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ArticleLİst.aspx.cs" Inherits="CARS.Admin.ArticleLİst" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div style="background-image: url(''); width: 100%; height:720px; background-repeat: no-repeat;
background-size: cover; background-attachment: fixed; ">
        <div class="container-fluid pt-4 pb-4">
            <div>
                <asp:Label  ID="lblMsg" runat="server"></asp:Label>
            </div>
             
                <h3 class="text-center">Article List/Details</h3>
            <div class="row mb-3 pt-sm-3">
                <div class="col-md-10">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                        EmptyDataText="No record to display..!" AutoGenerateColumns="False" AllowPaging="True" PageSize="5"
                        OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ArticleId" OnRowDeleting="GridView1_RowDeleting"
                        OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>


                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField />

                            <asp:BoundField DataField="ArticleTitle" HeaderText="ArticleTitle">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField />


                            <asp:BoundField DataField="Article" HeaderText="Article">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField />

                            
                            <asp:BoundField DataField="ArticleCategory" HeaderText="ArticleCategory">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                             <asp:BoundField />

                             
                            <asp:BoundField DataField="CreatedDate" HeaderText="Posted Date" DataFormatString="{0:dd MMMM yyyy}">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField />

                             
                            <asp:CommandField  CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true"
                                DeleteImageUrl="../assets/img/icon/deleteicon.png" ButtonType="Image">
                                <ControlStyle Height="25px" Width="25px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:BoundField />


                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditArticle" runat="server" CommandName="EditArticle" CommandArgument='<%# Eval("ArticleId") %>'>
                                        <asp:Image ID="Img" runat="server" ImageUrl="../assets/img/icon/kalem.png" Height="25px"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>


                        </Columns>

                        <HeaderStyle  Backcolor="#7200cf" ForeColor="White"/>
                    </asp:GridView>


                </div>
            </div>
            </div>
         </div>

</asp:Content>
