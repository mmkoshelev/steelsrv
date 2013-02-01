<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<string>" %>
<input type="hidden" name="captchaId" value='<%= Model %>' />
<img src='<%= Url.Action("Draw", "CaptchaImage", new { id = Model })%>' alt='Captcha' />
