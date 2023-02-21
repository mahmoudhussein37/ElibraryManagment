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
    public partial class UserLogin : System.Web.UI.Page
    {
        string StrConn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn= new SqlConnection(StrConn);
                if(conn.State== ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Member_All_Info_tbl where Email='" + txtGmail.Text + "'AND Password='" + txtPassword.Text.Trim()+"'",conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {


                        Response.Write("<script>alert(' Hello  "+ dr.GetValue(0).ToString() + "_" + dr.GetValue(7).ToString() + " ');</script>");
                        Session["username"]=dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        Session["ID"]= dr.GetValue(7).ToString();

                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Email or password is Wrong !');</script>");
                }

            }
            catch (Exception ex)
            {
               Response.Write("<script>alert('" +ex.Message+ "');</script>");
            }
        }
            
    }
}