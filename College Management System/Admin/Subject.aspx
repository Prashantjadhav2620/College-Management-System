<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="College_Management_System.Admin.Subject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div style="background-image: url(); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center"> New Subject </h2>
        </div>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                   <label for="ddlClass">Class</label><br />
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"  hight ="46px" Width="321px" ></asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required." 
                        ControlToValidate="ddlClass" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <br />
               </div>
               <div class="col-md-6">
                   <label for="txtSubject">Subject</label>
                   <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Subject"  required></asp:TextBox>
               </div>
           </div>


        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-6 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" Text="Add Subject" CssClass="btn btn-primary btn-block" BackColor="#5558c9"  Width="220px" OnClick="btnAdd_Click"  />
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 "> 
            <div class="col-md-6 col-md-offset-2 mb-3">
                <asp:GridView ID="GridView1" runat="server"  CssClass="table table-hover table-bordered" EmptyDataText="No Recorads Found..! " 
                     AutoGenerateColumns="False" AllowPaging="True" PageIndex="4" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="SubjectId"
                       OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" 
                       OnRowUpdating="GridView1_RowUpdating"  Width="1016px"  >
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Class">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subject">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("SubjectName") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" />
                    </Columns>
                       <HeaderStyle BackColor="#5558c9" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>

