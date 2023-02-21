<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="ElibraryManagment.AdminMemberManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtMemberId" runat="server" placeholder="Member ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="btnGo" runat="server" OnClick="btnGo_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextFullName" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="txtAcoountState" runat="server" placeholder="Account Status" OnTextChanged="txtAcoountState_TextChanged" Width="16px"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="btnAcountStateAdd" runat="server" OnClick="btnAcountStateAdd_Click"><i class="fas fa-check-circle" Width="1px"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="btnAcountStateUpdate" runat="server" OnClick="btnAcountStateUpdate_Click"><i class="far fa-pause-circle" Width="1px"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="btnAcountStateDelete" runat="server" OnClick="btnAcountStateDelete_Click"><i class="fas fa-times-circle" Width="1px"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtDob" runat="server" placeholder="DOB"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>National_ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtNational_ID" runat="server" placeholder="National_ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email ID"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Governorate</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtGovernorate" runat="server" placeholder="Governorate"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Department</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtDepartment" runat="server" placeholder="Department"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Phone</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" placeholder="Phone"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label>MemberAchievement</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtAchievement" runat="server" placeholder="(,)+Achievement" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAddM" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAddM_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdatem" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdatem_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDeleteM" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDeleteM_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UiccDBConnectionString %>" SelectCommand="SELECT * FROM [Member_All_Info_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="gvMemberList" runat="server" AutoGenerateColumns="False" DataKeyNames="Member_ID" DataSourceID="SqlDataSource1" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                                        <asp:BoundField DataField="acount_state" HeaderText="Acount State" SortExpression="acount_state" />
                                        <asp:BoundField DataField="DOB" HeaderText="Date Of Birth" SortExpression="DOB" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="National_ID" HeaderText="National ID" SortExpression="National_ID" />
                                        <asp:BoundField DataField="Goverorate" HeaderText="Goverorate" SortExpression="Goverorate" />
                                        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                        <asp:BoundField DataField="Member_ID" HeaderText="Member ID" ReadOnly="True" SortExpression="Member_ID" />
                                        <asp:BoundField DataField="Achievement" HeaderText="Achievement" SortExpression="Achievement" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


