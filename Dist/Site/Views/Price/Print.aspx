<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Steel.Models.DAL.ProductGroup>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ООО "Сталь Сервис" прайс-лист</title>
</head>
<body style="font-family: Lucida Sans Unicode, Verdana; font-size: 8pt;">
    <div style="width: 840px; margin-left: auto; margin-right: auto; margin-top: 10px;
        margin-bottom: 10px;">
        <div style="width: 840px; height: 197px; background-image: url(../../Content/images/headp.jpg);
            background-repeat: no-repeat; margin: 0px;">
        </div>
        <div>
            <table border="0" style="background-color: #dd9cb3; border-left: solid 1px black;
                border-right: solid 1px black; width: 840px; margin: 0px; font-family: Cambria;
                font-style: italic; font-size: 14pt;">
                <tr>
                    <td>
                        Склад и офис в одном месте
                    </td>
                    <td style="width: 10%;">
                        <% 
                            DateTime priceDate = DateTime.Now.AddDays(-1); 
                            if (priceDate.DayOfWeek == DayOfWeek.Sunday || priceDate.DayOfWeek == DayOfWeek.Saturday)
                            {
                                priceDate = priceDate.AddDays(-2);
                            }
                        %>
                        <%= priceDate.ToShortDateString() %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Время работы: 8.30 - 17.30&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Выписка документов:
                        8.30 - 17.30&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Отгрузка товара: 7.00 - 21.00
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0px" cellspacing="0px" style="background-color: #dd9cb3;
                width: 840px; margin: 0px; padding: 0px; font-family: Arial; font-weight: bold;
                font-size: 8pt;">
                <tr style="text-align: center;">
                    <td style="border: solid 1px black; padding: 5px; width: 300px;">
                        Номенклатура
                    </td>
                    <td style="border: solid 1px black; padding: 5px; width: 60px;">
                        Цена за ед. изм.
                    </td>
                    <td style="border: solid 1px black; padding: 5px; width: 60px;">
                        Цена за метр
                    </td>
                    <td style="border: solid 1px black; padding: 5px; width: 300px;">
                        Номенклатура
                    </td>
                    <td style="border: solid 1px black; padding: 5px; width: 60px;">
                        Цена за ед. изм.
                    </td>
                    <td style="border: solid 1px black; padding: 5px; width: 60px;">
                        Цена за метр
                    </td>
                </tr>
            </table>             
            <div style="width:840px;">
                <div style="width:420px;float:left;">          
                    <table border="0" cellpadding="0px" cellspacing="0px" style="background-color: white;
                        width: 420px; margin: 0px; padding: 0px;">
                        <% int paramCount = 0; %>
                        <% foreach (var group in Model.Take((int)ViewData["Count"])) { %>      
                            <% paramCount++; %>      
                            <tr>
                                <td colspan="3" style="text-align:center;border: solid 1px black;"><b><%= Html.Encode(group.Name) %></b></td>
                            </tr>
                            <% foreach (var product in group.Products.OrderBy(p => p.Number).ToList()) {%>
                                <% paramCount++; %> 
                                <tr>
                                    <td style="text-align:left;border: solid 1px black;width:300px;">
                                        <% if (product.Name.Length > 43) { %>
                                            <%= Html.Encode(product.Name.Substring(0, 43)) %>
                                        <% } else { %>
                                            <%= Html.Encode(product.Name) %>
                                        <% } %>
                                    </td>
                                    <td style="text-align:right;border: solid 1px black;width:70px;">
                                        <%= Html.Encode(product.Price.ToString("## ###"))%>
                                    </td>
                                    <td style="text-align:right;border: solid 1px black;width:70px;">
                                        <% if (product.PriceByMiter.HasValue)
                                           {%>
                                        <%=Html.Encode(product.PriceByMiter.Value)%>
                                        <% } else {%>
                                            &nbsp;
                                        <% } %>
                                    </td>                        
                                </tr>
                            <% } %>
                       <% } %>
                    </table> 
                </div>              
                <div style="width:420px;float:left;">          
                    <table border="0" cellpadding="0px" cellspacing="0px" style="background-color: white;
                        width: 420px; margin: 0px; padding: 0px;">
                        <% foreach (var group in Model.Skip((int)ViewData["Count"])) { %> 
                            <% paramCount--; %>            
                            <tr>
                                <td colspan="3" style="text-align:center;border: solid 1px black;"><b><%= Html.Encode(group.Name) %></b></td>
                            </tr>
                            <% foreach (var product in group.Products.OrderBy(p => p.Number).ToList()) {%>
                                <% paramCount--; %> 
                                <tr>
                                    <td style="text-align:left;border: solid 1px black;width:300px;">
                                        <% if (product.Name.Length > 43) { %>
                                            <%= Html.Encode(product.Name.Substring(0, 43)) %>
                                        <% } else { %>
                                            <%= Html.Encode(product.Name) %>
                                        <% } %>
                                    </td>
                                    <td style="text-align:right;border: solid 1px black;width:70px;">
                                        <%= Html.Encode(product.Price.ToString("## ###"))%>
                                    </td>
                                    <td style="text-align:right;border: solid 1px black;width:70px;">
                                        <% if (product.PriceByMiter.HasValue)
                                           {%>
                                        <%=Html.Encode(product.PriceByMiter.Value)%>
                                        <% } else {%>
                                            &nbsp;
                                        <% } %>
                                    </td>                        
                                </tr>
                            <% } %>
                       <% } %>
                       <% for (int i = 0; i < paramCount; i++) { %>
                            <tr>
                                <td style="text-align:left;border: solid 1px black;width:300px;">
                                    &nbsp;
                                </td>
                                <td style="text-align:right;border: solid 1px black;width:70px;">
                                    &nbsp;
                                </td>
                                <td style="text-align:right;border: solid 1px black;width:70px;">
                                    &nbsp;
                                </td>                        
                            </tr>
                       <% } %>
                    </table> 
                </div>   
            </div>        
        </div>
        <div style="width: 840px; height: 225px; background-image: url(../../Content/images/bottomp.jpg);
            background-repeat: no-repeat;float:left;">
        </div>
    </div>
</body>
</html>
