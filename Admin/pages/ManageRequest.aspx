<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="ManageRequest.aspx.cs" Inherits="Admin_pages_ManageRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Manage Request</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Request List
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <%--<asp:GridView runat="server" CssClass="table table-striped table-bordered table-hover text-center" ID="gvAllotment" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="gvAllotment_PageIndexChanging" PageSize="5">
                                <Columns>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="Allotment ID"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbluid" runat="server" Text='<%# Eval("allote_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="User ID"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("user_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label3" runat="server" Text="Equipment"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblpassword" runat="server" Text='<%# Eval("equip_type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label4" runat="server" Text="Equipment ID"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbldept" runat="server" Text='<%# Eval("equip_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label5" runat="server" Text="Date"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblutype" runat="server" Text='<%# Eval("date").ToString().Substring(0,10) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label6" runat="server" Text="Remark"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("remark") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label7" runat="server" Text="Description"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    

                                </Columns>
                            </asp:GridView>--%>
                        </div>
                        <!-- /.table-responsive -->
                        <div class="well">
                            <%-- <h4>DataTables Usage Information</h4>
                                <p><a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>--%>
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

