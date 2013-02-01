<%@ Page Culture="ru-RU" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Металлопрокат</h1>
    </center>
    <br />
    <div>
        <p>
            ООО "Сталь-Маркет" предлагает Вам металлопрокат как небольшими партиями,
            так и вагонными поставками с ведущих отечественных металлургических комбинатов непосредственно
            в адрес потребителей. Всегда на складе следующие позиции металла: арматура, трубы,
            швеллера, балки, круг, квадрат, уголок, лист, сетка, полоса и др. Стратегическое
            направление деятельности ООО "Сталь-Маркет" - комплектация строительных и
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
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/krug2m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/kvadrat1m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/kvadrat2m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/list_10.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/list_4.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/list_6.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/list_7.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/list_bt1m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/list2.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/list2m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/list3.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/LofM-03.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/polosa3m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/polosa4.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/shveller1m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/shveller2m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/truba.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/truba_9.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/truba_krugla9.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/truba_profilna9.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/truba2.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/truba2m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/truba5.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/ugolok1m.jpg" /></li>
                <li>
                    <img width="100" height="100" src="../../Content/images/metal/ugolok2m.jpg" /></li>
            </ul>
        </div>
    </div>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
    <% Html.RenderPartial("ServiceMenu"); %>
</asp:Content>
