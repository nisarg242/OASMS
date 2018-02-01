<%@ Page Title="" Language="C#" MasterPageFile="~/Engineer/MasterPage_Engineer.master" AutoEventWireup="true" CodeFile="Message_Detail2_Inbox.aspx.cs" Inherits="Engineer_Message_Detail2_Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 page-header">
                    <div class="col-lg-6">
                        <h1 class="" style="color: #527fb0;">Message</h1>
                    </div>
                    <div class="col-lg-3" >
                        <label>Date:</label><asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-3" >
                        <label>Time:</label><asp:Label ID="lblTime" runat="server" Text=""></asp:Label>
                    </div>
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        <div class="row">
            <div class="col-lg-12">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="well">
                        <div class="row">
                            <div class="col-lg-12">
                                <fieldset disabled="disabled">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Name</label>
                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
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

