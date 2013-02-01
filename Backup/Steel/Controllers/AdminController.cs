using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Steel.Models;

namespace Steel.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        public ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(string name, string password)
        {
            if (name.Trim().Length == 0)
                ModelState.AddModelError("name", "Введите имя");
            if (name.Trim().Length == 0)
                ModelState.AddModelError("password", "Введиите пароль");
            if (!ModelState.IsValid)
                return View("Index");

            if (UserAuth.Authenticate(name, password))
            {
                return RedirectToAction("Index", "About");
            }

            ModelState.AddModelError("name", "Неверно указанные данные");
            return View("Index");
        }
    }
}
