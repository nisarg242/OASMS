<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="Message_OutboxA.aspx.cs" Inherits="Admin_pages_Message_OutboxA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .sml40 {
            width: 40%;
        }
        .sml20
        {
            width:20%;
        }
        .sml40h
        {
            width:40%;
            font-weight:700;
        }
        .sml20h
        {
            width:20%;
            font-weight:700;
        }
    </style>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Outbox</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-envelope"></i>&nbsp;Messages
                    </div>
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <asp:DataList ID="DataList1" runat="server" style="width:100%;">
                                <HeaderTemplate>
                                    <table class="table table-responsive table-hover table-striped">
                                        <tr>
                                            <td class="sml20h">User Name</td>
                                            <td class="sml40h">Subject</td>
                                            <td class="sml20h">Date</td>
                                            <td class="sml20h">Time</td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="table table-responsive table-hover table-striped">
                                        <tr>
                                            <td class="sml20">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("r_uname") %>'></asp:Label></td>
                                            <td class="sml40">
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Admin/pages/Message_DetailA.aspx?id=" +Eval("message_id") %>' Text='<%# Eval("subject") %>'></asp:HyperLink></td>
                                            <td class="sml20">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("date").ToString().Substring(0,10) %>'></asp:Label></td>
                                            <td class="sml20">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("time").ToString().Substring(0,8) %>'></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" BorderColor="White" CssClass="table table-hover table-striped">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>User Name</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("r_uname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>Subject</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Admin/pages/Message_DetailA.aspx?id=" +Eval("message_id") %>' Text='<%# Eval("subject") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>Date</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("date").ToString().Substring(0,10) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>Time</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("time").ToString().Substring(0,8) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->

            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

