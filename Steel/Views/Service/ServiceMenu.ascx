<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<li>
    <h2>Товар</h2>
    <ul>
        <li>
            <%= Html.ActionLink("Металлопрокат", "Metal", "Service") %>
        </li>
        <li>
            <%= Html.ActionLink("Стройматериалы", "Stroi", "Service") %>
        </li>
    </ul>
</li>
