<%@ Page Culture="RU-ru" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Доставка</h1>
    </center>
    <div>
        <div class="small2">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <img src="../../Content/images/gazel.jpg" width="120" height="91" />
                    </td>
                    <td>
                        <div>
                            По городу - 700 руб
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <b>Газель</b>
                    </td>
                    <td>
                        <div>
                            Длина - 6 м.
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="small2">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="padding: 10px 0 10px 0">
                        <img src="../../Content/images/valday.jpg" width="120" height="61" />
                    </td>
                    <td>
                        <div>
                            По городу - 1200 руб
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <b>Валдай</b>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="small2">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="padding: 10px 0 10px 0">
                        <img src="../../Content/images/dlinnomer.jpg" width="120" height="61" />
                    </td>
                    <td>
                        <div>
                            По городу - 1000 руб / час (минимально 3 часа)
                            <br />
                            за Волгу минимум 4 часа
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <b>Длинномер</b>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <%--<div class="small2">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <img src="../../Content/images/zil.jpg" width="120" height="91" />
                    </td>
                    <td>
                        <div>
                            По городу - 1200 руб / 2 часа
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <b>Зил</b>
                    </td>
                    <td>
                        <div>
                            Грузоподъемность - 5 т.
                            <br />
                            Длина - 6 м.
                        </div>
                    </td>
                </tr>
            </table>
        </div>--%>
        <%--<div class="small2">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <img src="../../Content/images/kamaz.jpg" width="120" height="91" />
                    </td>
                    <td>
                        <div>
                            По городу - 650 руб / час (минимально 3 часа)
                            <br />
                            Область - 18 руб / км
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <b>Камаз</b>
                    </td>
                    <td>
                        <div>
                            Грузоподъемность - 10 т.
                            <br />
                            Длина - 6 м.
                        </div>
                    </td>
                </tr>
            </table>
        </div>--%>
       <%-- <div class="small2">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <img src="../../Content/images/maz.jpg" width="120" height="91" />
                    </td>
                    <td>
                        <div>
                            По городу - 800 руб / час (минимально 3 часа)
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <b>Маз</b>
                    </td>
                    <td>
                        <div>
                            Грузоподъемность - 20 т.
                            <br />
                            Длина - 12 м.
                        </div>
                    </td>
                </tr>
            </table>
        </div>--%>
        <center>
            <div>
                Осуществляем доставку по городу Твери, Тверской области, другим городам.
            </div>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftMenuContent" runat="server">
    <% Html.RenderPartial("ServiceMenu2"); %>
</asp:Content>
