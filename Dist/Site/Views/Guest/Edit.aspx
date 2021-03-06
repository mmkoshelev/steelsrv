﻿<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Steel.Models.DAL.GuestMessage>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>Редактирование сообщения</h1>
    </center>

    <%= Html.ValidationSummary("Не удалось отредактировать сообщение! Проверьте правильность введенных данных!") %>
    <% using (Html.BeginForm()) {%>
        <label for="Date">Date:</label><br />
        <%= Html.TextBox("Date", String.Format("{0:g}", Model.Date)) %>
        <%= Html.ValidationMessage("Date", "*") %><br /><br />
        <label for="IpHost">Ip адрес:</label><br />
        <%= Html.TextBox("IpHost", Model.IpHost) %>
        <%= Html.ValidationMessage("IpHost", "*") %><br /><br />
        <label for="Name">Имя:</label><br />
        <%= Html.TextBox("Name", Model.Name) %>
        <%= Html.ValidationMessage("Name", "*") %><br /><br />
        <label for="Message">Сообщение:</label><br />
        <%= Html.TextArea("Message", Model.Message, 7, 40, null) %>
        <%= Html.ValidationMessage("Message", "*") %><br /><br />
        <input type="submit" value="Изменить" />
    <% } %>
    <br />
    <div>
        <%=Html.ActionLink("К гостевой книге", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>

