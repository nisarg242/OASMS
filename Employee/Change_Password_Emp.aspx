<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage_Employee.master" AutoEventWireup="true" CodeFile="Change_Password_Emp.aspx.cs" Inherits="Employee_Change_Password_Emp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Change Password</h1>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        <div class="panel-default">
            <asp:Label ID="lblmsg" Visible="false" runat="server" Text="" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12"></asp:Label>
            <asp:ValidationSummary CssClass="alert alert-danger" ID="ValidationSummary1" runat="server" />
        </div>
        <div class="row">
            <div class="col-lg-6">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa  fa-user"></i> Change Password
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label>Current Password</label>
                            <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqpwd" runat="server" ErrorMessage="Enter Password" Display="None" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <asp:TextBox ID="txtnewpwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqnewpwd" runat="server" ErrorMessage="Enter Password" Display="None" ControlToValidate="txtnewpwd"></asp:RequiredFieldValidator>
                           <%-- <asp:RegularExpressionValidator ID="rgnewpwd" runat="server" Display="None" ErrorMessage="Use Alphanumeric with special character, Minimum 6 and maximum 10 characters" ControlToValidate="txtnewpwd"></asp:RegularExpressionValidator>--%>
                        </div>
                        <div class="form-group">
                            <label>Retype Password</label>
                            <asp:TextBox ID="txtRpwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqRpwd" runat="server" ErrorMessage="Please retype Password" Display="None" ControlToValidate="txtRpwd"></asp:RequiredFieldValidator>
                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Use Alphanumeric with special character, Minimum 6 and maximum 10 characters" ControlToValidate="txtnewpwd"></asp:RegularExpressionValidator>--%>
                            <asp:CompareValidator ID="cpPwd" runat="server" ErrorMessage="Password does not match" ControlToCompare="txtnewPwd" ControlToValidate="txtRpwd" Display="None"></asp:CompareValidator>
                        </div>
                        <div class="col-lg-6 col-md-6 col-xs-6">
                            <asp:Button ID="btnsave" runat="Server" class="btn btn-default" Text="Save" Width="100%" Style="background-color: #0094ff; color: white" OnClick="btnsave_Click" />
                        </div>
                        <div class="col-lg-6 col-md-6 col-xs-6">
                            <asp:Button ID="btncancel" runat="server" class="btn btn-default" Text="Cancel" Width="100%" Style="background-color: #0094ff; color: white" />
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

