<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewApplyCar.aspx.cs" Inherits="CARS.Admin.ViewApplyCar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div style="background-image: url(''); width: 100%; height:720px; background-repeat: no-repeat;
background-size: cover; background-attachment: fixed; ">
        <div class="container-fluid pt-4 pb-4">
            <div>
                <asp:Label  ID="lblMsg" runat="server"></asp:Label>
            </div>
             
                <h3 class="text-center"> Apply Car </h3>
            <div class="row mb-3 pt-sm-3">
                <div class="col-md-5">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                        EmptyDataText="No record to display..!" AutoGenerateColumns="False" AllowPaging="True" PageSize="5"
                        OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="AppliedCarId" OnRowDeleting="GridView1_RowDeleting">
                
                        
                        <Columns>

                           
                      

                              <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="CarTitle" HeaderText="Title">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            
                            <asp:BoundField DataField="NoOfPost" HeaderText="Price">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                          

                            <asp:BoundField DataField="Brand" HeaderText="Brand">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            
                            <asp:BoundField DataField="Model" HeaderText="Model">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                             
                            <asp:BoundField DataField="Name" HeaderText="User Name">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            
                              
                            <asp:BoundField DataField="Email" HeaderText="Email">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        
                             
                            <asp:BoundField DataField="Mobile" HeaderText=" User Mobile">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                              <asp:BoundField DataField="LicenceType" HeaderText=" User LicenceType">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                              <asp:BoundField DataField="Country" HeaderText=" User State">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>


                             <asp:BoundField DataField="Address" HeaderText=" User Address">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>


                             
                           
                            <asp:CommandField  CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true"
                                DeleteImageUrl="../assets/img/icon/deleteicon.png" ButtonType="Image">
                                <ControlStyle Height="25px" Width="25px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>

                          
                        </Columns>

                        <HeaderStyle  Backcolor="#7200cf" ForeColor="White"/>
                    </asp:GridView>


                </div>
            </div>
            </div>
         </div>

</asp:Content>
