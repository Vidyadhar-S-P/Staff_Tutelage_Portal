using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace TGKL_Process_Analyzer.Manager
{
    public partial class Manageruploadarticles : System.Web.UI.Page
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

        protected void btnupload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                String fn = FileUpload1.FileName;
                string extn = Path.GetExtension(fn);

                if (extn != ".doc" && extn != ".docx" && extn != ".ppt" && extn != ".pptx" && extn != ".txt" && extn != ".mp4" && extn != ".flv" && extn != ".avi" && extn != ".jpg" && extn != ".gif" && extn != ".png" && extn != ".pdf")
                    readyclass.errormessage(lblerror, "Invalid File Format");
                else
                {
                    FileUpload1.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "//Books//" + FileUpload1.FileName);
                    int fileid = obj.autoid("tblfiles", "fileid");

                    string sql = "insert into tblfiles(fileid,department,title,tags,description,filename,uploader,dateofupload) ";
                    sql = sql + "Values(" + fileid + " , '" + lbldepartment.Text.Trim() + "','" + txttitle.Text.Trim() + "', '" + txttags.Text.Trim() + "', ";
                    sql = sql + "'" + txtdescription.Text.Trim() + "','" + fn + "','" + lblid.Text.Trim() +"','" + DateTime.Now.ToString() + "')";
                    Database.executeQuery(sql);

                    readyclass.errormessage(lblerror, "Article is uploaded successfully");

                    obj.cleartext(Page.Controls);
                }
            }
        }

        protected void btnuploadedarticles_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manageruploadedarticleslist.aspx");
        }
    }
}