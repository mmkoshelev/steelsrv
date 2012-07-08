using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace Steel.Controllers
{
    public class AboutController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Presentation()
        {
            return View();
        }

        public ActionResult Error()
        {
            return View();
        }
    }
}
