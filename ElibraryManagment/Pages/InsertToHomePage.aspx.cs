using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace ElibraryManagment
{
    public partial class AdminMangement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;


        bool checkIfeventExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Course_Events_tbl WHERE Course_id='" + txtEventId.Text.Trim() + "' ", con);
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
            catch (Exception )
            {
                return false;
            }

        }

        void gettxtsNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select Course_Name from Course_Events_tbl WHERE Course_id='" + txtEventId.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtCourseName.Text = dt.Rows[0]["Course_Name"].ToString();
                    txtAdminName.Text = dt.Rows[0]["Course_Admin"].ToString();
                    txtPlace.Text = dt.Rows[0]["Course_Place"].ToString();
                    txtStart.Text = dt.Rows[0]["Course_DateStart"].ToString();
                    txtFinish.Text = dt.Rows[0]["Course_DateFinish"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Wrong Event ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        //void getRowColor()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        SqlCommand cmd = new SqlCommand("select Course_Issue from Course_Events_tbl WHERE Course_id='" + txtEventId.Text.Trim() + "'", con);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        if (dt.Rows.Count >= 1)
        //        {
        //            for (int i = 0; i < gvInsertEvent.Rows.Count; i++)
        //            {
        //                if (gvInsertEvent.Rows[i].Cells[0].Text.ToString() == txtEventId.Text)
        //                {
        //                    gvInsertEvent.Rows[i].BackColor = System.Drawing.Color.LightGreen;
        //                }
        //            }

        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('Wrong Event ID');</script>");
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");

        //    }
        //}
        void viewRowsColorAll()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select Course_id from Course_Events_tbl where Course_Issue='RowEnabled' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                
                for (int x = 0; x < gvInsertEvent.Rows.Count ; x += 1)
                {
                    
                    for (int i = 0; i <dt.Rows.Count; i++)
                    {
                        int date1 = int.Parse(gvInsertEvent.Rows[x].Cells[0].Text.ToString());
                        int date2 = int.Parse(dt.Rows[i][0].ToString());
                        if (date1== date2)
                        {
                            gvInsertEvent.Rows[x].BackColor = System.Drawing.Color.LightGreen;

                        }
                    }        
                }
                cmd = new SqlCommand("select Course_id from Course_Events_tbl where Course_Issue='RowDisabled' ", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                for (int x = 0; x < gvInsertEvent.Rows.Count; x += 1)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        int date1 = int.Parse(gvInsertEvent.Rows[x].Cells[0].Text.ToString());
                        int date2 = int.Parse(dt.Rows[i][0].ToString());
                        if (date1 == date2)
                        {
                            gvInsertEvent.Rows[x].BackColor = System.Drawing.Color.LightPink;

                        }
                    }
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            gvInsertEvent.DataBind();
            viewRowsColorAll();
        }

        protected void btnRelese_Click(object sender, EventArgs e)
        {


            for (int i = 0; i < gvInsertEvent.Rows.Count; i++)
            {
                if (gvInsertEvent.Rows[i].Cells[0].Text.ToString() == txtEventId.Text)
                {

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }


                    SqlCommand cmd = new SqlCommand("Update  Course_Events_tbl  set Course_Issue ='RowEnabled' where  Course_id ='" + txtEventId.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Event Enabled successfully.');</script>");
                    gvInsertEvent.DataBind();
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);

                }
            }
    
            //getRowColor();

        }



        protected void btnStop_Click(object sender, EventArgs e)
        {

            for (int i = 0; i < gvInsertEvent.Rows.Count; i++)
            {
                if (gvInsertEvent.Rows[i].Cells[0].Text.ToString() == txtEventId.Text)
                {

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }


                    SqlCommand cmd = new SqlCommand("Update  Course_Events_tbl  set Course_Issue ='RowDisabled' where  Course_id ='" + txtEventId.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Event Disabled successfully.');</script>");
                    gvInsertEvent.DataBind();
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);

                }

            }

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            gettxtsNames();
        }

        protected void gvInsertEvent_RowDataBound(object sender, GridViewRowEventArgs e)
        { 
        }
    }
}