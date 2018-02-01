<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Admin_pages_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Manage Users</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <div class="panel-default">
            <asp:Label ID="lblmsg" Visible="false" runat="server" Text="" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </asp:Label>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Users List
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <asp:GridView runat="server" CssClass="table table-striped table-bordered table-hover text-center" ID="gvUsers" AutoGenerateColumns="false" OnRowCommand="gvUsers_RowCommand" OnPageIndexChanging="gvUsers_PageIndexChanging" PageSize="5" AllowPaging="True" OnRowUpdating="gvUsers_RowUpdating">
                                <Columns>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbluid" runat="server" Text='<%# Eval("user_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="User ID"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUname" runat="server" Text='<%# Eval("user_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDept" runat="server" Text='<%# Eval("department") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label5" runat="server" Text="User Type"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUtype" runat="server" Text='<%# Eval("user_type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label6" runat="server" Text="Mobile"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label7" runat="server" Text="E-mail"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label9" runat="server" Text="Status"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label10" runat="server" Text="Edit"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnEdit" runat="server" CommandName="update" CommandArgument='<%#Eval("user_id")%>'><span style="font-size:1.5em" class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label11" runat="server" Text="Delete"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnDelete" runat="server" CommandArgument='<%#Eval("user_id")%>' CommandName="delete" CausesValidation="False" OnClientClick="return confirm('Are you sure?')"><span style="font-size:1.5em" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                        <!-- /.table-responsive -->

                        <asp:Panel ID="Panel1" runat="server" Visible="false" >
                            <div class="well">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <div class="row">
                                <div class="col-lg-6">

                                    <div class="form-group">
                                        <label>User ID</label>
                                        <asp:TextBox ID="txtuname" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqUname" runat="server" ControlToValidate="txtuname" ErrorMessage="Enter User Name" Display="None"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Name</label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqName" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Name" Display="None"></asp:RequiredFieldValidator>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter email" Display="None"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rgEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email" Display="None" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-group">
                                        <label>Status </label>
                                        <asp:DropDownList ID="dlistStatus" runat="server" CssClass="form-control">
                                            <asp:ListItem>Enable</asp:ListItem>
                                            <asp:ListItem>Disable</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rqStatus" runat="server" Display="None" ErrorMessage="Please Select status" InitialValue="Select" ControlToValidate="dlistStatus"></asp:RequiredFieldValidator>
                                    </div>

                                </div>
                                <div class="col-lg-6">

                                    <div class="form-group">
                                        <label>Department </label>
                                        <asp:DropDownList ID="dlistDept" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rqdept" runat="server" Display="None" ErrorMessage="Please Select Department" InitialValue="Select" ControlToValidate="dlistdept"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <label>User Type </label>
                                        <asp:DropDownList ID="dlistUtype" runat="server" CssClass="form-control">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Admin</asp:ListItem>
                                            <asp:ListItem>Employee</asp:ListItem>
                                            <asp:ListItem>Engineer</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rqutype" runat="server" Display="None" ErrorMessage="Please Select User Type" InitialValue="Select" ControlToValidate="dlistUtype"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <label>Mobile</label>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rvMob" runat="server" ControlToValidate="txtMobile" ErrorMessage="Enter Mobile Number" Display="None"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rgMobile" runat="server" ValidationExpression="[7-9]\d{9}" ErrorMessage="Invalid Mobile Number" Display="None" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                    </div>

                                </div>

                                <div class="col-lg-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
                                    <div class="col-lg-6 col-sm-6 col-xs-6">
                                        <asp:Button ID="btnUpdate" runat="Server" class="btn btn-default" Text="Update" Width="100%" Style="background-color: #0094ff; color: white;" OnClick="btnUpdate_Click" />
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-xs-6">
                                        <asp:Button ID="btnCancle" runat="server" class="btn btn-default" Text="Cancel" Width="100%" Style="background-color: #0094ff; color: white" />
                                    </div>
                                </div>
                            </div>

                            </div>
                        </asp:Panel>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- jQuery -->
    <script src="Admin/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Admin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="Admin/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="Admin/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="Admin/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="Admin/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
        $(document).ready(function () {
            $('#gvUser').dataTable({
                responsive: true
            });
        });
    </script>
</asp:Content>

