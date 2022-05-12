using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace TableView
{
    public partial class Salary : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        public string Id = "";
        void Page_Load()
        {
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
                    txtSalary.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
                }
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void btn_LeaveCount(object sender, EventArgs e)
        {
            try
            {
                var x = "";
                string mycon = "Data Source= BHAVNAWKS783; Initial Catalog= master; Integrated Security=true;";
                string myquery = "SELECT * FROM Emp_leave WHERE ID = '" + TXTID.Text.ToString() + "' and Leave_Month = '" + txtMonth.Text.ToString() + "'";
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
                    txtLeave.Text = ds.Tables[0].Rows[0]["Total_Leave"].ToString();
                }
                if (!string.IsNullOrEmpty(txtSalary.Text) && !string.IsNullOrEmpty(txtLeave.Text))
                    x = (Convert.ToInt32(txtSalary.Text) / 30 * Convert.ToInt32(txtLeave.Text)).ToString();
                txtNetSalary.Text = (Convert.ToInt32(txtSalary.Text) - Convert.ToInt32(x)).ToString();
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void HomePage(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployeeForm.aspx");
        }
        protected void btn_InsertData(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Update Emp_Leave set [NetSalary]='" + txtNetSalary.Text.ToString() + "',[SalaryPaidOn]='" + txtPaid.Text.ToString() + "',[Remarks]='" + txtRemarks.Text.ToString() + "' where ID='" + TextId.Text.ToString() + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                txtNetSalary.Text = txtPaid.Text = txtRemarks.Text = "";
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
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
        protected void HelpDesk(object sender, EventArgs e)
        {
            Response.Redirect("~/HelpDesk.aspx");
        }
    }
}