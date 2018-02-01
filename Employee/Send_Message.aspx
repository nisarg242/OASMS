<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage_Employee.master" AutoEventWireup="true" CodeFile="Send_Message.aspx.cs" Inherits="Employee_Send_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.panel-default').hide();

            $('#btnsave').click(function(){
                $('.panel-default').show();
            });
        });
    </script>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;">Send Message</h1>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        

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
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>User ID</label>
                                            <asp:TextBox ID="txtUID" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Subject</label>
                                    <asp:TextBox ID="txtsub" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqSub" runat="server" ControlToValidate="txtsub" ErrorMessage="Enter Subject" Display="None"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Message</label>
                                    <asp:TextBox ID="txtMsg" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqMsg" runat="server" ControlToValidate="txtMsg" ErrorMessage="Enter Message" Display="None"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <asp:LinkButton ID="lnkSend" runat="server" Width="100%" CssClass="btn btn-default" ForeColor="White" BackColor="#0094ff" OnClick="lnkSend_Click">Send <span class="fa fa-send"></span></asp:LinkButton>         
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
                        <i class="fa fa-user"></i> Registered Users
                    </div>
                    <div class="panel-body">
                        <div class="dataTable_wrapper">

                            <asp:GridView runat="server" CssClass="table table-striped table-bordered table-hover text-center" ID="gvUsers" AutoGenerateColumns="false" OnRowCommand="gvUsers_RowCommand">
                                <Columns>

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
                                            <asp:Label ID="Label3" runat="server" Text="User Type"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUtype" runat="server" Text='<%# Eval("user_type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label4" runat="server" Text="Select"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton type="button" Class="btn btn-outline btn-primary" ID="lnkbtnSelect" runat="server" CommandArgument='<%#Eval("user_id")%>' CommandName="Select" CausesValidation="False">Send <span class="fa fa-envelope"></span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div><!-- /.row (nested) -->
                    </div><!-- /.panel-body -->
                </div><!-- /.panel -->

            </div><!-- /.col-lg-12 -->
        </div>
    </div>

</asp:Content>

