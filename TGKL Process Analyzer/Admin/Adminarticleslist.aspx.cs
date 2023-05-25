using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Net;

namespace TGKL_Process_Analyzer.Admin
{
    public partial class Adminarticleslist : System.Web.UI.Page
    {
        readyclass obj = new readyclass();
        string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill();

                lblid.Text = Request.QueryString["fileid"];

                if (lblid.Text.Trim() != "")
                    filldetails();

                btndelete.Attributes.Add("onclick", "return confirm();");
            }
        }

        private void fill()
        {
            sql = "Select * from tblfiles";
            obj.BindGrid(grdfiles, sql);
        }

        protected void grdfiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdfiles.PageIndex = e.NewPageIndex;
            fill();
        }

        private void filldetails()
        {
            SqlConnection con = Database.getConnection();
            SqlCommand cmd = new SqlCommand("select department,title,description,filename,uploader,dateofupload,downloads from tblfiles where fileid='" + lblid.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                lbldepartment.Text = dr[0].ToString().Trim();
                lbltitle.Text = dr[1].ToString().Trim();
                lbldescription.Text = dr[2].ToString().Trim();
                lblfilename.Text = dr[3].ToString().Trim();
                lbluploader.Text = dr[4].ToString().Trim();
                lbldateofupload.Text = dr[5].ToString().Trim();
                lblnoofdownloads.Text = dr[6].ToString().Trim();
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (lblid.Text.Trim() == "")
                readyclass.errormessage(lblerror, "Select Article to Delete");
            else
            {

                string sql = "delete from tblfiles where fileid='" + lblid.Text.Trim() + "'";
                Database.executeQuery(sql);

                readyclass.errormessage(lblerror, "Data is deleted successfully");

                Response.Redirect(Request.Url.AbsolutePath);
            }
        }

        protected void btndownload_Click(object sender, EventArgs e)
        {
            if (lblid.Text.Trim() == "")
                readyclass.errormessage(lblerror, "Select Article to Download");
            else
            {
                string strURL = "\\Books\\" + lblfilename.Text.Trim();
                WebClient req = new WebClient();
                HttpResponse response = HttpContext.Current.Response;
                response.Clear();
                response.ClearContent();
                response.ClearHeaders();
                response.Buffer = true;
                response.AddHeader("Content-Disposition", "attachment;filename=\"" + Server.MapPath(strURL) + "\"");
                byte[] data = req.DownloadData(Server.MapPath(strURL));
                response.BinaryWrite(data);
                response.End();
            }
        }
    }
}