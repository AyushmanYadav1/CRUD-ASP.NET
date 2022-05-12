using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TableView
{
    public partial class SalaryDetails : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;

        public string Id = "";
        int m = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Id = Request.QueryString["ID"];
            string mycon = "Data Source= BHAVNAWKS783; Initial Catalog= master; Integrated Security=true;";
            string myquery = "Select Leave_Type,Start_Date,Total_Leave, Salary From Emp_leave Where ID=" + Id;
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        //protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        string val1 = e.Row.Cells[1].Text;
        //        string val2 = e.Row.Cells[2].Text;
        //        Label lblTotal = (Label)e.Row.Cells[3].FindControl("Label1");
        //        int sum = int.Parse(val2) / 30 * int.Parse(val1);
        //        lblTotal.Text += int.Parse(val2) - sum;
        //    }
        //}
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label TotalLeave = (Label)e.Row.FindControl("lblTotalLeave");
                int addedSalary =  int.Parse(TotalLeave.Text);
                TotalLeave.Text = addedSalary.ToString();
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label TotalLeave = (Label)e.Row.FindControl("lblTotalLeave");
                m = m + int.Parse(TotalLeave.Text);
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblTotalPrice = (Label)e.Row.FindControl("TotalLeave");
                lblTotalPrice.Text = m.ToString();
            }
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    string val1 = e.Row.Cells[1].Text;
            //    string val2 = e.Row.Cells[2].Text;
            //    Label lblTotal = (Label)e.Row.Cells[3].FindControl("Label1");
            //    int sum = int.Parse(val2) / 30 * int.Parse(val1);
            //    lblTotal.Text += int.Parse(val2) - sum;
            //}
        }
        protected void ShowMonthLeaves(object sender, EventArgs e)
        {
            Id = Request.QueryString["ID"];
            string mycon = "Data Source= BHAVNAWKS783; Initial Catalog= master; Integrated Security=true;";
            string myquery = "Select Leave_Type,Start_Date,Total_Leave From Emp_leave Where ID= @Id ORDER BY Start_Date;";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void HomePage(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployeeForm.aspx");
        }
        protected void HelpDesk(object sender, EventArgs e)
        {
            Response.Redirect("~/HelpDesk.aspx");
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
                TextName.Text = TextAddress.Text = TextAge.Text = TextCity.Text = TextGender.Text = "";
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void InsertPaidDate(object sender, EventArgs e)
        {
            try
            {
                string mycon = "Data Source= BHAVNAWKS783; Initial Catalog= master; Integrated Security=true;";
                string myquery = "Update Salary_Details set [PaidDate]='" + txtPaid.Text.ToString() + "' where Month='" + txtPaidMonth.Text.ToString() + "' and ID=" + Id;
                SqlConnection con = new SqlConnection(mycon);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                txtPaid.Text = txtPaidMonth.Text = "";
                string script = "alert('Are You Sure? ');";
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Test", script, true);
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
    }
}
