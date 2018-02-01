<%@ Page Title="" Language="C#" MasterPageFile="~/Engineer/MasterPage_Engineer.master" AutoEventWireup="true" CodeFile="Feedback_Engg.aspx.cs" Inherits="Engineer_Feedback_Engg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #e0a148;">Feedback</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

        <div class="panel-default">
            <asp:Label ID="lblmsg" Visible="false" runat="server" Text="" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12"></asp:Label>
            <asp:ValidationSummary CssClass="alert alert-danger" ID="ValidationSummary1" runat="server" />
        </div>

        <div class="row">
            <div class="col-lg-12">

                <asp:Panel ID="Panel1" runat="server" >
                    <div class=" well panel-yellow">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Subject</label>
                                    <asp:TextBox ID="txtsub" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqsub" runat="server" ControlToValidate="txtsub" ErrorMessage="Enter Message" Display="None"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Feedback</label>
                                    <asp:TextBox ID="txtMsg" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqMsg" runat="server" ControlToValidate="txtMsg" ErrorMessage="Enter Message" Display="None"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:Button ID="btnSend" runat="Server" class="btn btn-default" Text="Send" Width="100%" Style="background-color: #e0a148; color: white;" OnClick="btnSend_Click"/>
                                </div>
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:Button ID="btnCancle" runat="server" class="btn btn-default" Text="Cancel" Width="100%" Style="background-color: #e0a148; color: white" />
                                </div>
                            </div>
                        </div>

                    </div>
                </asp:Panel>

            </div><!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

