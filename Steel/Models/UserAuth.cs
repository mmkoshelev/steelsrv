using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Steel.Models
{
    /// <summary>
    /// Аутентификация пользователя
    /// </summary>
    public static class UserAuth
    {
        /// <summary>
        /// Ауткентификация пользователя
        /// </summary>
        /// <param name="name">Имя</param>
        /// <param name="password">Пароль</param>
        /// <returns>True - успешно</returns>
        public static bool Authenticate(string name, string password)
        {
            if (FormsAuthentication.Authenticate(name, password))
            {
                FormsAuthentication.RedirectFromLoginPage(name, false);
                return true;
            }

            return false;
        }

        /// <summary>
        /// Выход
        /// </summary>
        public static void SignOut()
        {
            FormsAuthentication.SignOut();
        }

        /// <summary>
        /// Вошелд ли пользователь в систему
        /// </summary>
        /// <returns>True - да</returns>
        public static bool IsAuthenticated()
        {
            return HttpContext.Current.User.Identity.IsAuthenticated;
        }
    }
}
