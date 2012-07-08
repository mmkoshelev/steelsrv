<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Steel.Models.DAL.ProductGroup>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Прайс-лист            
        </h1>
        <div style="text-align:right;">
            <%= Html.ActionLink("Версия для печати", "Print", "Price", null, new { target = "_blank" }) %>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </center>
    <br />
    <% foreach (var group in Model) { %>
        <div style="width:10px;">&nbsp;</div>    
        <div id='<%= "grp" + group.Id %>'>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%= Html.Encode(group.Name) %></b>
        </div>         
        <hr />
        <center>
            <table border="1" cellpadding="3" cellspacing="0" class="price">
                <tr>
                    <td style="width:60%;"><i>Номенклатура</i></td>
                    <td><i>Цена за ед. изм.</i></td>
                    <td><i>Цена за метр</i></td>
                    <% if ((bool)ViewData["Auth"]) {%>
                        <td style="width:60px;">&nbsp;</td>
                    <% } %>
                </tr>
                <% foreach (var product in group.Products.AsEnumerable().OrderBy(p => p.Number).ToList()) {%>
                    <tr>
                        <td><%= Html.Encode(product.Name) %></td>
                        <td><%= Html.Encode(product.Price.ToString("## ###")) %></td>
                        <td>
                            <% if (product.PriceByMiter.HasValue) {%>
                                <%=Html.Encode(product.PriceByMiter.Value)%>
                            <% } else {%>
                                -
                            <% }%>
                        </td>
                        <% if ((bool)ViewData["Auth"]) {%>
                            <td>
                                <%= Html.ActionLink("Ред.", "Edit", new { id=product.Id }) %> |
                                <%= Html.ActionLink("Уд.", "Delete", new { id = product.Id }, new { onclick = "return confirm('Вы уверены?');" })%>
                            </td>
                        <% } %>
                    </tr>
                <% } %>
            </table>  
        </center>       
    <% } %>
    <br />
    <% if ((bool)ViewData["Auth"]) {%>
        <div>
            <%= Html.ActionLink("Добавить новый товар", "Create")%>
            |
            <%= Html.ActionLink("Редактировать группы", "Index", "ProductGroup")%>
            |
            <%= Html.ActionLink("Быстрое редактирование", "QuickEdit")%>
        </div>
    <% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
    <li>
        <h2>Наименование</h2>
        <ul>
            <% foreach (var group in Model.OrderBy(i => i.Name)) { %>
                <li>
                    <a href='<%= "#grp" + group.Id %>'><%= Html.Encode(group.Name) %></a>
                </li>
           <% } %>
        </ul>
    </li>
</asp:Content>

