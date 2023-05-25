using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace TGKL_Process_Analyzer.Trainee
{
    public partial class Traineepostnewdoubt : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblid.Text = Session["userid"].ToString();

                SqlConnection con = Database.getConnection();
                SqlCommand cmd = new SqlCommand("select department from tblemployees where userid='" + lblid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.Read())
                {
                    lbldepartment.Text = dr[0].ToString().Trim();
                }
                dr.Close();
                cmd.Dispose();
                con.Close();
            }
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            String managerid;
            //String did;
            int id;

            SqlConnection con = Database.getConnection();

            id = obj.autoid("tbldoubts", "id");

            SqlCommand cmd = new SqlCommand("select userid from tblemployees where department='" + lbldepartment.Text.Trim() + "' and emprole='Manager'", con);
            managerid = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("insert into tbldoubts(id,topic,doubt,department,empid,managerid) values (" + id + ",'" + txtTopic.Text.Trim() + "','" + txtDoubt.Text.Trim() + "','" + lbldepartment.Text.Trim() + "','" + Session["userid"] + "','" + managerid + "')", con);
            cmd.ExecuteNonQuery();


            con.Close();

            Show("Doubt is posted successfully", "Traineeinbox.aspx");
        }

        public void Show(string message, string url)
        {
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += url;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}