<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InsertToHomePage.aspx.cs" Inherits="ElibraryManagment.AdminMangement" %>

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
                           <h4>Book Issuing</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                            <img src="../imgs/book-online.png"  width="100px"/>
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
                        <label>Course Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtCourseName" runat="server" placeholder="Course Name"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Event ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtEventId" runat="server" placeholder="Event ID"></asp:TextBox>
                              <asp:Button class="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Admin Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtAdminName" runat="server" placeholder="Admin Name" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Place</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPlace" runat="server" placeholder="Place"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Start Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtStart" runat="server" placeholder="Start Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>End Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtFinish" runat="server" placeholder="End Date" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                        <asp:Button ID="btnRelese" class="btn btn-lg btn-block btn-success" runat="server" Text="Relese" OnClick="btnRelese_Click" />
                     </div>
                     <div class="col-6">
                        <asp:Button ID="btnStop" class="btn btn-lg btn-block btn-danger" runat="server" Text="Stop" OnClick="btnStop_Click" />
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
                           <h4>Issued Event List</h4>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UiccDBConnectionString %>" SelectCommand="SELECT * FROM [Course_Events_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="gvInsertEvent" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="Course_id" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" OnRowDataBound="gvInsertEvent_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="Course_id" HeaderText="id" ReadOnly="True" SortExpression="Course_id" />

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Course_Name") %>' Font-Bold="True" Font-Size="X-Large" Font-Names="Cairo"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Admin Name:&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" Text='<%# Eval("Course_Admin") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" Font-Size="Medium" ForeColor="Red"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lecturer Name:&nbsp;&nbsp; <asp:Label ID="Label5" runat="server" Text='<%# Eval("Course_Lecturer") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Red"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Department:&nbsp; <asp:Label ID="Label6" runat="server" Text='<%# Eval("Course_Department") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" Font-Size="Medium" ForeColor="Red"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    &nbsp;Reword:&nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Text='<%# Eval("Course_Reword") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of Subscribers:&nbsp; <asp:Label ID="Label7" runat="server" Text='<%# Eval("Course_Max") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Price:&nbsp;&nbsp; <asp:Label ID="Label8" runat="server" Text='<%# Eval("Course_Price") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red"></asp:Label>
                                                                    &nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Place :
                                                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red" Text='<%# Eval("Course_Place") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date Start:&nbsp; <asp:Label ID="Label9" runat="server" Text='<%# Eval("Course_DateStart") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date Finish:&nbsp;&nbsp;&nbsp; <asp:Label ID="Label10" runat="server" Text='<%# Eval("Course_DateFinish") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hours:&nbsp;&nbsp; <asp:Label ID="Label11" runat="server" Text='<%# Eval("Course_DateFromTo") %>' Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Description :&nbsp;&nbsp;
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red" Text='<%# Eval("Course_Description") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Members:&nbsp;&nbsp;&nbsp;
                                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Cairo" ForeColor="Red" Text='<%# Eval("Course_Member") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>



                                                        <div class="col-2">
                                                            <asp:Image   class="img-fluid p-2" Width="400px" ID="Image1" runat="server" ImageUrl='<%# Eval("Course_Imge") %>' />


                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

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
