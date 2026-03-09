<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebTraiCay.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container mt-5">

<h3>Đăng nhập</h3>

<asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
<br />

<asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
<br />

<asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success" OnClick="btnLogin_Click"/>

<br /><br />

<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

</div>
</asp:Content>
