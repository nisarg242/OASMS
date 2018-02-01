<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="ChangeUserStatus.aspx.cs" Inherits="Admin_pages_ChangeUserStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Change Users Status</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>

        <div class="row">
            <div class="well" style="padding-bottom:30px;">
                <div class="form-group">
                <div class="col-lg-12">
                <label class="col-lg-2 col-md-3 col-sm-3">Department :</label>
                <span class="col-lg-3 col-md-3 col-sm-3">
                    <asp:DropDownList CssClass="form-control" ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                </span>
            </div>
            </div>
            </div>
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
                            <asp:GridView runat="server" CssClass="table table-striped table-bordered table-hover text-center" ID="gvUsers" AutoGenerateColumns="false" OnRowCommand="gvUsers_RowCommand" OnRowUpdating="gvUsers_RowUpdating">
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
                                            <asp:Label ID="Label9" runat="server" Text="Status"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnDisable" runat="server" CommandArgument='<%# Eval("user_id")%>' CommandName="update" CausesValidation="False" Text='<%# Eval("status").ToString()=="Enable" ? "Disable":"Enable"%>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                        <!-- /.table-responsive -->
                        <%-- <div class="well">
                              <h4>DataTables Usage Information</h4>
                                <p><a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                            </div>--%>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

