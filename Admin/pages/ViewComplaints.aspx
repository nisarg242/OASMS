<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="ViewComplaints.aspx.cs" Inherits="Admin_pages_ViewComplaints" %>

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
                    <h1 class="page-header" style="color: #4e984e;">Complaints</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <i class="fa fa-desktop" style="color:#"></i> Complaint
                    </div>
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <asp:DataList ID="DataList1" runat="server" style="width:100%;">
                                <HeaderTemplate>
                                    <table class="table table-responsive table-hover table-striped">
                                        <tr>
                                            <td class="sml20h">Sender ID</td>
                                            <td class="sml20h">Sender</td>
                                            <td class="sml20h">Subject</td>
                                            <td class="sml20h">Date</td>
                                            <td class="sml20h">Time</td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="table table-responsive table-hover table-striped">
                                            <tr>
                                                <td class="sml20">
                                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("s_name") %>'></asp:Label></td>
                                                <td class="sml20">
                                                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("s_uname") %>'></asp:Label></td>
                                                <td class="sml20">
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Admin/pages/complaint_detailA.aspx?id=" +Eval("complaint_id") %>' Text='<%# Eval("subject") %>'></asp:HyperLink></td>
                                                <td class="sml20">
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("date").ToString().Substring(0,10) %>'></asp:Label></td>
                                                <td class="sml20">
                                                    <asp:Label ID="lblTime" runat="server" Text='<%# Eval("time").ToString().Substring(0,8) %>'></asp:Label></td>
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

