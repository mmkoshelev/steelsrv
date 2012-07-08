<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Steel.Models.DAL.Employee>>" %>
<%@ Import Namespace="Steel.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Сотрудники</h1>
    </center>
    <div>
        <% foreach (var item in Model) { %>
        <div class="small2">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center">
                        <br />
                        <%= Html.Img(item.Picture, 160, 120) %>
                    </td>
                    <td>
                        <div>
                            <b><%= Html.Encode(item.FIO) %></b>
                            <br />
                            <%= Html.Encode(item.Post) %>
                            <br />
                            тел.: <%= Html.Encode(item.Phone) %>
                            <% if ((bool)ViewData["Auth"]) {%>
                                <br />
                                <%= Html.ActionLink("Редактировать", "Edit", new { id=item.Id }) %> |
                                <%= Html.ActionLink("Удалить", "Delete", new { id = item.Id }, new { onclick = "return confirm('Вы уверены?');" })%>                                
                            <% } %>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <% } %>
    </div>
    <% if ((bool)ViewData["Auth"]) {%>
        <div>
            <br />
            <%= Html.ActionLink("Добавить сотрудника", "Create") %>
        </div>
    <% } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>
