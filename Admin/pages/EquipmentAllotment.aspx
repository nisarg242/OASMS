<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="EquipmentAllotment.aspx.cs" Inherits="Admin_pages_EquipmentAllotment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $('div[title="eliment"]').hide();
        });

    </script>--%>


    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Equipment Allotment</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
        <div class="panel-default">
            <asp:Label ID="lblmsg" runat="server" Text="" Visible="false" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </asp:Label>

        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-sitemap fa-fw"></i> Equipment Allotment
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Department</label>
                                    <asp:DropDownList ID="ddlDepartment" class="form-control" runat="server" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rqDepartment" runat="server" ControlToValidate="ddlDepartment" ErrorMessage="Select Department" Display="None"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <label>User Name</label>
                                    <asp:DropDownList ID="ddlUserName" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rqUserName" runat="server" ErrorMessage="Select User Name" Display="None" ControlToValidate="ddlUserName"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Equipment</label>
                                    <asp:DropDownList ID="ddlEquipment" class="form-control" runat="server" OnSelectedIndexChanged="ddlEquipment_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rqEquipment" runat="server" ErrorMessage="Select Equipment" Display="None" ControlToValidate="ddlEquipment"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Model No.</label>
                                    <asp:TextBox ID="txtEquipId" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                </div>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <div class="form-group">
                                    <label>Date</label>
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" runat="server" BehaviorID="txtDate_CalendarExtender" TargetControlID="txtDate" />
                                    <asp:RequiredFieldValidator ID="rqDate" runat="server" ErrorMessage="Please Enter Date" Display="None" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqDescription" runat="server" ErrorMessage="Please Enter Description" Display="None" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-8">

                                <div title="eliment" class="panel panel-default">
                                    <div class="panel-heading">
                                        Equipment List<h6 class="pull-right"> *Select any one Equipment</h6>
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <div class="dataTable_wrapper">
                                            <asp:GridView ID="gvAllotment" runat="server" AutoGenerateColumns="false"
                                                Class="table table-striped table-bordered table-hover text-center" OnRowCommand="gvAllotment_RowCommand">

                                                <Columns>

                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label11" runat="server" Text="Select"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton type="button" Class="btn btn-link" ID="lnkbtnSelect" runat="server" CommandArgument='<%#Eval("equip_id")%>' CommandName="select" CausesValidation="False"><span style="font-size:1.5em" class="glyphicon glyphicon-check"></span></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

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
                                                            <asp:Label ID="Label7" runat="server" Text="Detail"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("detail") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                        <!-- /.table-responsive -->

                                    </div>
                                    <!-- /.panel-body -->
                                </div>

                            </div>

                        </div><!-- /.row (nested) -->
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <asp:Button ID="btnAllote" runat="Server" class="btn btn-default" Text="Allote" Width="100%" Style="background-color: #0094ff; color: white;" OnClick="btnAllote_Click" />
                        </div>
                        <div class="col-lg-6 col-sm-6 col-xs-6">
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

