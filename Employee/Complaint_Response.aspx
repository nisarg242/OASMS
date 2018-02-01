<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage_Employee.master" AutoEventWireup="true" CodeFile="Complaint_Response.aspx.cs" Inherits="Employee_Complaint_Response" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Complaint Response</h1>
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
                        <i class="fa fa-desktop"></i> Responses
                    </div>
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" >
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
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

