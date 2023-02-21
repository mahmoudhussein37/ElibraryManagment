<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="ElibraryManagment.UserSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    <img width="100px" src="../imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Sign Up
                                    </h4>

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
                                    <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtDob" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Gender</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DDGender" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Male" Value="Male" />
                                        <asp:ListItem Text="Female" Value="Female" />
                                  

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="abc@gmail.com" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Governorate</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownGovernorate" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Alexandria" Value="Alexandria" />
                                        <asp:ListItem Text="Aswan " Value="Aswan " />
                                        <asp:ListItem Text="Asyut " Value="Asyut " />
                                        <asp:ListItem Text="Beheira " Value="Beheira " />
                                        <asp:ListItem Text="Beni Suef" Value="Beni Suef" />
                                        <asp:ListItem Text="Cairo " Value="Cairo " />


                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Department</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownDepartment" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="IT" Value="IT" />
                                        <asp:ListItem Text="Mechatronics" Value="Mechatronics" />
                                        <asp:ListItem Text="Autotronics" Value="Autotronics" />
                                        <asp:ListItem Text="SelRenewable Energyect" Value="SeleRenewable Energyct" />
                                        <asp:ListItem Text="Artificial limbs" Value="Artificial limbs" />

                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6">
                                <label>Phone</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" placeholder="Phone No" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>



                            <div class="col-md-6">
                                <label>Member ID </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtMember_ID" runat="server" placeholder="Member ID (Like 1022)" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtpassword" runat="server" placeholder="Password" TextMode="SingleLine" ></asp:TextBox>
                                </div>
                            </div>



                            <div class="col-md-6">
                                <label>Rewrite Password </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtrepassword" runat="server" placeholder="Rewrite Password" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-8 mx-auto">
                        <center>
                            <div class="form-group">
                                <asp:Button class="btn btn-primary btn-block btn-lg" ID="BtnCreate" runat="server" Text="Create" OnClick="BtnCreate_Click" />
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="homepage.aspx"><< Back to Home</a><br>
    <br>
    <br>
    <br>

    <br>

    <br>
</asp:Content>
