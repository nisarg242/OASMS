<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="ManageEquipment.aspx.cs" Inherits="Admin_pages_ManageEquipment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        $(document).ready(function () {
            $('.panel-default').hide();

            $('#btnUpdate').click(function(){
                $('.panel-default').show();
                //e.preventDefault();
            });
        });
    </script>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Manage Equipment</h1>
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
                        Equipment List
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <asp:GridView runat="server" CssClass="table table-striped table-bordered table-hover text-center" ID="gvEquipment" AutoGenerateColumns="false" OnRowCommand="gvEquipment_RowCommand" OnRowDeleting="gvEquipment_RowDeleting" OnPageIndexChanging="gvEquipment_PageIndexChanging" AllowPaging="True" PageSize="5" OnRowUpdating="gvEquipment_RowUpdating">
                                <Columns>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbluid" runat="server" Text='<%# Eval("equip_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="Equipment Name"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("equip_type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label3" runat="server" Text="Company Name"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblpassword" runat="server" Text='<%# Eval("company_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label4" runat="server" Text="Model No."></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbldept" runat="server" Text='<%# Eval("model_no") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label5" runat="server" Text="Mfg Date"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblutype" runat="server" Text='<%# Eval("mfg_date").ToString().Substring(0,10) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label6" runat="server" Text="Arrival Date"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("arrival_date").ToString().Substring(0,10) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label7" runat="server" Text="Detail"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("detail") %>'></asp:Label>
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
                                            <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnEdit" runat="server" CommandName="update" CommandArgument='<%#Eval("equip_id")%>'><span style="font-size:1.5em" class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label11" runat="server" Text="Delete"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnDelete" runat="server" CommandArgument='<%#Eval("equip_id")%>' CommandName="delete" CausesValidation="False" OnClientClick="return confirm('Are you sure?')"><span style="font-size:1.5em" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                            </asp:GridView>
                        </div>
                        <!-- /.table-responsive -->

                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <div class="well">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <div class="row">
                                <div class="col-lg-6">

                                    <div class="form-group">
                                        <label>Equipment Name</label>
                                        <asp:DropDownList ID="ddlEquipmentType" class="form-control" runat="server">
                                            <asp:ListItem>--select--</asp:ListItem>
                                            <asp:ListItem>Cable</asp:ListItem>
                                            <asp:ListItem>CD/DVD</asp:ListItem>
                                            <asp:ListItem>Charger</asp:ListItem>
                                            <asp:ListItem>Color-Printer</asp:ListItem>
                                            <asp:ListItem>External Hard Drive</asp:ListItem>
                                            <asp:ListItem>Head Phone</asp:ListItem>
                                            <asp:ListItem>Keyboard</asp:ListItem>
                                            <asp:ListItem>Laptop</asp:ListItem>
                                            <asp:ListItem>Mouse</asp:ListItem>
                                            <asp:ListItem>Printer</asp:ListItem>
                                            <asp:ListItem>Router</asp:ListItem>
                                            <asp:ListItem>Speaker</asp:ListItem>
                                            <asp:ListItem>USB</asp:ListItem>
                                            <asp:ListItem>Web-Camera</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rqEquiptype" runat="server" ControlToValidate="ddlEquipmentType" ErrorMessage="Enter User Name" Display="None"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="form-group">
                                        <label>Company Name</label>
                                        <asp:DropDownList ID="ddlCompanyName" class="form-control" runat="server">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                            <asp:ListItem>Accer</asp:ListItem>
                                            <asp:ListItem>HCL</asp:ListItem>
                                            <asp:ListItem>HP</asp:ListItem>
                                            <asp:ListItem>Dell</asp:ListItem>
                                            <asp:ListItem>Lenovo</asp:ListItem>
                                            <asp:ListItem>Samsung</asp:ListItem>
                                            <asp:ListItem>Philips</asp:ListItem>
                                            <asp:ListItem>Transcend</asp:ListItem>
                                            <asp:ListItem>SanDisc</asp:ListItem>
                                            <asp:ListItem>Sony</asp:ListItem>
                                            <asp:ListItem>Logitech</asp:ListItem>
                                            <asp:ListItem>JBL</asp:ListItem>
                                            <asp:ListItem>TP-Link</asp:ListItem>
                                            <asp:ListItem>D-Link</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rqCompName" runat="server" ErrorMessage="Enter Password" Display="None" ControlToValidate="ddlCompanyName"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Model No.</label>
                                        <asp:TextBox ID="txtModel" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqRpwd" runat="server" ErrorMessage="Please retype Password" Display="None" ControlToValidate="txtModel"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="form-group">
                                        <label>Mfg Date </label>
                                        <asp:TextBox ID="txtMfg" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqMfg" runat="server" Display="None" ErrorMessage="Enter Mfg Date" ControlToValidate="txtMfg"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-6">

                                    <div class="form-group">
                                        <label>Arrival Date </label>
                                        <asp:TextBox ID="txtArrival" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rvarrival" runat="server" Display="None" ErrorMessage="Enter Arrival Date" ControlToValidate="txtArrival"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="form-group">
                                        <label>Detail</label>
                                        <asp:TextBox ID="txtDetail" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rvdetail" runat="server" Display="None" ErrorMessage="Write Detail" ControlToValidate="txtDetail"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="form-group">
                                        <label>Status</label>
                                        <asp:DropDownList ID="ddlStatus" class="form-control" runat="server">
                                            <asp:ListItem>Unalloted</asp:ListItem>
                                            <asp:ListItem>Alloted</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rqStatus" runat="server" ControlToValidate="ddlStatus" ErrorMessage="Enter status" Display="None"></asp:RequiredFieldValidator>

                                    </div>

                                </div>

                                <div class="col-lg-12 col-sm-12 col-xs-12" style="margin-top:10px;">
                                    <div class="col-lg-6 col-sm-6 col-xs-6">
                                        <asp:Button ID="btnUpdate" runat="Server" class="btn btn-default" data-toggle="modal" data-target="#myModal" Text="Update" Width="100%" Style="background-color: #0094ff; color: white;" OnClick="btnUpdate_Click" />
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-xs-6">
                                        <asp:Button ID="btncancel" runat="server" class="btn btn-default" Text="Cancel" Width="100%" Style="background-color: #0094ff; color: white" />
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

</asp:Content>

