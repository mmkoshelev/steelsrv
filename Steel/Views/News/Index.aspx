<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Steel.Models.DAL.New>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>Новости</h1>        
    </center>
    <br />
    
    <% foreach (var item in Model) { %>
        <div class="news">
        <b><span style="color:black;"><%= Html.Encode(item.Date.ToLongDateString()) %></span>
        <%= Html.Encode(item.Title) %></b>
        <% if ((bool)ViewData["Auth"]) {%> <%= Html.Encode(item.IpHost) %> <% } %>
        </div> 
        <div class="newscontent">
            <p><%= Html.Encode(item.Message) %></p>        
            <% if ((bool)ViewData["Auth"]) {%>
                <%= Html.ActionLink("Редактировать", "Edit", new { id=item.Id }) %> |
                <%= Html.ActionLink("Удалить", "Delete", new { id = item.Id }, new { onclick = "return confirm('Вы уверены?');" })%>
                <br />
            <% } %>
        </div>
        <br />
    <% } %>
    <% for (int i = 1; i <= (int)ViewData["PagesCount"]; i++) {%>
        <% if ((int)ViewData["CurrentPage"] == i) { %>
            <b><%= Html.Encode(i) %></b>
        <% } else { %>
            <%= Html.ActionLink(i.ToString(), "Index", new {id = i}) %>
        <% } %>
        &nbsp;
    <% } %>
    <br />
    <br />
    <% if ((bool)ViewData["Auth"]) {%>
        <%= Html.ActionLink("Добавить новость", "Create") %>       
    <% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>

