using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagment
{
    public partial class UserAdmin : System.Web.UI.Page
    {
        string StrConn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(StrConn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Admin_Login_tbl where Email='" + txtAdminEmail.Text+ "'AND Password='"+txtAdminPassword.Text+ "'", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert(' Hello " + dr.GetValue(2).ToString() + "');</script>");
                        Session["username"] = dr.GetValue(2).ToString();
                        Session["role"] = "Admin";
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