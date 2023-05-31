<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="College_Management_System.Admin.Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url(); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Teacher </h2>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">

                <label for="txtName">&nbsp;&nbsp; Name</label><br />
                &nbsp;
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Shoud be in Characters"
                    ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                </asp:RegularExpressionValidator>
            </div>

            <div class="col-md-6">
                <label for="txtDoB">&nbsp;&nbsp; Date of Birth</label>
                <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date" required Width="211px"></asp:TextBox>
            </div>

        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">

                <label for="ddlGender">&nbsp;&nbsp; Gender</label><br />
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is Required..!"
                    ForeColor="red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Gender">
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-6">
                <label for="txtMobile">&nbsp;&nbsp; Mobile No </label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter 10 Digits Mobile Number" required>
                </asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="InValid Mobile Number "
                    ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                </asp:RegularExpressionValidator>
            </div>

        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <label for="txtEmail">&nbsp;&nbsp; Email</label><br />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email Address " TextMode="Email" required>
                </asp:TextBox>
            </div>

            <div class="col-md-6">
                <label for="txtPassword">&nbsp; Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password " TextMode="Password" required>
                </asp:TextBox>
            </div>

        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-12">
                <label for="txtAddress">&nbsp;&nbsp; Address</label><br />
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter  Address " TextMode="MultiLine" required>
                </asp:TextBox>
            </div>
        </div>


        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-6 col-md-offset-2 mb-3">
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAdd" runat="server" Text="Add Teacher" CssClass="btn btn-primary btn-block" BackColor="#5558c9" Width="220px" OnClick="btnAdd_Click" />
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-6 col-md-offset-2 mb-3">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Recorads Found..! "
                    AutoGenerateColumns="False" AllowPaging="True" PageIndex="4" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="TeacherId"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" Width="1016px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Class">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control"
                                    Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Mobile">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control" Width="100px">
                                </asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                               <ItemTemplate>
                                   <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Password">
                               <EditItemTemplate>
                                   <asp:TextBox  ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control" 
                                       Width="100px"> </asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Address">
                               <EditItemTemplate>
                                   <asp:TextBox  ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control"
                                       Width="100px" TextMode="MultiLine"> </asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                        <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" ShowDeleteButton="true" />
                    </Columns>
                    <HeaderStyle BackColor="#5558c9" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>

