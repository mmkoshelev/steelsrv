<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Steel.Models.DAL.ProductGroup>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>Группы товаров прайс-листа</h1>
    </center>
    <br />
    <div>
        <center>
            <table border="0" cellpadding="3" cellspacing="0" class="rezka">
                <tr>
                    <th>&nbsp;</th>
                    <th>
                        Id
                    </th>
                    <th>
                        Порядок
                    </th>
                    <th>
                        Название
                    </th>
                </tr>
                <% foreach (var item in Model) { %>
                <tr>
                    <td>
                        <%= Html.ActionLink("Редактировать", "Edit", new { id=item.Id }) %>
                        |
                        <%= Html.ActionLink("Удалить", "Delete", new { id=item.Id }, new {onclick = "return confirm('Вы уверены?');"})%>
                    </td>
                    <td>
                        <%= Html.Encode(item.Id) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Number) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Name) %>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="4">
                        <br />
                        <%= Html.ActionLink("Добавить новую", "Create") %>
                    </td>
                </tr>                
            </table>            
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>
