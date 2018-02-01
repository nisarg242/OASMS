<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap Core CSS -->
    <link href="../Admin/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- MetisMenu CSS -->
    <link href="../Admin/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="../Admin/dist/css/sb-admin-2.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="../Admin/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel-default">
                    <asp:Label ID="lblmsg" Visible="false" runat="server" Text="" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12"></asp:Label>
                    <asp:ValidationSummary CssClass="alert alert-danger" ID="ValidationSummary1" runat="server" />
                </div>
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <fieldset>
                            <div class="form-group">
                                <asp:TextBox ID="txtUname" runat="server" placeholder="User name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqUname" runat="server" Display="None" ErrorMessage="Enter User Name" ControlToValidate="txtUname"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqPassword" runat="server" Display="None" ErrorMessage="Enter Password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                            </div>
                                
                            <!-- Change this to a button or input when using this as a form -->
                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-lg btn-success btn-block" OnClick="LinkButton1_Click">Login</asp:LinkButton>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</body>
</html>
