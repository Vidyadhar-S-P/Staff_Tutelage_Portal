using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace TGKL_Process_Analyzer.User
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                txtuserid.Focus();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string sql = "select * from tbllogin where userid= '" + txtuserid.Text.Trim() + "' and password='" + txtpassword.Text.Trim() + "'";

            SqlConnection con = Database.getConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rdr1 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            if (rdr1.Read())
            {
                string str = rdr1[2].ToString();

                Session["userid"] = rdr1[0].ToString();
                cmd.Dispose();
                con.Close();

                if (str == "Admin")
                {
                    Response.Redirect("../Admin/Adminarticleslist.aspx");
                }
                else if (str == "Manager")
                {
                    Response.Redirect("../Manager/Managerdoubtslist.aspx");
                }
                else if (str == "Trainee")
                {
                    Response.Redirect("../Trainee/Traineeinbox.aspx");
                }
            }
            else
            {
                readyclass.errormessage(lblerror, "Invalid Username or Password");
                rdr1.Close();
                cmd.Dispose();
                con.Close();
            }
        }
    }
}