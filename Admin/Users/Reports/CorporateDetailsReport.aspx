﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="CorporateDetailsReport.aspx.cs" Inherits="Admin_Users_Reports_CorporateDetailsReport" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Reports</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <script src='<%= Page.ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js") %>'></script>
        <div class="x_panel">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="x_title">
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="x_content">
                        <CR:CrystalReportViewer ID="crvCorporateDetails" runat="server" AutoDataBind="True"
                            EnableDatabaseLogonPrompt="False"
                            ToolPanelView="None"
                            GroupTreeImagesFolderUrl=""
                            Height="100px"
                            ToolbarImagesFolderUrl=""
                            ToolPanelWidth="200px"
                            Width="350px" EnableParameterPrompt="False" ReuseParameterValuesOnRefresh="True" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</asp:Content>

