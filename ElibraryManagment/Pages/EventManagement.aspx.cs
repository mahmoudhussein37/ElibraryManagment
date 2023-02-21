using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagment
{
    public partial class AdminCoursesMange : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        static string global_FilePath;

        bool checkIfEventExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Course_Events_tbl where Course_id='" + txtevntId.Text.Trim() + "' OR Course_Name='" + txtEvntName.Text.Trim() + "';", con);
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
       
        void addevent()
        {
            try
            {
                string depart = "";
                foreach (int i in lstDepartment.GetSelectedIndices())
                {
                    depart = depart + lstDepartment.Items[i] + ",";
                }
                // genres = Adventure,Self Help,
                depart = depart.Remove(depart.Length - 1);

                string filepath = "../book_inventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("../Image_Course/" + filename));
                filepath = "../Image_Course/" + filename;
                global_FilePath= filepath;




                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("INSERT INTO Course_Events_tbl (Course_id,Course_Name,Course_Admin,Course_Description,Course_Place,Course_DateStart,Course_DateFinish,Course_DateFromTo,Course_Price,Course_Lecturer,Course_Max,Course_Reword,Course_Member,Course_Department,Course_Imge) values('" + txtevntId.Text + "','" + txtEvntName.Text + "','" + ddlAdminName.SelectedItem.Value + "','" + txtEventDisc.Text + "' ,'" + txtPlace.Text + "','" + txtstart.Text + "','" + txtfinsh.Text + "','" + txtFromto.Text + "','" + TxtCost.Text + "','" + TxtLec.Text + "','" + TxtMax.Text + "','" + txtReword.Text + "','" + TxtEvntMembers.Text + "','" + depart + "','" + filepath + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Event added successfully.');</script>");
                gvEventList.DataBind();
            }

            catch (Exception)
            {

            }
           
        }
        void getEventbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Course_Events_tbl WHERE Course_id='" + txtevntId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtEvntName.Text = dt.Rows[0]["Course_Name"].ToString();
                    ddlAdminName.SelectedItem.Value = dt.Rows[0]["Course_Admin"].ToString();
                    txtEventDisc.Text = dt.Rows[0]["Course_Description"].ToString();
                    txtPlace.Text = dt.Rows[0]["Course_Place"].ToString().Trim();
                    txtstart.Text = dt.Rows[0]["Course_DateStart"].ToString().Trim();
                    txtfinsh.Text = dt.Rows[0]["Course_DateFinish"].ToString().Trim();
                    txtFromto.Text = dt.Rows[0]["Course_DateFromTo"].ToString().Trim();
                    TxtCost.Text = dt.Rows[0]["Course_Price"].ToString();
                    TxtLec.Text = dt.Rows[0]["Course_Lecturer"].ToString();
                    TxtMax.Text = dt.Rows[0]["Course_Max"].ToString();
                    txtReword.Text = dt.Rows[0]["Course_Reword"].ToString();
                    TxtEvntMembers.Text = dt.Rows[0]["Course_Member"].ToString();
                    lstDepartment.ClearSelection();
                    string[] Departa = dt.Rows[0]["Course_Department"].ToString().Split(',');
                    for (int i = 0; i < Departa.Length; i++)
                    {
                        for (int j = 0; j < lstDepartment.Items.Count; j++)
                        {
                            if (lstDepartment.Items[j].ToString() == Departa[i])
                            {
                                lstDepartment.Items[j].Selected = true;
                            }
                        }

                    }
                //  FileUpload1.PostedFile. = dt.Rows[0]["Course_Imge"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Event id Not Exsit');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }


        void updateEventsByID()
        {

            if (checkIfEventExists())
            {
                try
                {
                    Response.Write("<script>alert( '" + ddlAdminName.SelectedItem.Value + "');</script>");



                    string departa = "";
                    foreach (int i in lstDepartment.GetSelectedIndices())
                    {
                        departa = departa + lstDepartment.Items[i] + ",";
                    }
                    departa = departa.Remove(departa.Length - 1);

                    string filepath = "../book_inventory/books1.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_FilePath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("../Image_Course/" + filename));
                        filepath = "../Image_Course/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Course_Events_tbl set Course_Name='" + txtEvntName.Text+ "', Course_Admin='"+ddlAdminName.SelectedItem.Value+"', Course_Description='"+txtEventDisc.Text+"', Course_Place='"+txtPlace.Text+"', Course_DateStart='"+txtstart.Text+"', Course_DateFinish='"+txtfinsh.Text+"', Course_DateFromTo='"+txtFromto.Text+"', Course_Price='"+TxtCost.Text+"', Course_Lecturer='"+TxtLec.Text+"', Course_Max='"+TxtMax.Text+"', Course_Reword='"+txtReword.Text+"', Course_Member='"+TxtEvntMembers.Text+ "', Course_Department='" + departa+ "', Course_Imge='" + filepath+ "'   where Course_id='" + txtevntId.Text + "'", con);


                    cmd.ExecuteNonQuery();

                    con.Close();

                    gvEventList.DataBind();

                    Response.Write("<script>alert('Book Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Event id Not Exsit');</script>");
            }
        }

        void deleteeventID()
        {
            if (checkIfEventExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Course_Events_tbl WHERE Course_id='" + txtevntId.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deleted Successfully');</script>");

                    gvEventList.DataBind();

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





        protected void Page_Load(object sender, EventArgs e)
        {
            gvEventList.DataBind();


        }

        protected void btnIdGO_Click(object sender, EventArgs e)
        {
            getEventbyID();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfEventExists())
            {
                Response.Write("<script>alert('EVENT Already Exists, try some other Book ID');</script>");
            }
            else
            {
                addevent();
            }
        
    }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
                updateEventsByID();

           
            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            deleteeventID();    
        }
    }
}