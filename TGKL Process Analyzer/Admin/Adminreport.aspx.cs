using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace TGKL_Process_Analyzer.Admin
{
    public partial class Adminreport : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter dsa;
        DataSet ds;
        string query;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rblStudentToppers_SelectedIndexChanged(object sender, EventArgs e)
        {
            con = Database.getConnection();
           if (rblStudentToppers.SelectedValue == "2")
            {
                lblTitle.Text = "<h4>Most Questioners <br>(Top Thinkers)</h4>";
                query = "Select top 3 tbldoubts.empid, Count(tbldoubts.id) as 'Number Of Doubts' from tbldoubts, tblemployees where tbldoubts.empid=tblemployees.userid Group By tbldoubts.empid Order By Count(tbldoubts.empid) desc";
            }
          
            else if (rblStudentToppers.SelectedValue == "5")
            {
                lblTitle.Text = "<h4>Most Doubts Replied <br>(Top Motivators - Staff)</h4>";
                query = "Select top 3 tbldoubts.managerid, Count(tbldoubts.id) as 'Number of Times Replied for Doubts' from tbldoubts, tblemployees where tbldoubts.empid=tblemployees.userid and tbldoubts.reply IS NOT NULL Group By tbldoubts.managerid Order By Count(tbldoubts.id) desc";
            }
            else if (rblStudentToppers.SelectedValue == "6")
            {
                lblTitle.Text = "<h4>Most Articles Uploaded <br>(Top Uploaders - Staff)</h4>";
                query = "Select top 3 tblfiles.uploader, Count(tblfiles.fileid) as 'Number Of Uploads' from tblfiles, tblemployees where tblfiles.uploader=tblemployees.userid Group By tblfiles.uploader Order By Count(tblfiles.fileid) desc";
            }


            //query = "Select top 5 * from StudentReg";

            dsa = new SqlDataAdapter(query, con);
            ds = new DataSet();
            dsa.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}