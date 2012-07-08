<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Steel.Models.DAL.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Редактирование товара прайс-листа</h1>
    
    </center>
    <%= Html.ValidationSummary("Новый товар не добавлен! Проверьте правильность заполненных полей!")%>

    <% using (Html.BeginForm()) {%>                         
        <label for="GroupId">Группа:</label><br />
        <%= Html.DropDownList("GroupId") %>
        <br /><br />
        <label for="Number">Номер:</label><br />
        <%= Html.TextBox("Number") %>
        <%= Html.ValidationMessage("Number", "*") %>
        <br /><br />                
        <label for="Name">Название:</label><br />
        <%= Html.TextBox("Name") %>
        <%= Html.ValidationMessage("Name", "*") %>
        <br /><br />
        <label for="Price">Цена за ед. изм.:</label><br />
        <%= Html.TextBox("Price") %>
        <%= Html.ValidationMessage("Price", "*") %>
        <br /><br />
        <label for="PriceByMiter">Цена за метр:</label><br />
        <%= Html.TextBox("PriceByMiter") %>
        <%= Html.ValidationMessage("PriceByMiter", "*") %>
        <br />
        <br />
        <div>
            <input type="submit" value="Сохранить" />
        </div>
    <% } %>
    <br />
    <div>
        <%=Html.ActionLink("К прайс листу", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>

