<%@ Import Namespace="Steel.Models.DAL"%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<% foreach(var item in (new SteelDBDataContext()).News.OrderByDescending(n => n.Date).Take(3)) { %>
    <li>
        <h3><%= Html.Encode(item.Date.ToLongDateString()) %></h3>
        <p><%= Html.ActionLink(item.Title + "...", "Index", "News") %></p>
    </li>
<% } %>