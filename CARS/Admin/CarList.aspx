<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CarList.aspx.cs" Inherits="CARS.Admin.CarList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="background-image: url(''); width: 100%; height:720px; background-repeat: no-repeat;
background-size: cover; background-attachment: fixed; ">
        <div class="container-fluid pt-4 pb-4">
            <div>
                <asp:Label  ID="lblMsg" runat="server"></asp:Label>
            </div>
             
                <h3 class="text-center">Car List/Details</h3>
            <div class="row mb-3 pt-sm-3">
                <div class="col-md-5">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                        EmptyDataText="No record to display..!" AutoGenerateColumns="False" AllowPaging="True" PageSize="5"
                        OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="CarId" OnRowDeleting="GridView1_RowDeleting"
                        OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>

                           
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="CarTitle" HeaderText="Title">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            
                            <asp:BoundField DataField="NoOfPost" HeaderText="NoPost">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                           
                            <asp:BoundField DataField="Description" HeaderText="Description">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField> 

                          
                            <asp:BoundField DataField="CarModelYear" HeaderText="ModelYear">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField> 

                           
                            <asp:BoundField DataField="CarKm" HeaderText="Km">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField> 

                           
                            <asp:BoundField DataField="CarEnginePower" HeaderText="EnginePower">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField> 

                           
                            <asp:BoundField DataField="CarEngineDisplacement" HeaderText="EngineDisplacement">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField> 

                          
                            <asp:BoundField DataField="CarFuelType" HeaderText="FuelType">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField> 

                           
                            <asp:BoundField DataField="CarGearShift" HeaderText="GearShift">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            
                            <asp:BoundField DataField="CarChassisType" HeaderText="ChassisType">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                           
                            <asp:BoundField DataField="CarStatus" HeaderText="Status">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                           
                            <asp:BoundField DataField="Swap" HeaderText="Swap">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                           
                            <asp:BoundField DataField="SevereDamage" HeaderText="SevereDamage">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Brand" HeaderText="Brand">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            
                            <asp:BoundField DataField="Model" HeaderText="Model">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                             
                            <asp:BoundField DataField="Traction" HeaderText="Traction">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                             
                            <asp:BoundField DataField="Color" HeaderText="Color">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            
                              
                            <asp:BoundField DataField="Email" HeaderText="Email">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                             
                            <asp:BoundField DataField="TelephoneNo" HeaderText="TelephoneNo">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                             
                            <asp:BoundField DataField="CreatedDate" HeaderText="Posted Date" DataFormatString="{0:dd MMMM yyyy}">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                             
                             
                            <asp:BoundField DataField="Country" HeaderText="Country">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField  CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true"
                                DeleteImageUrl="../assets/img/icon/deleteicon.png" ButtonType="Image">
                                <ControlStyle Height="25px" Width="25px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditCar" runat="server" CommandName="EditCar" CommandArgument='<%# Eval("CarId") %>'>
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
 