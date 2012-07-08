<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Steel.Models.DAL.New>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <center>
        <h1>Новая новасть</h1>        
    </center>
    <br />
    <div>
        <%= Html.ValidationSummary("Новость не добавлена! Проверьте правильность заполненных полей!")%>
        <% using (Html.BeginForm()) {%>
            Заголовок:<br />
            <%= Html.TextBox("title") %>
            <%= Html.ValidationMessage("title", "*") %><br /><br />
            Текст сообщения:<br />
            <%= Html.TextArea("message", "", 7, 40, null) %>
            <%= Html.ValidationMessage("message", "*")%><br /><br />
            <input type="submit" value="Добавить" />           
        <% } %>
    </div>
    <br />
    <div>
        <%=Html.ActionLink("К списку новостей", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>

