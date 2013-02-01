<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Услуги</h1>
        <br />
        <div>
            ООО "Сталь Сервис" предлагает Вам следующие виды услуг:
            <br />
            <br />
        </div>
    </center>
    <div>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%= Html.ActionLink("Доставка", "Index", "Delivery") %></strong>            
        </p>
        <br />   
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%= Html.ActionLink("Резка металла", "Rezka", "Service") %></strong>            
        </p>
        <br />        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
    <% Html.RenderPartial("ServiceMenu2"); %>
</asp:Content>
