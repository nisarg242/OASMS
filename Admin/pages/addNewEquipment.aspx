<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/pages/admin.master" AutoEventWireup="true" CodeFile="addNewEquipment.aspx.cs" Inherits="Admin_pages_addNewEquipment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: #527fb0;"> Add New Equipment</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
        <div class="panel-default">
            <asp:Label ID="lblmsg" runat="server" Text="" Visible="false" CssClass="alert alert-danger col-lg-12 col-sm-12 col-md-12"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </div>

        <div class="row">
            <div class="col-lg-12">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa  fa-desktop fa-fw"></i> New Equipment
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">

                                <div class="form-group">
                                    <label>Equipment Type</label>
                                    <asp:DropDownList ID="ddlEquipmentType" class="form-control" runat="server">
                                        <%--<asp:ListItem>--select--</asp:ListItem>
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
                                        <asp:ListItem>Web-Camera</asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rqEquiptype" runat="server" ControlToValidate="ddlEquipmentType" ErrorMessage="Enter User Name" Display="None"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <label>Company Name</label>
                                    <asp:DropDownList ID="ddlCompanyName" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rqCompName" runat="server" ErrorMessage="Enter Company Name" Display="None" ControlToValidate="ddlCompanyName"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Model No.</label>
                                    <asp:TextBox ID="txtModel" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqModel" runat="server" ErrorMessage="Please Enter Model No." Display="None" ControlToValidate="txtModel"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <%--<div class="col-lg-12" style="margin-bottom:15px;">
                                        <div>
                                            <label style="margin-left:-15px;">Mfg. Date</label>
                                        </div>
                                        <div class="col-xs-4">
                                            <asp:DropDownList ID="ddlMonth" class="form-control" runat="server">
                                                <asp:ListItem Value="01">January</asp:ListItem>
                                                <asp:ListItem Value="02">February</asp:ListItem>
                                                <asp:ListItem Value="03">March</asp:ListItem>
                                                <asp:ListItem Value="04">April</asp:ListItem>
                                                <asp:ListItem Value="05">May</asp:ListItem>
                                                <asp:ListItem Value="06">Jun</asp:ListItem>
                                                <asp:ListItem Value="07">July</asp:ListItem>
                                                <asp:ListItem Value="08">August</asp:ListItem>
                                                <asp:ListItem Value="09">September</asp:ListItem>
                                                <asp:ListItem Value="10">Octomber</asp:ListItem>
                                                <asp:ListItem Value="11">November</asp:ListItem>
                                                <asp:ListItem Value="12">december</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-xs-4">
                                            <asp:DropDownList ID="ddlday" runat="server" Class="form-control">
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>31</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-xs-4">
                                            <asp:DropDownList ID="ddlyear" runat="server" Class="form-control">
                                                <asp:ListItem>2005</asp:ListItem>
                                                <asp:ListItem>2006</asp:ListItem>
                                                <asp:ListItem>2007</asp:ListItem>
                                                <asp:ListItem>2008</asp:ListItem>
                                                <asp:ListItem>2009</asp:ListItem>
                                                <asp:ListItem>2010</asp:ListItem>
                                                <asp:ListItem>2011</asp:ListItem>
                                                <asp:ListItem>2012</asp:ListItem>
                                                <asp:ListItem>2013</asp:ListItem>
                                                <asp:ListItem>1014</asp:ListItem>
                                                <asp:ListItem>2015</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>--%>
                                    <label>Mfg Date</label>
                                    <asp:TextBox ID="txtMfg" runat="server" CssClass="form-control"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtMfg_CalendarExtender" runat="server" BehaviorID="txtMfg_CalendarExtender" TargetControlID="txtMfg" />
                                    <asp:RequiredFieldValidator ID="rqMfg" runat="server" ErrorMessage="Please Enter Mfg date" Display="None" ControlToValidate="txtModel"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-lg-6">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <div class="form-group">
                                    <label>Arrival Date </label>
                                    <asp:TextBox ID="txtArrival" runat="server" CssClass="form-control"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtArrival_CalendarExtender" runat="server" BehaviorID="txtArrival_CalendarExtender" TargetControlID="txtArrival" />
                                    <asp:RequiredFieldValidator ID="rvarrival" runat="server" Display="None" ErrorMessage="Enter Arrival Date" ControlToValidate="txtArrival"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Detail</label>
                                    <asp:TextBox ID="txtDetail" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rvdetail" runat="server" Display="None" ErrorMessage="Write Detail" ControlToValidate="txtDetail"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <asp:Button ID="btnsave" runat="Server" class="btn btn-default" data-toggle="modal" data-target="#myModal" Text="Save" Width="100%" Style="background-color: #0094ff; color: white;" OnClick="btnsave_Click" />
                        </div>
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <asp:Button ID="btncancel" runat="server" class="btn btn-default" Text="Cancel" Width="100%" Style="background-color: #0094ff; color: white" />
                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>


    <script src="Admin/js/jquery-ui.js"></script>
    <script type="text/javascript">
    
        $(document).ready(function () {
            $('#<%=txtArrival.ClientID%>').datepicker();
        });
    </script>

</asp:Content>

