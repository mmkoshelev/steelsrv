using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Steel.Models;
using Steel.Models.Captcha;
using Steel.Models.DAL;

namespace Steel.Controllers
{
    public class GuestController : Controller
    {
        private SteelDBDataContext ctx = new SteelDBDataContext();

        private const int count = 20;

        //
        // GET: /Guest/
        public ActionResult Index(int? id)
        {
            ViewData["Auth"] = UserAuth.IsAuthenticated();
            ViewData["PagesCount"] = GetPagesCount();
            if (id.HasValue)
            {
                if (id.Value > 0)
                {
                    ViewData["CurrentPage"] = id.Value;
                    return View(ctx.GuestMessages.OrderBy(m => m.Date).Skip(count*(id.Value - 1)).Take(count).ToList());
                }
            }

            ViewData["CurrentPage"] = 1;
            return View("Index", ctx.GuestMessages.OrderBy(m => m.Date).Take(count).ToList());
        }

        protected int GetPagesCount()
        {
            int allCount = ctx.GuestMessages.Count();
            double pagesCountD = allCount / (double)count;
            return (int)Math.Ceiling(pagesCountD);
        }

        //
        // POST: /Guest/Create
        [AcceptVerbs(HttpVerbs.Post)]
        [CheckCaptchaFilter("captchaId", "captchaText", "captchaResult", IgnoreCase = true)]
        public ActionResult Create(string name, string message, string captchaText)
        {
            if (!(bool)RouteData.Values["captchaResult"])
                ModelState.AddModelError("captchaText", "Текст капчи введен неверно");
            if (captchaText.Trim().Length == 0)
                ModelState.AddModelError("captchaText", "Введите текст капчи");
            if (name.Trim().Length == 0)
                ModelState.AddModelError("name", "Введите Ваше имя");
            if (message.Trim().Length == 0)
                ModelState.AddModelError("message", "Введите текст сообщения");
            if (!ModelState.IsValid)
                return Index(null);  

            try
            {
                GuestMessage mes = new GuestMessage
                                       {
                                           Date = DateTime.Now,
                                           IpHost = Request.UserHostName,
                                           Name = name,
                                           Message = message
                                       };
                ctx.GuestMessages.InsertOnSubmit(mes);
                ctx.SubmitChanges();

                return RedirectToAction("Index", new { id = GetPagesCount() });
            }
            catch
            {
                return RedirectToAction("Index");
            }

        }

        //
        // GET: /Guest/Edit/5
        [Authorize]
        public ActionResult Edit(int id)
        {
            GuestMessage mess = ctx.GuestMessages.FirstOrDefault(m => m.Id == id);
            return View(mess);
        }

        //
        // POST: /Guest/Edit/5
        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Edit(GuestMessage messageToEdit)
        {
            if (messageToEdit.Name.Trim().Length == 0)
                ModelState.AddModelError("Name", "Введите Ваше имя");
            if (messageToEdit.Message.Trim().Length == 0)
                ModelState.AddModelError("Message", "Введите текст сообщения");
            if (!ModelState.IsValid)
                return View(messageToEdit);

            try
            {
                GuestMessage mess = ctx.GuestMessages.FirstOrDefault(m => m.Id == messageToEdit.Id);
                mess.IpHost = messageToEdit.IpHost;
                mess.Message = messageToEdit.Message;
                mess.Name = messageToEdit.Name;
                mess.Date = messageToEdit.Date;
                ctx.SubmitChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View(messageToEdit);
            }
        }

        [Authorize]
        public ActionResult Delete(int id)
        {
            GuestMessage mess = ctx.GuestMessages.FirstOrDefault(m => m.Id == id);
            ctx.GuestMessages.DeleteOnSubmit(mess);
            ctx.SubmitChanges();

            return RedirectToAction("Index");
        }
    }
}
