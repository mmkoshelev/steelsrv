<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Вход</h1>
    
    </center>
    <br />
    <div>
        <%= Html.ValidationSummary("Проверьте правильность введенных данных!") %>
        <% using (Html.BeginForm()) { %>
            <label for="name">
                    Логин:</label><br />
            <%= Html.TextBox("name") %>
            <%= Html.ValidationMessage("name", "*") %>
            <br />
            <br />
            <label for="Name">
                    Пароль:</label><br />
            <%= Html.Password("password")%>
            <%= Html.ValidationMessage("password", "*")%>
            <br />
            <br />
            <input type="submit" value="войти" />
        <% } %>
        <br />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>
