<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<li>
    <h2>Услуги</h2>
    <ul>
        <li>
            <%= Html.ActionLink("Доставка", "Index", "Delivery") %>
        </li>        
        <li>
            <%= Html.ActionLink("Резка металла", "Rezka", "Service")%>
        </li>
    </ul>
</li>
