using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Steel.Models
{
    /// <summary>
    /// Вспомогательный класс хелпера
    /// </summary>
    public static class ImageHelper
    {
        /// <summary>
        /// Изображение
        /// </summary>
        /// <param name="helper">Хтмл хелпер</param>
        /// <param name="imgPath">Путь к картинке</param>
        /// <param name="width">Ширина</param>
        /// <param name="height">Высота</param>
        /// <returns>Тег изображения</returns>
        public static string Img(this HtmlHelper helper, string imgPath, int width, int height)
        {
            return string.Format("<img src=\"./Content/Employee/{0}\" width=\"{1}\" height=\"{2}\" />", imgPath, width, height);
        }
    }
}
