<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage_Employee.master" AutoEventWireup="true" CodeFile="Complaint_Send.aspx.cs" Inherits="Employee_Complaint_Send" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Send Complaint</h1>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        <div class="panel-default">
            <asp:Label ID="lblmsg" Visible="false" runat="server" Text="" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12"></asp:Label>
            <asp:ValidationSummary CssClass="alert alert-danger" ID="ValidationSummary1" runat="server" />
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <i class="fa fa-user"></i> complaint
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Subject</label>
                                    <asp:TextBox ID="txtsub" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqsub" runat="server" ControlToValidate="txtsub" ErrorMessage="Enter Message" Display="None"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Complaint</label>
                                    <asp:TextBox ID="txtMsg" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqMsg" runat="server" ControlToValidate="txtMsg" ErrorMessage="Enter Message" Display="None"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:Button ID="btnSend" runat="Server" class="btn btn-default" Text="Send" Width="100%" Style="background-color: #52a752; color: white;" OnClick="btnSend_Click" />
                                </div>
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:Button ID="btnCancle" runat="server" class="btn btn-default" Text="Cancel" Width="100%" Style="background-color: #52a752; color: white" />
                                </div>
                            </div>
                        </div>
                    </div><!-- /.panel-body -->
                </div><!-- /.panel -->

            </div><!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

