<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<Steel.Models.DAL.ProductGroup>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <script type="text/javascript" src="../../Scripts/MicrosoftAjax.js"></script>
    <script type="text/javascript" src="../../Scripts/MicrosoftMvcAjax.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Прайс-лист</h1>
    </center>
    <br />
    <% foreach (var group in Model)
       { %>
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%= Html.Encode(group.Name) %></b>
    </div>
    <hr />
    <center>
        <table border="1" cellpadding="3" cellspacing="0" class="price">
            <tr>
                <td style="width: 60%;">
                    <i>Номенклатура</i>
                </td>
                <td style="width: 40%;">
                    <i>Цена за ед. изм.</i>
                    |
                    <i>Цена за метр</i>
                </td>
                <td style="width: 60px;">
                    &nbsp;
                </td>
            </tr>
            <% foreach (var product in group.Products.AsEnumerable().OrderBy(p => p.Number).ToList())
               {%>
            <tr>
                <td>
                    <%= Html.Encode(product.Name) %>
                </td>
                <td>
                    <% using(Ajax.BeginForm("QuickEdit", new {id = product.Id}, new AjaxOptions{ UpdateTargetId="pr"+product.Id })) { %>
                        <%= Html.TextBox("price", product.Price, new { style="width:60px;" })%>
                        |
                        <% if (product.PriceByMiter.HasValue) {%>
                                <%=Html.TextBox("priceByMiter", product.PriceByMiter.Value, new { style = "width:60px;" })%>
                        <% } else {%>
                                <%=Html.TextBox("priceByMiter", "-", new { style = "width:60px;" })%>
                        <% }%> 
                        <input type="submit" value="Ok" />                 
                    <% }%>
                </td>
                <td>
                    <div id='<%= "pr"+product.Id %>'>
                        No
                    </div>
                </td>
            </tr>
            <% } %>
        </table>
    </center>
    <% } %>
    <br />
    <div>
        <%= Html.ActionLink("К прайс-листу", "Index")%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>
