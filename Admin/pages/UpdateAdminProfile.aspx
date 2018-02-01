<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="UpdateAdminProfile.aspx.cs" Inherits="Admin_pages_UpdateAdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Update Profile</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
        <div class="panel-default">
            <asp:Label ID="lblmsg" runat="server" Text="Label" CssClass="alert alert-danger col-lg-12"></asp:Label>
        </div>
        <div class="row">
            <div class="col-lg-12">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-user"></i>&nbsp;&nbsp;My Profile 
                        <a style="float:right;" href="changeAdminPassword.aspx" >Change Password</a>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">

                                <div class="form-group">
                                    <label>User Name</label>
                                    <asp:TextBox ID="txtuname" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqUname" runat="server" ControlToValidate="txtuname" ErrorMessage="Enter User Name" Display="None"></asp:RequiredFieldValidator>

                                </div>

                                <div class="form-group">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter email" Display="None"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rgEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email" Display="None" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <label>Mobile</label>
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rvMob" runat="server" ControlToValidate="txtMobile" ErrorMessage="Enter Mobile Number" Display="None"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rgMobile" runat="server" ValidationExpression="" ErrorMessage="Invalid Mobile Number" Display="None" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                                </div>

                                <asp:Button ID="btnsave" runat="Server" class="btn btn-default" data-toggle="modal" data-target="#myModal" Text="Save " Width="245px" Style="background-color: #0094ff; color: white" />
                                <asp:Button ID="btncancel" runat="server" class="btn btn-default" Text="Cancel" Width="245px" Style="background-color: #0094ff; color: white" />

                            </div>
                            <div class="col-lg-6">
                            </div>
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

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Error</h4>
                </div>
                <div class="modal-body">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>

