<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EventManagement.aspx.cs" Inherits="ElibraryManagment.AdminCoursesMange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .thumb {
            height: 75px;
            border: 1px solid #000;
            margin: 10px 5px 0 0;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        $(function () {
            $(":file").change(function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();

                    reader.onload = imageIsLoaded;
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });

        function imageIsLoaded(e) {
            $('#imgview').attr('src', e.target.result);
            $('#yourImage').attr('src', e.target.result);
        };

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
                                    <h4>Event Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" alt="yourImage" height="150px" width="100px" src="../Image_Course/maxresdefault.jpg" />
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
                                <asp:FileUpload onchange="imageIsLoaded(this);" class="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Event ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtevntId" runat="server" placeholder="رقم الحدث"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="btnIdGO" runat="server" OnClick="btnIdGO_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <label>Event Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEvntName" runat="server" placeholder="اسم الحدث"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">

                                <label>Admin Name</label>
                                <div class="form-group">
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:UiccDBConnectionString %>" SelectCommand="SELECT [Full_Name] FROM [Admin_Login_tbl]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="ddlAdminName" placeholder="اسم المشرف" runat="server" Width="507px" Height="38px" DataSourceID="SqlDataSource2" DataTextField="Full_Name" DataValueField="Full_Name">
                                    </asp:DropDownList>

                                </div>

                                <label>Place</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPlace" runat="server" placeholder="المكان" TextMode="SingleLine"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>The Lecturer</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtLec" runat="server" placeholder="اسم المحاضر" TextMode="SingleLine"></asp:TextBox>

                                </div>
                                <label>the maximum number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtMax" runat="server" placeholder="الحد الاقصي للمشتركين" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Department</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="lstDepartment" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="IT" Value="IT" />
                                        <asp:ListItem Text="Mechatronics" Value="Mechatronics" />
                                        <asp:ListItem Text="Autotronics" Value="Autotronics" />
                                        <asp:ListItem Text="Renewable energy" Value="Renewable energy" />
                                        <asp:ListItem Text="Artificial limbs" Value="Artificial limbs" />

                                    </asp:ListBox>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Reward</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtReword" runat="server" placeholder="مكافئه انتهاء الحدث"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Cost</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtCost" runat="server" placeholder="تكلفه الحدث" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Members</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtEvntMembers" runat="server" placeholder="المشتركون" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Start Event Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtstart" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Finish Event Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtfinsh" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>from to</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtFromto" runat="server" placeholder="From N PM to N PM" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label>Event Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEventDisc" runat="server" placeholder="وصف الحدث" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAdd" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdate" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
                                    <h4>Events List</h4>
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
                                <asp:GridView class="table table-striped table-bordered" ID="gvEventList" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="Course_id" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1">
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
                                                            <asp:Image class="img-fluid p-2" ID="Image1" runat="server" Width="400px" ImageUrl='<%# Eval("Course_Imge") %>' />


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
