﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Issue-Inquiry.aspx.cs" Inherits="Account_Issue_Inquiry" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Feedbacks</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Issues and Inquiries form</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>
                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div id="issue" runat="server" class="alert alert-success text-center" visible="false">
                            A customer care representative will reply to you shortly, Thanks!
                        </div>
                        <div id="error" runat="server" class="alert alert-warning text-center" visible="false" style="color: white">
                            The message pushed through, but there was an error in sending the email notification to you.
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">First Name</label>
                                    <div class="col-lg-6 col-xs-12">
                                        <asp:TextBox ID="txtFirstName" class="form-control" runat="server" required />
                                        <asp:RegularExpressionValidator ID="fnVld" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtFirstName"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                            Text="Enter a valid name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                                    <div class="col-lg-6 col-xs-12">
                                        <asp:TextBox ID="txtLastName" class="form-control" runat="server" required />
                                        <asp:RegularExpressionValidator ID="lnVld" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtLastName"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                            Text="Enter a valid name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Email</label>
                                    <div class="col-lg-8 col-xs-12">
                                        <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" required />
                                        <asp:RegularExpressionValidator ID="emlVld" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmail"
                                            ErrorMessage="Please enter valid e-mail address"
                                            ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Category</label>
                                    <div class="col-lg-6 col-xs-12">
                                        <asp:TextBox ID="txtCategory" class="form-control" runat="server" disabled>Issues/Inquiries</asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Issue/Inquiry Type</label>
                                    <div class="col-lg-5 col-xs-12">
                                        <asp:DropDownList ID="ddlMessageCat" runat="server" class="form-control" required>
                                            <asp:ListItem>User Interface problems</asp:ListItem>
                                            <asp:ListItem>Website functionality problems</asp:ListItem>
                                            <asp:ListItem>Incorrect records</asp:ListItem>
                                            <asp:ListItem>Error Pages</asp:ListItem>
                                            <asp:ListItem>Account/Membership Issues</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Subject</label>
                                    <div class="col-lg-6 col-xs-12">
                                        <asp:TextBox ID="txtSubject" class="form-control" runat="server"
                                            title="For site issues, please include the name of the webpage." required />
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <div class="col-lg-12 col-xs-12">
                                <label class="control-label">
                                    Comments
                                </label>
                                <asp:TextBox ID="txtMessage" Width="100%" Height="100px" runat="server" TextMode="MultiLine"
                                    Style="max-height: 100%; max-width: 100%" />
                            </div>
                        </div>
                        <hr />
                        <div class="col-lg-12">
                            <span class="pull-right">
                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                            </span>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
</asp:Content>

