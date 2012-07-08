<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Steel.Models.DAL.Employee>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Новый сотрудник</h1>    
    </center>

    <%= Html.ValidationSummary("Новый товар не добавлен! Проверьте правильность заполненных полей!")%>
    <% using (Html.BeginForm("Create", "Employee", FormMethod.Post, new { enctype = "multipart/form-data" })) {%>
        <label for="Number">Номер:</label><br />
        <%= Html.TextBox("Number") %>
        <%= Html.ValidationMessage("Number", "*") %><br /><br />
        <label for="FIO">Ф.И.О.:</label><br />
        <%= Html.TextBox("FIO") %>
        <%= Html.ValidationMessage("FIO", "*") %><br /><br />
        <label for="Post">Должность:</label><br />
        <%= Html.TextBox("Post") %>
        <%= Html.ValidationMessage("Post", "*") %><br /><br />
        <label for="Phone">Телефон:</label><br />
        <%= Html.TextBox("Phone") %>
        <%= Html.ValidationMessage("Phone", "*") %><br /><br />  
        <label for="PictureFile">Изображение:</label><br />
        <input name="PictureFile" id="PictureFile" type="file" /> 
        <%= Html.ValidationMessage("PictureFile", "*")%><br /><br />         
        <br />
        <br />
        <div>
            <input type="submit" value="Добавить" />
        </div>
    <% } %>
    <br />
    <div>
        <%=Html.ActionLink("К списку сотрудников", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
</asp:Content>

