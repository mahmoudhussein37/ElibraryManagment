//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.Data;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Configuration;

//namespace ElibraryManagment
//{
//    public partial class AdminPage : System.Web.UI.Page
//    {
//        //string StrConn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;


//        bool ifuserexist()
//        {
//            SqlConnection conn = new SqlConnection(StrConn);
//            try
//            {
//                if (conn.State == ConnectionState.Closed)
//                {
//                    conn.Open();
//                }
//                SqlCommand cmd = new SqlCommand("SELECT * from Admin_Login_tbl where Admin_Id='" + txtAdminId.Text + "';", conn);
//                SqlDataAdapter da = new SqlDataAdapter(cmd);
//                DataTable dt = new DataTable();
//                da.Fill(dt);
//                if (dt.Rows.Count >= 1)
//                {
//                    return true;
//                }
//                else
//                {
//                    return false;
//                }
//            }
//            catch (Exception ex)
//            {
//                Response.Write("<script>alert('" + ex.Message + "');</script>");
//                return false;
//            }


//        }
//        void addnewadmin()
//        {
//            SqlConnection conn = new SqlConnection(StrConn);
//            try
//            {

//                if (conn.State == ConnectionState.Closed)
//                {
//                    conn.Open();
//                }
//                SqlCommand cmd = new SqlCommand("insert into Admin_Login_tbl (Admin_Id,Full_Name,Email,Password) values ('" + txtAdminId.Text + "','" + txtAdminName.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "')", conn);
//                cmd.ExecuteNonQuery();
//                conn.Close();
//                clearform();
//                GVadminCoursesList.DataBind();

//                Response.Write("<script>alert('Admin added Succesfully!');</script>");
//            }
//            catch (Exception ex)
//            {

//                Response.Write("<Script>alert('" + ex.Message + "');</Script>");
//            }
//        }
//        void Updateadmin()
//        {
//            SqlConnection conn = new SqlConnection(StrConn);
//            try
//            {

//                if (conn.State == ConnectionState.Closed)
//                {
//                    conn.Open();
//                }
//                SqlCommand cmd = new SqlCommand("update Admin_Login_tbl set Full_Name='" + txtAdminName.Text + "',Email='" + txtEmail.Text + "',Password='" + txtPassword.Text + "',Achievements='" + txtAddAchievment.Text + "' where Admin_Id='" + txtAdminId.Text + "'", conn);
//                cmd.ExecuteNonQuery();
//                Response.Write("<script>alert('Admin Updated Succesfully!');</script>");
//                conn.Close();
//                clearform();
//                GVadminCoursesList.DataBind();


//                Response.Write("<script>alert('Admin Updated Succesfully!');</script>");
//            }
//            catch (Exception ex)
//            {

//                Response.Write("<Script>alert('" + ex.Message + "');</Script>");
//            }
//        }
//        void Deleteadmin()
//        {
//            SqlConnection conn = new SqlConnection(StrConn);
//            try
//            {

//                if (conn.State == ConnectionState.Closed)
//                {
//                    conn.Open();
//                }
//                SqlCommand cmd = new SqlCommand("Delete from Admin_Login_tbl where Admin_Id='" + txtAdminId.Text + "')", conn);
//                cmd.ExecuteNonQuery();
//                conn.Close();
//                clearform();
//                GVadminCoursesList.DataBind();

//                Response.Write("<script>alert('Admin Deleted Succesfully!');</script>");
//            }
//            catch (Exception ex)
//            {

//                Response.Write("<Script>alert('" + ex.Message + "');</Script>");
//            }
//        }
//        void clearform()
//        {
//            txtAddAchievment.Text = "";
//            txtAdminId.Text = "";
//            txtAdminName.Text = "";
//            txtEmail.Text = "";
//            txtPassword.Text = "";

//        }
//        void getMemberById()
//        {
//            SqlConnection conn = new SqlConnection(StrConn);
//            try
//            {
//                if (conn.State == ConnectionState.Closed)
//                {
//                    conn.Open();
//                }

//                SqlCommand cmd = new SqlCommand("SELECT * from Admin_Login_tbl where Admin_Id='" + txtAdminId.Text.Trim() + "';", conn);
//                SqlDataAdapter da = new SqlDataAdapter(cmd);
//                DataTable dt = new DataTable();
//                da.Fill(dt);

//                if (dt.Rows.Count >= 1)
//                {
//                    txtAdminName.Text = dt.Rows[0][1].ToString();
//                    txtEmail.Text = dt.Rows[0][2].ToString();
//                    txtPassword.Text = dt.Rows[0][3].ToString();
//                    txtAddAchievment.Text = dt.Rows[0][4].ToString();
//                }
//                else
//                {
//                    Response.Write("<script>alert('Invalid Author ID');</script>");
//                }


//            }
//            catch (Exception ex)
//            {
//                Response.Write("<script>alert('" + ex.Message + "');</script>");

//            }
//        }

    









//    protected void Page_Load(object sender, EventArgs e)
//        {
//            GVadminCoursesList.DataBind();

//        }

//        protected void btnAdd_Click(object sender, EventArgs e)
//        {
//            if(ifuserexist()){
//                Response.Write("<Script>alert('this id is already Exsit try another id');</Script>");
//            }
//            else
//            {
//                addnewadmin();
//            }
            
            
            
//        }
//        protected void btnUpdate_Click(object sender, EventArgs e)
//        {
//            if (ifuserexist())
//            {
//                Updateadmin();
//            }
//            else
//            {

//                Response.Write("<Script>alert('Admin Dose Not Exist');</Script>");
//            }
//        }
//        protected void btnDelete_Click(object sender, EventArgs e)
//        {
//            if (ifuserexist())
//            {
//                Deleteadmin();
//            }
//            else
//            {
//                Response.Write("<Script>alert('Admin Dose Not Exist');</Script>");
//            }
//        }

//        protected void btnAdminId_Click(object sender, EventArgs e)
//        {
//            getMemberById();
//        }
//    }
//}