<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Steel.Models.DAL.ProductGroup>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
        <h1>
            Новая группа товаров прайс-листа</h1>
    
    </center>
    <br />
    <div>
        <%= Html.ValidationSummary("Данные не изменены! Проверьте правильность заполненных полей!")%>
        <% using (Html.BeginForm()) {%>
            <label for="Number">Number:</label><br />
            <%= Html.TextBox("Number", Model.Number) %>
            <%= Html.ValidationMessage("Number", "*") %><br /><br />
            <label for="Name">Name:</label><br />
            <%= Html.TextBox("Name", Model.Name) %>
            <%= Html.ValidationMessage("Name", "*") %><br /><br />
            <input type="submit" value="Сохранить" />
        <% } %>
        <br />
        <div>
            <%=Html.ActionLink("К списку групп", "Index") %>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>

