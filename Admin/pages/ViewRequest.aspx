<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="ViewRequest.aspx.cs" Inherits="Admin_pages_ViewRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">View Request</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <div class="panel-default">
            <asp:Label ID="lblmsg" Visible="false" runat="server" Text="" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12"></asp:Label>
            <asp:ValidationSummary CssClass="alert alert-danger" ID="ValidationSummary1" runat="server" />
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Panel ID="Panel1" runat="server" Visible="false" >
                    <div class="well">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <div class="row">
                            <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Name</label>
                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>User ID</label>
                                                <asp:TextBox ID="txtUID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Equipment</label>
                                        <asp:TextBox ID="txtsub" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Response Message</label>
                                        <asp:TextBox ID="txtMsg" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqMsg" runat="server" ControlToValidate="txtMsg" ErrorMessage="Enter Message" Display="None"></asp:RequiredFieldValidator>
                                    </div>
                            </div>

                            <div class="col-lg-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:LinkButton ID="lnkSend" runat="server" Width="100%" CssClass="btn btn-default" ForeColor="White" BackColor="#0094ff" OnClick="lnkSend_Click" >Send <span class="fa fa-send"></span></asp:LinkButton>         
                                </div>
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:LinkButton ID="lnkCancle" runat="server" Width="100%" CssClass="btn btn-default" ForeColor="White" BackColor="#0094ff">Cancle <span class="fa fa-times"></span></asp:LinkButton>
                                </div>
                            </div>
                        </div>

                    </div>
                </asp:Panel>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        Request List
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <asp:GridView runat="server" CssClass="table table-striped table-bordered table-hover text-center" ID="gvViewRequest" AutoGenerateColumns="false" OnRowCommand="gvViewRequest_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbluid" runat="server" Text='<%# Eval("ERequest_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("s_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="User Name"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbluname" runat="server" Text='<%# Eval("s_uname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label6" runat="server" Text="Equipment"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("equipment") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label3" runat="server" Text="Date"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblutype" runat="server" Text='<%# Eval("date").ToString().Substring(0,10) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label4" runat="server" Text="Time"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbldept" runat="server" Text='<%# Eval("time").ToString().Substring(0,8) %>'></asp:Label>
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

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label08" runat="server" Text="Response"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton type="button" Class="btn btn-outline btn-primary" ID="lnkbtnSelect" runat="server" CommandArgument='<%#Eval("ERequest_id")%>' CommandName="Select" CausesValidation="False">Response</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>

</asp:Content>

