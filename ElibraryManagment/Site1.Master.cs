using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagment
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    UserLoginLnk.Visible = true;
                    SignUpLnk.Visible = true;

                    LogoutLnk.Visible = false;

                    helloUserLnk.Visible = false;

                    AdminLoginBtn.Visible = true;
                    CourseMangementbtn.Visible = false;
                    AdminManagementBtn.Visible = false;
                    MemberManagmentBtn.Visible = false;
                    ViewCoursesLnk.Visible  = false;

                }
                else if (Session["role"].Equals("user"))
                {
                    UserLoginLnk.Visible = false;
                    SignUpLnk.Visible = true;

                    LogoutLnk.Visible = true;
                    helloUserLnk.Visible = true;
                    helloUserLnk.Text = "Hello    "+Session["username"].ToString()+"_"+Session["ID"].ToString();

                    AdminLoginBtn.Visible = true;
                    CourseMangementbtn.Visible = false;
                    AdminManagementBtn.Visible = false;
                    MemberManagmentBtn.Visible = false;
                    ViewCoursesLnk.Visible = true;
                }
                else if (Session["role"].Equals("Admin"))
                {
                    UserLoginLnk.Visible = true;
                    SignUpLnk.Visible = false;

                    LogoutLnk.Visible = true;
                    helloUserLnk.Visible = true;
                    helloUserLnk.Text = "Hello " + Session["username"].ToString() ;

                    AdminLoginBtn.Visible = false;
                    CourseMangementbtn.Visible = true;
                    AdminManagementBtn.Visible = true;
                    MemberManagmentBtn.Visible = true;
                    ViewCoursesLnk.Visible = true;
                }


            }
            catch (Exception ex)
            {

                Response.Write("<Script>alert('" + ex.Message + "');</Script>");
            }

        }

        protected void ViewCoursesLnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("CoursesList.aspx");
        }

        protected void UserLoginLnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void SignUpLnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignup.aspx");
        }

        protected void AdminLoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogIn.aspx");
        }

        protected void CourseMangementbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCoursesManagement.aspx");

        }

        protected void AdminManagementBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCoursesManagement.aspx");

        }

        protected void MemberManagmentBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void LogoutLnk_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("homepage.aspx");


        }
    }
}