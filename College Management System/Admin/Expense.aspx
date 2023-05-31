<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="College_Management_System.Admin.Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url(); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Expense </h2>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <label for="ddlClass">&nbsp;&nbsp; Class</label><br />
                &nbsp;
                 <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-Control" Height="46px" Width="321px" AutoPostBack="true"
                     OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                 </asp:DropDownList>
                <br />
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Class is Required."
                    ControlToValidate="ddlClass" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <br />
            </div>


            <div class="col-md-6">
                <label for="ddlSubject">&nbsp;&nbsp; Subject</label>
                <br />
                &nbsp;
                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-Control" Height="46px" Width="321px">
                    </asp:DropDownList>
                <br />
                &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Subject is Required."
                        ControlToValidate="ddlSubject" InitialValue="Select Subject" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                <br />
            </div>


            <div class="col-md-6">
                <label for="txtExpenseAmt">&nbsp;&nbsp;Charge Amount(Per Lecture )</label></br>&nbsp;
                  <asp:TextBox ID="txtExpenseAmt" runat="server" CssClass="form-Control" PlaceHolder="Enter Charge Amount"
                      Height="46px" Width="321px" TextMode="Number" Required></asp:TextBox>
            </div>
        </div>


        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-6 col-md-offset-2 mb-3">
                &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAdd" runat="server" Text="Add Expense" CssClass="btn btn-primary btn-block"
                            BackColor="#5558c9" Width="220px" OnClick="btnAdd_Click" />
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 ">
            <div class="col-md-6 col-md-offset-2 mb-3">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Recorads Found..! " 
                     AutoGenerateColumns="False" AllowPaging="True" PageIndex="4" OnPageIndexChanging="GridView1_PageIndexChanging" 
                       DataKeyNames="ExpenseId" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" 
                       OnRowUpdating="GridView1_RowUpdating"  OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound" Width="1016px">
                    <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>
                           <asp:TemplateField HeaderText="Class">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="ddlClassGv" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName"
                                    DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClassGv_SelectedIndexChanged" >
                                       <asp:ListItem>Select Class</asp:ListItem>
                                   </asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>"
                                       SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                               </EditItemTemplate>
                               <HeaderTemplate>
                                   &nbsp;
                               </HeaderTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Subject">
                               <EditItemTemplate>
                                        <asp:DropDownList ID="ddlSubjectGv" runat="server"  CssClass="form-control"  ></asp:DropDownList>       
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Charge Rs.(Per Lecture )">
                               <EditItemTemplate>
                                     <asp:TextBox ID="txtExpenseAmt" runat="server" CssClass="form-Control" Text='<%# Eval("ChargeAmount") %>'
                                         TextMode="Number" Required></asp:TextBox>
                                </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChargeAmount") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>


                           <asp:CommandField CausesValidation="false" HeaderText="Operation"  ShowEditButton="True" ShowDeleteButton="true">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:CommandField>
                       </Columns>
                    <HeaderStyle BackColor="#5558c9" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>


