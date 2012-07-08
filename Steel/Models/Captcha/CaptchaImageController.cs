using System;
using System.Drawing.Imaging;
using System.IO;
using System.Web.Caching;
using System.Web.Mvc;

namespace Steel.Models.Captcha
{
    /// <summary>
    /// Контроллер рендеринга капчи
    /// </summary>
    public class CaptchaImageController : Controller
    {
        /// <summary>
        /// Возвращает байтовый поток изображеия
        /// </summary>
        /// <param name="id">Идентификатор капчи в кеше</param>
        /// <returns>Байтовый поток изображения</returns>
        public ActionResult Draw(string id)
        {
            CaptchaImage img = (CaptchaImage) HttpContext.Cache[id];
            if (img != null)
            {
                MemoryStream ms = new MemoryStream();
                img.Image.Save(ms, ImageFormat.Bmp);

                return File(ms.ToArray(), "image/bmp");
            }

            return File(new byte[0], "image/bmp");
        }

        /// <summary>
        /// Генерация произвольной капчи
        /// </summary>
        /// <returns>
        /// Рендерит частичное представление для получения изображения 
        /// и hidden field для отправки идентификатора капчи для проверки
        /// </returns>
        public ActionResult Generate()
        {
            Guid guid = Guid.NewGuid();
            CaptchaImage img = new CaptchaImage(175, 75, 5);
            HttpContext.Cache.Insert(guid.ToString(), img, null, Cache.NoAbsoluteExpiration, TimeSpan.FromMinutes(10));

            return PartialView("CaptchaView", guid.ToString());
        }
    }
}