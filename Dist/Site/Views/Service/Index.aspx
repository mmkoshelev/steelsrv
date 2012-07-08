<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Товар</h1>
        <br />
        <div>
            ООО "Сталь Сервис" предлагает Вам следующие виды товаров:
            <br />
            <br />
        </div>
    </center>
    <div>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%= Html.ActionLink("Металлопрокат", "Metal", "Service") %></strong>
            ООО "Сталь Сервис" предлагает Вам металлопрокат как небольшими партиями,
            так и вагонными поставками с ведущих отечественных металлургических комбинатов непосредственно
            в адрес потребителей. Всегда на складе следующие позиции металла: арматура, трубы,
            швеллера, балки, круг, квадрат, уголок, лист, сетка, полоса и др. Стратегическое
            направление деятельности ООО "Сталь Сервис" - комплектация строительных и
            производственных объектов черным прокатом, в том числе и при небольших объемах поставок.
        </p>
        <br />
        <div class="small3">
            <ul>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/balka1m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/balka2m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/katanka1m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/katanka2m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/krug1m.jpg" /></li>
            </ul>
        </div>
        <br />
        <br />
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%= Html.ActionLink("Стройматериалы", "Stroi", "Service") %></strong>
            В настоящее время открыт и работает склад строительных материалов, на котором в
            широком ассортименте представлены - фанера строительная (марки ФК и ФСФ), цемент, цементно-песчаные смеси, 
            экологический чистый утеплитель марки &quot;ИЗОВОЛ&quot;, сетки кладочные, сетка рабица, 
            электроды различных марок, OSB.
        </p>
        <br />
        <div class="small3">
            <ul>
                <li>
                    <img width="100" height="100" src="../../Content/images/stroi/1_b.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/stroi/1158853551.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/stroi/1177593627t.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/stroi/180301.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/stroi/DSC00276.jpg" /></li>
            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
    <% Html.RenderPartial("ServiceMenu"); %>
</asp:Content>
