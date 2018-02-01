<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="AddNewCompany_EquipmentType.aspx.cs" Inherits="Admin_pages_AddNewCompany_EquipmentType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('btnUpdateCompany').hide();
        });
    </script>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Add New Companies & Equipment-Types</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
        <div class="panel-default">
            <asp:Label ID="lblmsg" runat="server" Text="" Visible="false" CssClass="col-lg-12 col-sm-12 col-md-12"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-info alert-dismissable" runat="server" ValidationGroup="company" />
            <asp:ValidationSummary ID="ValidationSummary2" CssClass="alert alert-success" runat="server" ValidationGroup="equipment" />
        </div>

        <div class="row">
            <div class="col-lg-6 col-md-6">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa  fa-desktop fa-fw"></i> Add New Company
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">

                                <div class="form-group">
                                    <asp:TextBox ID="txtComp" runat="server" placeHolder="Company Name" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reCompany" runat="server" ErrorMessage="Please Enter Company Name" Display="None" ControlToValidate="txtComp" ValidationGroup="company"></asp:RequiredFieldValidator>
                                </div>

                            </div>

                            <div class="col-lg-6 col-sm-6 col-xs-6">
                                <asp:Button ID="btnCompanyAdd" runat="Server" class="btn btn-outline btn-primary" Text="Add" Width="100%" ValidationGroup="company" OnClick="btnCompanyAdd_Click" />
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <asp:Button ID="btnUpdateCompany" runat="server" class="btn btn-outline btn-primary" Text="Update" Width="100%" ValidationGroup="company" OnClick="btnUpdateCompany_Click" />
                                </div>
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:Button ID="btnCancleCompany" runat="server" class="btn btn-outline btn-primary" Text="Cancle" Width="100%" OnClick="btnCancleCompany_Click" />
                                </div>
                            </div>

                        </div>

                        <asp:GridView ID="gvCompany" runat="server" CssClass="table table-striped table-bordered table-hover text-center" AutoGenerateColumns="false" OnRowCommand="gvCompany_RowCommand" OnRowDeleting="gvCompany_RowDeleting" OnRowUpdating="gvCompany_RowUpdating">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbluid" runat="server" Text='<%# Eval("company_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblComp" runat="server" Text='<%# Eval("company") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="Label10" runat="server" Text="Edit"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnEdit" runat="server" CommandName="update" CommandArgument='<%#Eval("company_id")%>'><span style="font-size:1.5em" class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="Label11" runat="server" Text="Delete"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnDelete" runat="server" CommandArgument='<%#Eval("company_id")%>' CommandName="delete" CausesValidation="False" OnClientClick="return confirm('Are you sure?')"><span style="font-size:1.5em" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>



                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>

            <div class="col-lg-6 col-md-6">

                <div class="panel panel-green">
                    <div class="panel-heading">
                        <i class="fa  fa-desktop fa-fw"></i> Add New Equipment-Type
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">

                                <div class="form-group">

                                    <asp:TextBox ID="txtEquip" runat="server" placeHolder="Equipment type" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqEquip" runat="server" ErrorMessage="Please Enter Equipment Type" Display="None" ControlToValidate="txtEquip" ValidationGroup="equipment"></asp:RequiredFieldValidator>

                                </div>

                            </div>

                            <div class="col-lg-6 col-sm-6 col-xs-6">
                                <asp:Button ID="btnEquipmentAdd" runat="Server" class="btn btn-outline btn-success" Text="Add" Width="100%" ValidationGroup="equipment" OnClick="btnEquipmentAdd_Click" />
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                    <asp:Button ID="btnUpdateEquip" runat="server" class="btn btn-outline btn-success" Text="Update" Width="100%" ValidationGroup="equipment" OnClick="btnUpdateEquip_Click" />
                                </div>
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:Button ID="btnCancleEquip" runat="server" class="btn btn-outline btn-success" Text="Cancle" Width="100%" OnClick="btnCancleEquip_Click" />
                                </div>
                            </div>

                        </div>

                        <asp:GridView ID="gvEquipment" runat="server" CssClass="table table-striped table-bordered table-hover text-center" AutoGenerateColumns="false" OnRowCommand="gvEquipment_RowCommand" OnRowDeleting="gvEquipment_RowDeleting" OnRowUpdating="gvEquipment_RowUpdating">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEquipId" runat="server" Text='<%# Eval("equipment_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="Equipment-Type"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbluid" runat="server" Text='<%# Eval("equipment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="Label10" runat="server" Text="Edit"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnEdit" runat="server" CommandName="update" CommandArgument='<%#Eval("equipment_id")%>'><span style="font-size:1.5em" class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="Label11" runat="server" Text="Delete"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnDelete" runat="server" CommandArgument='<%#Eval("equipment_id")%>' CommandName="delete" CausesValidation="False" OnClientClick="return confirm('Are you sure?')"><span style="font-size:1.5em" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>


                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>

        </div>
    </div>

</asp:Content>

