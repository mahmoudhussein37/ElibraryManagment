using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Expressions;

namespace ElibraryManagment
{
    public partial class AdminMemberManagement : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Member_All_Info_tbl where Member_ID='" + txtMemberId.Text + "';", conn);
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


        void deleteMemberByID()
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Member_All_Info_tbl WHERE Member_ID='" + txtMemberId.Text + "'", conn);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script>alert('Member Deleted Successfully');</script>");
                    clearForm();
                    gvMemberList.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }



        void getMemberByID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from Member_All_Info_tbl where Member_ID='" + txtMemberId.Text + "'", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextFullName.Text = dr.GetValue(0).ToString();
                        txtDob.Text = dr.GetValue(1).ToString();
                        TxtNational_ID.Text = dr.GetValue(2).ToString();
                        txtEmail.Text = dr.GetValue(3).ToString();
                        txtGovernorate.Text = dr.GetValue(4).ToString();
                        TxtDepartment.Text = dr.GetValue(5).ToString();
                        txtPhone.Text = dr.GetValue(6).ToString();
                        txtMemberId.Text = dr.GetValue(7).ToString();
                        TxtAchievement.Text = dr.GetValue(8).ToString();
                        txtAcoountState.Text = dr.GetValue(9).ToString();


                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void updateMemberStatusByIDActive()
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Member_All_Info_tbl SET acount_state='active' WHERE Member_ID='" + txtMemberId.Text + "'", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    gvMemberList.DataBind();
                    Response.Write("<script>alert('Member Status Updated');</script>");
                    txtAcoountState.Text = "active";


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }

        }
        void updateMemberStatusByIDpending()
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Member_All_Info_tbl SET acount_state='pending' WHERE Member_ID='" + txtMemberId.Text + "'", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    gvMemberList.DataBind();
                    Response.Write("<script>alert('Member Status Updated');</script>");
                    txtAcoountState.Text = "pending";


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }

        }
        void updateMemberStatusByIDBanned()
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Member_All_Info_tbl SET acount_state='Banned' WHERE Member_ID='" + txtMemberId.Text.Trim() + "'", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    gvMemberList.DataBind();
                    Response.Write("<script>alert('Member Status Updated');</script>");
                    txtAcoountState.Text = "Banned";

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }

        }
        void addnewMember()
        {
            SqlConnection conn = new SqlConnection(strcon);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into Member_All_Info_tbl (FullName,DOB,National_ID,Email,Goverorate,Department,Phone,Member_ID,Achievement,acount_state) values ('" + TextFullName.Text + "','" + txtDob.Text + "','" + TxtNational_ID.Text + "','" + txtEmail.Text + "' ,'" + txtGovernorate.Text + "','" + TxtDepartment.Text + "','" + txtPhone.Text + "','" + txtMemberId.Text + "','" + TxtAchievement.Text + "','" + txtAcoountState.Text + "')", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                clearForm();
                gvMemberList.DataBind();

                Response.Write("<script>alert('Admin added Succesfully!');</script>");
            }
            catch (Exception ex)
            {

                Response.Write("<Script>alert('" + ex.Message + "');</Script>");
            }
        }

        void Updatemember()
        {
            SqlConnection conn = new SqlConnection(strcon);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("update Member_All_Info_tbl set FullName='" + TextFullName.Text + "',DOB='" + txtDob.Text + "',National_ID='" + TxtNational_ID.Text + "',Email='" + txtEmail.Text + "' , Goverorate='" + txtGovernorate.Text + "',Department='" + TxtDepartment.Text + "', Phone='" + txtPhone.Text + "', Achievement='" + TxtAchievement.Text + "', acount_state='" + txtAcoountState.Text + "' where  Member_ID='" + txtMemberId.Text + "'", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                clearForm();
                gvMemberList.DataBind();


                Response.Write("<script>alert('Member Updated Succesfully!');</script>");
            }
            catch (Exception ex)
            {

                Response.Write("<Script>alert('" + ex.Message + "');</Script>");
            }
        }

        void clearForm()
        {
            TextFullName.Text = "";
            txtDob.Text = "";
            TxtNational_ID.Text = "";
            txtEmail.Text = "";
            txtGovernorate.Text = "";
            TxtDepartment.Text = "";
            txtPhone.Text = "";
            txtMemberId.Text = "";
            TxtAchievement.Text = "";
            txtAcoountState.Text = "";

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try { 

            if (Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("AdminLogIn.aspx");
            }
            else
            {

                if (!Page.IsPostBack)
                {
                }
                    gvMemberList.DataBind();

                }
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
                
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        protected void btnAcountStateAdd_Click(object sender, EventArgs e)
        {
            updateMemberStatusByIDActive();
        }
        protected void btnAcountStateUpdate_Click(object sender, EventArgs e)
        {
            updateMemberStatusByIDpending();

        }

        protected void btnAcountStateDelete_Click(object sender, EventArgs e)
        {
            updateMemberStatusByIDBanned(); 

        }

        protected void btnAddM_Click(object sender, EventArgs e)
        {
            if (checkIfMemberExists())
            {
                Response.Write("<Script>alert('this id is already Exsit try another id');</Script>");
            }
            else
            {
                addnewMember();
            }
        }

        protected void btnUpdatem_Click(object sender, EventArgs e)
        {
            if (checkIfMemberExists())
            {
                Updatemember();
            }
            else
            {
                Response.Write("<Script>alert('Member Dose Not Exist');</Script>");
            }

        }

        protected void btnDeleteM_Click(object sender, EventArgs e)
        {
            if (checkIfMemberExists())
            {
               deleteMemberByID();
            }
            else
            {
                Response.Write("<Script>alert('Member Dose Not Exist');</Script>");
            }

        }

        protected void txtAcoountState_TextChanged(object sender, EventArgs e)
        {

        }
    }
}