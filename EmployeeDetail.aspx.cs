using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TableView
{
    public partial class EmployeeDetail : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        public string Id = "";
        void Page_Load()
        {
            //txtStartDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            try
            {
                Id = Request.QueryString["ID"];
                string mycon = "Data Source= BHAVNAWKS783; Initial Catalog= master; Integrated Security=true;";
                string myquery = "Select * From Employee_table Where ID=" + Id;
                SqlConnection con = new SqlConnection(mycon);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    TXTID.Text = ds.Tables[0].Rows[0]["ID"].ToString();
                    txtDOJ.Text = ds.Tables[0].Rows[0]["DateOfJoining"].ToString();
                    txtJobTitle.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();
                    txtET.Text = ds.Tables[0].Rows[0]["EmployeeType"].ToString();
                    txtSalary.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
                }
            }
            catch(Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void Update_Button(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Update Employee_table set [DateOfJoining] ='" + txtDOJ.Text.ToString() + "', [JobTitle] ='" + txtJobTitle.Text.ToString() + "', [EmployeeType] ='" + txtET.Text.ToString() + "', [Salary] ='" + txtSalary.Text.ToString() + "' where ID='" + TXTID.Text.ToString() + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Page_Load();
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            try
            {
                string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(flUpload.FileName);
                string fileExtension = Path.GetExtension(flUpload.FileName);
                fileNameWithoutExtension = Id;
                flUpload.PostedFile.SaveAs(Server.MapPath("/" + fileNameWithoutExtension + fileExtension));
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void ApplyLeave(object sender, EventArgs e)
        {
             ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ApplyLeave('" + txtId1 + "','" + txtLeave + "','" + txtStartDate + "','" + txtTotalDays + "');", true);
        }
        protected void btn_ApplyLeave(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("INSERT INTO Emp_Leave(ID, Leave_Type, Start_Date, Total_Leave) VALUES('" + txtId1.Text.ToString() + "','" + txtLeave.Text.ToString() + "','" + txtStartDate.Text.ToString() + "','" + txtTotalDays.Text.ToString() + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Page_Load();
                txtLeave.Text = txtTotalDays.Text  = txtStartDate.Text = "";
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }

        protected void clcSalary(object sender, EventArgs e)
        {
            var Id = TXTID.Text;
            Response.Redirect("~/Salary.aspx?ID=" + Id);
        }
        protected void HelpDesk(object sender, EventArgs e)
        {
            Response.Redirect("~/HelpDesk.aspx");
        }
        protected void SalaryPage(object sender, EventArgs e)
        {
            var Id = TXTID.Text;
            Response.Redirect("~/SalaryDetails.aspx?ID=" + Id);
        }
        protected void HomePage(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployeeForm.aspx");
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("INSERT INTO Employee_table( NAME, Address, Age, City, Gender) VALUES('" + TextName.Text.ToString() + "','" + TextAddress.Text.ToString() + "', '" + TextAge.Text.ToString() + "', '" + TextCity.Text.ToString() + "', '" + TextGender.Text.ToString() + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Page_Load();
                TextName.Text = TextAddress.Text = TextAge.Text = TextCity.Text = TextGender.Text = "";
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
    }
}