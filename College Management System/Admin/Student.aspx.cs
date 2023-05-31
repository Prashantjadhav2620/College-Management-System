using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace College_Management_System.Admin
{
    public partial class Student : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetStudent();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");


        }

       

        private void GetStudent()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], s.StudentId , s.[Name] ,s.Dob , s.Gender, s.Mobile ,
                s.Rollno, s.[Address] , c.ClassId , c.ClassName from Student s inner join Class c on c.ClassId= s.ClassId  ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView1.PageIndex = e.NewPageIndex;
            GetStudent();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetStudent();
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetStudent();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtName") as TextBox).Text;
                string mobile = (row.FindControl("txtMobile") as TextBox).Text;
                string rollNo = (row.FindControl("txtRollNo") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[4].FindControl("ddlClass")).SelectedValue;

                fn.Query("Update Student set Name= '" + name.Trim() + "', Mobile= '" + mobile.Trim() + "', Address='" + address.Trim() +
                    "',  RollNo='" + rollNo.Trim() + "' ,  ClassId='" + classId.Trim() + "'  where StudentId='" + studentId + "'");
                lblmsg.Text = "Student Update SuccessFully...!";
                lblmsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetStudent();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "')</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex== e.Row.RowIndex)
            {

                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClass");
                    DataTable dt = fn.Fetch("Select * from Class");
                    ddlClass.DataSource = dt;
                    ddlClass.DataTextField = "ClassName";
                    ddlClass.DataValueField = "ClassId";
                    ddlClass.DataBind();
                    ddlClass.Items.Insert(0, "Select Class");
                    string selectedClass = DataBinder.Eval(e.Row.DataItem, "ClassName").ToString();
                    ddlClass.Items.FindByText(selectedClass).Selected = true;
                   
                
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string RollNo = txtRoll.Text.Trim();
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId='" + ddlClass.SelectedValue + "' and  Rollno= '" + txtRoll.Text.Trim() + "'  ");
                    if (dt.Rows.Count == 0)
                    {
                        //string query = " Insert into Student Values('" + txtName.Text.Trim() + "', '" + txtDoB.Text.Trim() + "' ,'" +
                        //    ddlGender.SelectedValue + "' ,'" + txtMobile.Text.Trim() + "', '" + txtRoll.Text.Trim() + "','" +
                        //    txtAddress.Text.Trim() + "' , '" + ddlClass.SelectedValue + "' )";
                        string query = "INSERT INTO Student VALUES ('" + txtName.Text.Trim() + "', '" + txtDoB.Text.Trim() + "', '" + ddlGender.SelectedValue + "', '" + txtMobile.Text.Trim() + "', '" + txtRoll.Text.Trim() + "', '" + txtAddress.Text.Trim() + "', '" + ddlClass.SelectedValue + "')";

                        
                        fn.Query(query);
                        lblmsg.Text = "Student Added SuccessFully...!";
                        lblmsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        txtMobile.Text = string.Empty;
                        txtRoll.Text = string.Empty;
                        txtAddress.Text = string.Empty;
                        ddlClass.SelectedIndex = 0;
                        GetStudent();

                    }
                    else
                    {
                        lblmsg.Text = "Entered Roll No  <b> '"+ RollNo+"'</b> Selected Class is  Allready Exists!";
                        lblmsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblmsg.Text = "Gender is Required..!";
                    lblmsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "')</script>");
            }
        }
    }
}