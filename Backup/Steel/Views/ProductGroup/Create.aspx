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
        <%= Html.ValidationSummary("Новая группа не была создана! Проверьте правильность заполненных полей!") %>
        <% using (Html.BeginForm()) { %>
            <label for="Number">
                    Порядковый номер:</label><br />
            <%= Html.TextBox("Number") %>
            <%= Html.ValidationMessage("Number", "*") %>
            <br />
            <br />
            <label for="Name">
                    Наименование:</label><br />
            <%= Html.TextBox("Name") %>
            <%= Html.ValidationMessage("Name", "*") %>
            <br />
            <br />
            <input type="submit" value="Добавить" />
        <% } %>
        <br />
        <br />
        <div>
            <%=Html.ActionLink("Вернуться к списку", "Index") %>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>
