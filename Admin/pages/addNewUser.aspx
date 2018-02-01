<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="addNewUser.aspx.cs" Inherits="Admin_pages_addNewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.panel-default').hide();

            $('#btnsave').click(function(){
                $('.panel-default').show();
                //e.preventDefault();
            });
        });
    </script>
   <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Create New User</h1>
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

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-user"></i> New User
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">

                                <div class="form-group">
                                    <label>User ID</label>
                                    <asp:TextBox ID="txtUid" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqUid" runat="server" ControlToValidate="txtUid" ErrorMessage="Enter User ID" Display="None"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label>Name</label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqName" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Name" Display="None"></asp:RequiredFieldValidator>

                                </div>

                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqpwd" runat="server" ErrorMessage="Enter Password" Display="None" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Retype Password</label>
                                    <asp:TextBox ID="txtRpwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqRpwd" runat="server" ErrorMessage="Please retype Password" Display="None" ControlToValidate="txtRpwd"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cpPwd" runat="server" ErrorMessage="Password does not match" ControlToCompare="txtPwd" ControlToValidate="txtRpwd" Display="None"></asp:CompareValidator>
                                </div>

                                <%--<asp:Button ID="btnsave" runat="Server" class="btn btn-default" data-toggle="modal" data-target="#myModal" Text="Save " Width="245px"  style="background-color:#0094ff;color:white" />
                                <asp:Button ID="btncancel" runat="server" class="btn btn-default" Text="Cancel" Width="245px" style="background-color:#0094ff;color:white" />--%>

                            </div>
                            <div class="col-lg-6">

                                <div class="form-group">
                                    <label>Department </label>
                                    <asp:DropDownList ID="dlistDept" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rvdept" runat="server" Display="None" ErrorMessage="Please Select Department" InitialValue="Select" ControlToValidate="dlistdept"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <label>User Type </label>
                                    <asp:DropDownList ID="dlistUtype" runat="server" CssClass="form-control">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>Admin</asp:ListItem>
                                        <asp:ListItem>Employee</asp:ListItem>
                                        <asp:ListItem>Hardware Engineer</asp:ListItem>
                                        <asp:ListItem>Network Engineer</asp:ListItem>
                                        <asp:ListItem>System Engineer</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rvutype" runat="server" Display="None" ErrorMessage="Please Select User Type" InitialValue="Select" ControlToValidate="dlistUtype"></asp:RequiredFieldValidator>

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
                                    <asp:RegularExpressionValidator ID="rgMobile" runat="server" ValidationExpression="[7-9]\d{9}" ErrorMessage="Invalid Mobile Number" Display="None" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                </div>



                            </div>

                        </div>
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <asp:Button ID="btnsave" runat="Server" class="btn btn-default" data-toggle="modal" data-target="#myModal" Text="Save" Width="100%" style="background-color:#0094ff;color:white;" OnClick="btnsave_Click1" />
                        </div>
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <asp:Button ID="btncancel" runat="server" class="btn btn-default" Text="Cancel" Width="100%" style="background-color:#0094ff;color:white" />
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

