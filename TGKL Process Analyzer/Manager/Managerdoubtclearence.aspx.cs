using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace TGKL_Process_Analyzer.Manager
{
    public partial class Managerdoubtclearence : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                con = Database.getConnection();

                cmd = new SqlCommand("Select topic from tbldoubts where id=" + id, con);
                lbltopic.Text = cmd.ExecuteScalar().ToString();

                con.Close();

                con = Database.getConnection();

                cmd = new SqlCommand("Select doubt from tbldoubts where id=" + id, con);
                lblquestion.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
        }

        protected void btnreply_Click(object sender, EventArgs e)
        {
            con = Database.getConnection();
            int id = Convert.ToInt32(Request.QueryString["id"]);

            SqlCommand cmd = new SqlCommand("Update tbldoubts set reply='" + txtreply.Text.Trim() + "', replied=1 where id=" + id, con);
            cmd.ExecuteNonQuery();

            con.Close();

            Show("Answer is posted successfully", "Managerdoubtslist.aspx");
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