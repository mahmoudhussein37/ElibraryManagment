<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditProf.aspx.cs" Inherits="ElibraryManagment.EditProf" %>
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
                           <img width="100px" src="../imgs/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Your Profile</h4>
                           <span>Account Status - </span>
                           <asp:Label class="badge badge-pill badge-info" ID="lblstate" runat="server" Text="Your status"></asp:Label>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtName" runat="server" placeholder="Full Name"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Gmail</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtgmail" runat="server" placeholder="Gmail" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>National_ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtNatid" runat="server" placeholder="National_ID" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  
                    
                  <div class="row">
                     <div class="col">
                        <center>
                           <span class="badge badge-pill badge-info">Login Credentials</span>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>User ID</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtUserId" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TxtPassWord" runat="server" placeholder="Password" TextMode="Password" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label> Rewrite Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TxtrePassWord" runat="server" placeholder="Rewrite Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-8 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                           </div>
                        </center>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
         <div class="col-md-12">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="../imgs/books1.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Your Achievements</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UiccDBConnectionString %>" SelectCommand="SELECT [FullName], [Achievement], [Member_ID] FROM [Member_All_Info_tbl] WHERE ([Member_ID] = @Member_ID)">
                             <SelectParameters>
                                 <asp:SessionParameter DefaultValue="" Name="Member_ID" SessionField="ID" Type="Int32" />
                             </SelectParameters>
                         </asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GvEditProf" runat="server" AutoGenerateColumns="False" DataKeyNames="Member_ID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Member_ID" HeaderText="Member_ID" ReadOnly="True" SortExpression="Member_ID" />
                                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
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
