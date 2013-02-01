using System;
using System.Web.Mvc;

namespace Steel.Models.Captcha
{
    /// <summary>
    /// Фильтр проверки корректности капчи, записывает результат в RouteData
    /// с ключем ErrorName булева типа (true - успешная проверка, иначе ошибка ввода)
    /// </summary>
    public class CheckCaptchaFilterAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// Имя идентификатора капчи из посланного запроса
        /// </summary>
        public string IdName { get; set; }

        /// <summary>
        /// Название текстового поля формы от которго происходит посылка данных
        /// </summary>
        public string TextName { get; set; }

        /// <summary>
        /// Название поля для занесения в RouteData булева свойства проверки
        /// </summary>
        public string ErrorName { get; set; }

        /// <summary>
        /// True - не проверять регистр символов, иначе проверять
        /// </summary>
        public bool IgnoreCase { get; set; }

        public CheckCaptchaFilterAttribute(string idName, string textName, string errorName)
        {
            IdName = idName;
            TextName = textName;
            ErrorName = errorName;
            IgnoreCase = true;
        }

        /// <summary>
        /// Проверка капчи из контекста запроса
        /// </summary>
        /// <param name="filterContext">Контекст запроса</param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string id = filterContext.HttpContext.Request[IdName];
            string text = filterContext.HttpContext.Request[TextName];
            if (id != null)
            {
                CaptchaImage img = (CaptchaImage) filterContext.HttpContext.Cache[id];
                if (img != null)
                {
                    if(IgnoreCase)
                    {
                        filterContext.RouteData.Values[ErrorName] = 
                            text.Equals(img.Text, StringComparison.InvariantCultureIgnoreCase);
                    }
                    else
                    {
                        filterContext.RouteData.Values[ErrorName] =
                            text.Equals(img.Text, StringComparison.InvariantCulture); 
                    }

                    return;
                }
            }

            filterContext.RouteData.Values[ErrorName] = false;
        }
    }
}