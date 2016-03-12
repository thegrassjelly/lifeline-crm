﻿using System;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;


public partial class Admin_Logs_Reports_ExceptionLogReports : System.Web.UI.Page
{
    private string name;
    private string type;
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            MinMaxDate();
        }
        GetExceptionLogs();
    }

    void MinMaxDate()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MIN(Timestamp) AS Min, MAX(Timestamp) As Max  " +
                "FROM Exceptions";
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                dr.Read();
                if (dr.HasRows)
                {
                    DateTime DateOne = Convert.ToDateTime(dr["Min"].ToString());
                    txtDate1.Text = DateOne.ToString("yyyy-MM-dd");
                    DateTime DateTwo = Convert.ToDateTime(dr["Max"].ToString());
                    txtDate2.Text = DateTwo.ToString("yyyy-MM-dd");
                }
            }
        }
    }

    void GetExceptionLogs()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "SELECT LastName + ', ' + FirstName AS Name, UserType FROM Users " +
                "INNER JOIN Types ON Users.TypeID=Types.TypeID WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    name = dr["Name"].ToString();
                    type = dr["UserType"].ToString();
                }
            }

            ReportDocument report = new ReportDocument();
            report.Load(Server.MapPath("~/Admin/Logs/Reports/rptExceptionReports.rpt"));

            if (Helper.Secured() != "true")
                report.DataSourceConnections[0].SetConnection(Helper.GetCrServer(), Helper.GetCrDb(), true);
            else
                report.DataSourceConnections[0].SetConnection(Helper.GetCrServer(), Helper.GetCrDb(), Helper.GetCrvUser(), Helper.GetCrvPass());

            report.SetParameterValue("Name", name);
            report.SetParameterValue("UserType", type);
            report.SetParameterValue("Date1", txtDate1.Text);
            report.SetParameterValue("Date2", txtDate2.Text);

            crvException.ReportSource = report;
            crvException.DataBind();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GetExceptionLogs();
    }
}