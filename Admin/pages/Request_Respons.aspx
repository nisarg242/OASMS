<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="Request_Respons.aspx.cs" Inherits="Admin_pages_Request_Respons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .sml40 {
            width: 40%;
        }
        .sml10
        {
            width:10%;
        }
        .sml40h
        {
            width:40%;
            font-weight:700;
        }
        .sml10h
        {
            width:10%;
            font-weight:700;
        }
    </style>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Equipment Response</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

        <div class="row">
            <div class="col-lg-12">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-desktop"></i> Responses
                    </div>
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <asp:DataList ID="DataList1" runat="server" style="width:100%;">
                                <HeaderTemplate>
                                    <table class="table table-responsive table-hover table-striped">
                                        <tr>
                                            <td class="sml10h">Name</td>
                                            <td class="sml10h">User Name</td>
                                            <td class="sml10h">Equipment</td>
                                            <td class="sml40h">Response</td>
                                            <td class="sml10h">Date</td>
                                            <td class="sml10h">Time</td>
                                            <td class="sml10h">Admin ID</td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="table table-responsive table-hover table-striped">
                                            <tr>
                                                <td class="sml10">
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("r_name") %>'></asp:Label></td>
                                                <td class="sml10">
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("r_uname") %>'></asp:Label></td>
                                                <td class="sml10">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("equipment") %>'></asp:Label></td>
                                                <td class="sml40">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("response") %>'></asp:Label></td>
                                                <td class="sml10">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("date").ToString().Substring(0,10) %>'></asp:Label></td>
                                                <td class="sml10">
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("time").ToString().Substring(0,8) %>'></asp:Label></td>
                                                <td class="sml10">
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("s_uname") %>'></asp:Label></td>
                                            </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </div><!-- /.row (nested) -->
                    </div><!-- /.panel-body -->
                </div><!-- /.panel -->

            </div><!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

