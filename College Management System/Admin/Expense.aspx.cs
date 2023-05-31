using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace College_Management_System.Admin
{
    public partial class Expense : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                //GetTeacher();
                GetExpense();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("select * from Class ");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");

        }
        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("select * from Subject where ClassId='" + classId + "' ");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Select Subject");


        }
        private void GetExpense()
        {
            DataTable dt = fn.Fetch(@"select Row_NUMBER() over(Order by (Select 1))as [Sr.No] ,e.ExpenseId ,
                            e.ClassId, c.ClassName ,e.SubjectId , s.SubjectName , e.ChargeAmount from Expense e inner join Class c 
                            on e.ClassId = c.ClassId inner join Subject s on e.SubjectId= s.SubjectId ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {


            try
            {
                string classId = ddlClass.SelectedValue;
                string subjectId = ddlSubject.SelectedValue;
                string chargeAmt = txtExpenseAmt.Text.Trim();
                DataTable dt = fn.Fetch("select * from Expense where ClassId='" + classId + "' and SubjectId='" + subjectId +
                    "' or ChargeAmount='" + chargeAmt + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Expense values('" + classId + "','" + subjectId + "','" + chargeAmt + "') ";
                    fn.Query(query);
                    lblmsg.Text = "Inserted Successfull..!";
                    lblmsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    ddlSubject.SelectedIndex = 0;
                    txtExpenseAmt.Text = string.Empty;
                    GetExpense();
                }
                else
                {
                    lblmsg.Text = "Entered <b> Data/b>   already Exists !";
                    lblmsg.CssClass = "alert alert-danger";

                }

            }
            catch (Exception Ex)
            {
                Response.Write("<script> alert('" + Ex.Message + "')</script>");
            }

        }

        protected void ddlClassGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlClassSelected = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlClassSelected.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlSubjectGV = (DropDownList)row.FindControl("ddlSubjectGv");
                    DataTable dt = fn.Fetch("Select * from Subject  where ClassID= '" + ddlClassSelected.SelectedValue + "' ");
                    ddlSubjectGV.DataSource = dt;
                    ddlSubjectGV.DataTextField = "SubjectName";
                    ddlSubjectGV.DataValueField = "SubjectId";
                    ddlSubjectGV.DataBind();

                }
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView1.PageIndex = e.NewPageIndex;
            GetExpense();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetExpense();
        }

        

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int expenseId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Expense where ExpenseId='" + expenseId + "' ");
                lblmsg.Text = "Expense Deleted SuccessFully...!";
                lblmsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetExpense();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "')</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetExpense();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int expenseId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlClassGv")).SelectedValue;
                string subjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlSubjectGv")).SelectedValue;
                string chargeAmt = (row.FindControl("txtExpenseAmt") as TextBox).Text;

                fn.Query("Update Expense set ClassId= '" + classId + "', SubjectId='" + subjectId + "' , ChargeAmount='" + chargeAmt +
                    "' where ExpenseId='" + expenseId + "'");

                lblmsg.Text = "Record Updated SuccessFully...!";
                lblmsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetExpense();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "')</script>");
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassGv");
                    DropDownList ddlSubject = (DropDownList)e.Row.FindControl("ddlSubjectGv");
                    DataTable dt = fn.Fetch("Select * from Subject  where ClassID= '" + ddlClass.SelectedValue + "' ");
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectName";
                    ddlSubject.DataValueField = "SubjectId";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, "Select Subject");
                    string expenseId = GridView1.DataKeys[e.Row.RowIndex].Value.ToString();
                    DataTable dataTable = fn.Fetch(" select e.ExpenseId, e.ClassId, e.SubjectId, s.SubjectName from Expense e inner join Subject s on e.SubjectId = s.SubjectId where e.ExpenseId = '"+expenseId+"' ");
                    ddlSubject.SelectedValue = dataTable.Rows[0]["SubjectId"].ToString();

                }
            }
        }
    }
}