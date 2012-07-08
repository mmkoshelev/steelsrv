<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Steel.Models.DAL.GuestMessage>>" %>
<%@ Import Namespace="Steel.Models.Captcha"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <center>
        <h1>Гостевая книга</h1>
        <br />
        <div>В гостевой книге Вы можете оставить свои пожелания, предложения, отзывы о нашей фирме и продукции.</div>
    </center>
    <br />
    <%= Html.ValidationSummary("Ваш комментарий не добавлен! Проверьте правильность заполненных полей!")%>
    <br />
    <% foreach (var item in Model) { %>
        <div>
        <img src="../../Content/images/pencil.png" width="16px" height="16px" />
        <b style="color:#333333;"><%= Html.Encode(item.Name) %></b> 
        <div style="float:right;">
            (<%= Html.Encode(item.Date) %>)
            <% if ((bool)ViewData["Auth"]) {%> <%= Html.Encode(item.IpHost) %> <% } %>
        </div>
        </div> 
        <hr />
        <p><%= Html.Encode(item.Message) %></p>
        <% if ((bool)ViewData["Auth"]) {%>
            <%= Html.ActionLink("Редактировать", "Edit", new { id=item.Id }) %> |
            <%= Html.ActionLink("Удалить", "Delete", new { id = item.Id }, new { onclick = "return confirm('Вы уверены?');" })%>
            <br />
        <% } %>
        <br />
    <% } %>
    (Страниц):&nbsp;
    <% for (int i = 1; i <= (int)ViewData["PagesCount"]; i++) {%>
        <% if ((int)ViewData["CurrentPage"] == i) { %>
            <b><%= Html.Encode(i) %></b>
        <% } else { %>
            [<%= Html.ActionLink(i.ToString(), "Index", new {id = i}) %>]
        <% } %>
        &nbsp;
    <% } %>
    <br />
    <br />
    <div class="small2-captcha">
      <div>        
        <% using (Html.BeginForm("Create", "Guest")) {%>
            Ваше имя:<br />
            <%= Html.TextBox("name") %>
            <%= Html.ValidationMessage("name", "*") %><br /><br />
            Текст сообщения:<br />
            <%= Html.TextArea("message", "", 7, 43, null) %>
            <%= Html.ValidationMessage("message", "*")%><br /><br />
            <div style="height:100px;">
                Введите текст картинки:&nbsp;
                <%=Html.TextBox("captchaText") %>
                <%= Html.ValidationMessage("captchaText", "*")%>
                <%= Ajax.ActionLink("Обновить", "Generate", "CaptchaImage", new AjaxOptions { UpdateTargetId="captcha1" }) %>            
                <br /><br /> 
                <div id="captcha1" style="display: inline;height: 75px;width:175px;margin-left:100px;">
                    <% 
                       Guid guid = Guid.NewGuid();
                       CaptchaImage img = new CaptchaImage(175, 75, 5);
                       HttpContext.Current.Cache.Insert(guid.ToString(), img, null, Cache.NoAbsoluteExpiration, TimeSpan.FromMinutes(10));
                    %>
                    <% Html.RenderPartial("CaptchaView", guid.ToString()); %>
                </div>                
            </div>           
            <br /><br />
            <input type="submit" value="Отправить" />           
        <% } %>
      </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>

