<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>Загрузить новый прайс-лист</h1>
    </center>
    <br />
    <div>
        <% using (Html.BeginForm("Load", "Price", FormMethod.Post, new { enctype = "multipart/form-data" })) {%>
            <label for="PictureFile">Excel файл прайс-листа:</label><br />
            <input name="priceFile" id="priceFile" type="file" />&nbsp;
            <input type="submit" value="Обновить" />
        <% } %> 
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>
