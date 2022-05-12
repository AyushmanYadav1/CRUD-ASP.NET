using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace TableView
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                if (!IsPostBack)
                {
                    BindGrid();
                }
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        void BindGrid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("SELECT ID, Name, Address,Age,City, Gender FROM Employee_table;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Update Employee_table set [NAME]='" + txtName.Text.ToString() + "',[Address]='" + txtAddress.Text.ToString() + "',[Age]='" + txtAge.Text.ToString() + "',[City]='" + txtCity.Text.ToString() + "',[Gender]='" + txtGender.Text.ToString() + "' where ID='" + TextId.Text.ToString() + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
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
                BindGrid();
                TextName.Text = TextAddress.Text = TextAge.Text = TextCity.Text = TextGender.Text = "";
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Delete from Employee_table WHERE ID = '" + txtEmployeeId.Text.ToString() + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }

        protected void ShowPopup(object sender, EventArgs e)
        {
            try
            {
                int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
                txtEmployeeId.Text = GridView1.Rows[rowind].Cells[1].Text;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + txtEmployeeId + "');", true);
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void EditShowPopup(object sender, EventArgs e)
        {
            try
            {
                int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
                TextId.Text = GridView1.Rows[rowind].Cells[1].Text;
                txtName.Text = GridView1.Rows[rowind].Cells[2].Text;
                txtAddress.Text = GridView1.Rows[rowind].Cells[3].Text;
                txtAge.Text = GridView1.Rows[rowind].Cells[4].Text;
                txtCity.Text = GridView1.Rows[rowind].Cells[5].Text;
                txtGender.Text = GridView1.Rows[rowind].Cells[6].Text;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "EditShowPopup('" + TextId + "','" + txtName + "','" + txtAddress + "','" + txtAge + "','" + txtCity + "','" + txtGender + "');", true);
            }
            catch (Exception)
            {
                Response.Redirect("~/ErrorView.aspx");
            }
        }
        protected void ClickDetails(object sender, EventArgs e)
        {
            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            var Id = GridView1.Rows[rowind].Cells[1].Text;
            Response.Redirect("~/EmployeeDetail.aspx?ID=" + Id);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }
        protected void btn_Search(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlDataAdapter da = new SqlDataAdapter("select ID, Name, Address,Age,City, Gender from Employee_table where Name like '%" + txtSearch.Text + "%'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
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