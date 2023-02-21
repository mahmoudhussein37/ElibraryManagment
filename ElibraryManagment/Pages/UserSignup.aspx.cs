using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagment
{
    public partial class UserSignup : System.Web.UI.Page
    {
        string StrConn= ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        bool checkMemberExists()
        {
            SqlConnection conn = new SqlConnection(StrConn);

            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Member_All_Info_tbl where Member_ID='" + txtMember_ID.Text.Trim() + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        bool checkGmailExists()
        {
            SqlConnection conn = new SqlConnection(StrConn);

            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Member_All_Info_tbl where Email='" + txtEmail.Text.Trim() + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        void SignUpUser()
        {
            try
            {
                SqlConnection conn = new SqlConnection(StrConn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into Member_All_Info_tbl (Member_ID,FullName,DOB,Gender,Email,Goverorate,Department,Phone,Password) values ('" + txtMember_ID.Text + "','" + txtFullName.Text + "','" + txtDob.Text + "','" + DDGender.SelectedItem.Value + "','" + txtEmail.Text + "','" + DropDownGovernorate.SelectedItem.Value + "','" + DropDownDepartment.SelectedItem.Value + "','" + txtPhone.Text + "','" + txtpassword.Text + "')", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Sign Up Successful. Go Login Now!');</script>");
            }
            catch (Exception ex)
            {

                Response.Write("<Script>alert('" + ex.Message + "');</Script>");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            if (txtMember_ID.Text.Trim().Length == 0 || txtFullName.Text.Trim().Length == 0 || txtDob.Text.Trim().Length == 0 || DDGender.SelectedItem.Value.Trim().Length == 0 || txtEmail.Text.Trim().Length == 0 || DropDownGovernorate.SelectedItem.Value.Trim().Length == 0 || DropDownDepartment.SelectedItem.Value.Trim().Length == 0 || txtPhone.Text.Trim().Length == 0 || txtpassword.Text.Trim().Length == 0)
            {
                Response.Write("<Script>alert('Data missied');</Script>");
            }
            else
            {



                if (checkGmailExists())
                {

                    Response.Write("<script>alert('This account is already registered, try using another email');</script>");
                }
                else
                {
                    if (checkMemberExists())
                    {

                        Response.Write("<script>alert('MemberID Already Exist with this Member ID, try other ID');</script>");
                    }
                    else
                    {
                        if (txtpassword.Text.Trim() == txtrepassword.Text.Trim())
                        {
                            SignUpUser();
                        }
                        else
                        {
                            Response.Write("<script>alert('Password Does not Match !');</script>");
                        }

                    }
                }
            }

            
        }

        // user defined method
        

       
    }
}