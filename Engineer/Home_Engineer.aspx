<%@ Page Title="" Language="C#" MasterPageFile="~/Engineer/MasterPage_Engineer.master" AutoEventWireup="true" CodeFile="Home_Engineer.aspx.cs" Inherits="Engineer_Home_Engineer" %>

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
                    <h1 class="page-header" style="color: #527fb0;">Engineer Home</h1>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        <div class="panel-default">
            <asp:Label ID="lblmsg" Visible="false" runat="server" Text="" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12"></asp:Label>
            <asp:ValidationSummary CssClass="alert alert-danger" ID="ValidationSummary1" runat="server" />
        </div>
      
        <div class="row">
            <div class="col-lg-12">

            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
</asp:Content>

