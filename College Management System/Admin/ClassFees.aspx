<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="College_Management_System.Admin.ClassFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url(); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center"> New Fees</h2>
        </div>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                   <label for="ddlClass">Class</label><br />
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"  hight ="46px" Width="321px"></asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required." 
                        ControlToValidate="ddlClass" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <br />
               </div>
               <div class="col-md-6">
                   <label for="txtFeeAmounts">Fees (Annual)</label>
                   <asp:TextBox ID="txtFeeAmounts" runat="server" CssClass="form-control" placeholder="Enter Fees Amount" TextMode="Number" required Width="310px"></asp:TextBox>
               </div>
           </div>


        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-6 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" Text="Add Fees" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" Width="220px"  />
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 "> 
            <div class="col-md-6 col-md-offset-2 mb-3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered" 
                    EmptyDataText="No Record Found...?" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="FeesId"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"   AllowPaging="True" PageIndex="4"
                    OnRowUpdating="GridView1_RowUpdating" Width="1016px" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" >
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ClassName" HeaderText="Class" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Fees(Annual)">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("FeesAmount") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                       <HeaderStyle BackColor="#5558c9" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>




    </div>

</asp:Content>

