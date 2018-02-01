<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="Message_Detail_Common.aspx.cs" Inherits="Admin_pages_Message_Detail_Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid" style="margin-bottom:20px;">
            <div class="row">
                <div class="col-lg-12" style="">
                    <h1 class="" style="color: #527fb0;">Message</h1>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
            <hr />
            
            <div class="col-lg-6" style="margin-bottom:-10px; margin-left:-30px;">
                <ol class="breadcrumb" style="background-color:#fff;">
                    <li><a href="index.aspx"><i class="fa fa-envelope"></i> Inbox</a></li>
                <li class="active"><b>Message</b></li>
            </ol>
            </div>
            <div class="col-lg-3">
                <label>Date:</label><asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-lg-3">
                <label>Time:</label><asp:Label ID="lblTime" runat="server" Text=""></asp:Label>
            </div>
            
        </div><!-- /.container-fluid -->
        <div class="row" style="margin-top:-60px;">
            <div class="col-lg-12">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="well">
                        <div class="row">
                            <div class="col-lg-12">
                                <fieldset disabled="disabled">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>User ID</label>
                                                <asp:TextBox ID="txtUID" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Subject</label>
                                        <asp:TextBox ID="txtsub" runat="server" CssClass="form-control "></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqSub" runat="server" ControlToValidate="txtsub" ErrorMessage="Enter Subject" Display="None"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Message</label>
                                        <asp:TextBox ID="txtMsg" runat="server" CssClass="form-control " TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqMsg" runat="server" ControlToValidate="txtMsg" ErrorMessage="Enter Message" Display="None"></asp:RequiredFieldValidator>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

