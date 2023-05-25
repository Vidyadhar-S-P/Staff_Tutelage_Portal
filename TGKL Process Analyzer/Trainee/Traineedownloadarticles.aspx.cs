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
    public partial class Traineedownloadarticles : System.Web.UI.Page
    {
        int downloads;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = Database.getConnection();
                SqlCommand cmd = new SqlCommand("Select downloads from tblfiles where filename='" + Request.Params["filename"].ToString() + "'", con);
                string down = cmd.ExecuteScalar().ToString();

                if (down == "")
                    downloads = 1;
                else
                    downloads = Convert.ToInt32(down) + 1;

                con.Close();

                con = Database.getConnection();
                cmd = new SqlCommand("Update tblfiles set downloads=" + downloads + " where filename='" + Request.Params["filename"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("../Books/" + Request.Params["filename"].ToString());
            }
        }
    }
}