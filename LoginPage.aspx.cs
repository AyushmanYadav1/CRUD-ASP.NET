using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TableView
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e) 
        {
            SqlConnection con = new SqlConnection(strcon);
            {
                try
                {
                    string UserName = txtUsername.Text;
                    string Password = txtPassword.Text;
                    con.Open();
                    string qry = "select * from Employee_table where UserName='" + UserName + "' and Password='" + Password + "'";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        Response.Redirect("~/EmployeeForm.aspx");
                    }
                    else
                    {
                        Label4.Text = "Username or Password is not correct Try again..!!";
                    }
                    con.Close();
                }
                catch (Exception)
                {
                    Response.Write("<script language=javascript>alert('ERROR');</script>");
                }
            }

        }

    }
}