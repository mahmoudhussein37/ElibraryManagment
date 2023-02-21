using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Reflection.Emit;

namespace ElibraryManagment
{
    public partial class EditProf : System.Web.UI.Page
    {
        string StrConn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(StrConn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Member_All_Info_tbl where Member_ID='" + Session["ID"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtName.Text = dt.Rows[0]["FullName"].ToString();
                txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                txtgmail.Text = dt.Rows[0]["Email"].ToString();
                lblstate.Text = dt.Rows[0]["acount_state"].ToString().Trim();
                txtUserId.Text = dt.Rows[0]["Member_ID"].ToString();
                TxtPassWord.Text = dt.Rows[0]["Password"].ToString();
                txtNatid.Text = dt.Rows[0]["National_ID"].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void updateUserPersonalDetails()
        {
            
            if (TxtPassWord.Text.Trim() == ""||TxtrePassWord.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please Enter The Right Data');</script>");
            }
            else
            {
               if(TxtPassWord.Text  != TxtrePassWord.Text)
                {
                    Response.Write("<script>alert('Passwords Not Matchs');</script>");

                }
               else if (TxtPassWord.Text == TxtrePassWord.Text)
                {
                    try
                    {
                        SqlConnection con = new SqlConnection(StrConn);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }


                        SqlCommand cmd = new SqlCommand("update Member_All_Info_tbl set FullName='" + txtName.Text.Trim() + "', Phone='" + txtPhone.Text.Trim() + "', Email='" + txtgmail.Text.Trim() + "' , Password='" + TxtPassWord.Text + "' WHERE Member_ID='" + Session["ID"].ToString() + "'", con);
                        int result = cmd.ExecuteNonQuery();
                        con.Close();
                        if (result > 0)
                        {

                            Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invaid entry !');</script>");
                        }

                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('error no !');</script>");
                }
            }
           
        }
     

        //void getUserAchevData()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(StrConn);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }

        //        SqlCommand cmd = new SqlCommand("SELECT Achievement from Member_All_Info_tbl where Member_ID='" + Session["ID"].ToString() + "';", con);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);

        //        GvEditProf.DataSource = dt;
        //        GvEditProf.DataBind();


        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");

        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {

                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            }
        }
    }
}