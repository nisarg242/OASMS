<%@ Page Title="" Language="C#" MasterPageFile="~/Engineer/MasterPage_Engineer.master" AutoEventWireup="true" CodeFile="Equipment_History2.aspx.cs" Inherits="Engineer_Equipment_History2" %>

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
                    <h1 class="page-header" style="color: #527fb0;">Equipment History</h1>
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
                        <i class="fa fa-desktop"></i> History
                    </div>
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <asp:DataList ID="DataList1" runat="server" style="width:100%;">
                                <HeaderTemplate>
                                    <table class="table table-responsive table-hover table-striped">
                                        <tr>
                                            <td class="sml20h">Equipment</td>
                                            <td class="sml40h">Description</td>
                                            <td class="sml20h">Date</td>
                                            <td class="sml20h">Time</td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="table table-responsive table-hover table-striped">
                                            <tr>
                                                <td class="sml20">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("equipment") %>'></asp:Label></td>
                                                <td class="sml40">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("description") %>'></asp:Label></td>
                                                <td class="sml20">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("date").ToString().Substring(0,10) %>'></asp:Label></td>
                                                <td class="sml20">
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("time").ToString().Substring(0,8) %>'></asp:Label></td>
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

