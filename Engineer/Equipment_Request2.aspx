<%@ Page Title="" Language="C#" MasterPageFile="~/Engineer/MasterPage_Engineer.master" AutoEventWireup="true" CodeFile="Equipment_Request2.aspx.cs" Inherits="Engineer_Equipment_Request2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <h1 class="page-header" style="color: #527fb0;">Request</h1>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        <div class="panel-default">
            <asp:Label ID="lblmsg" Visible="false" runat="server" Text="" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12"></asp:Label>
            <asp:ValidationSummary CssClass="alert alert-danger" ID="ValidationSummary1" runat="server" />
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-desktop"></i> Equipments
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label>Equipment</label>
                            <asp:DropDownList ID="ddlEquipment" runat="server" class="form-control" >
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rqEquipment" runat="server" ErrorMessage="Select Equipment" Display="None" ControlToValidate="ddlEquipment"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <asp:TextBox ID="txtDesc" runat="server" class="form-control" placeholder="Other description if need..." TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <asp:Button ID="btnSend" runat="Server" class="btn btn-default" Text="Send" Width="100%" Style="background-color: #2f6fa7; color: white;" OnClick="btnSend_Click" />
                        </div>
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <asp:Button ID="btncancel" runat="server" class="btn btn-default" Text="Cancel" Width="100%" Style="background-color: #2f6fa7; color: white" />
                        </div>
                    </div><!-- /.panel-body -->
                </div><!-- /.panel -->

            </div><!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

