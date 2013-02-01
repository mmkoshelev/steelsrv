using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Steel.Models;
using Steel.Models.DAL;

namespace Steel.Controllers
{
    public class NewsController : Controller
    {
        private SteelDBDataContext ctx = new SteelDBDataContext();

        private const int count = 10;

        //
        // GET: /News/
        public ActionResult Index(int? id)
        {
            ViewData["Auth"] = UserAuth.IsAuthenticated();
            ViewData["PagesCount"] = GetPagesCount();
            if (id.HasValue)
            {
                if (id.Value > 0)
                {
                    ViewData["CurrentPage"] = id.Value;
                    return View(ctx.News.OrderByDescending(n => n.Date).Skip(count * (id.Value - 1)).Take(count).ToList());
                }
            }

            ViewData["CurrentPage"] = 1;
            return View(ctx.News.OrderByDescending(n => n.Date).Take(count).ToList());
        }

        protected int GetPagesCount()
        {
            int allCount = ctx.News.Count();
            double pagesCountD = (double)allCount / (double)count;
            return (int)Math.Ceiling(pagesCountD);
        }

        //
        // GET: /News/Create
        [Authorize]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /News/Create
        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Create(string title, string message)
        {
            ValidateNews(title, message);
            if (!ModelState.IsValid)
                return View();

            try
            {
                New news = new New
                {
                    Date = DateTime.Now,
                    IpHost = Request.UserHostName,
                    Title = title,
                    Message = message
                };
                ctx.News.InsertOnSubmit(news);
                ctx.SubmitChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /News/Edit/5
        [Authorize]
        public ActionResult Edit(int id)
        {
            New news = ctx.News.FirstOrDefault(n => n.Id == id);
            return View(news);
        }

        //
        // POST: /News/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Edit(New newsToEdit)
        {
            ValidateNews(newsToEdit.Title, newsToEdit.Message);
            if (!ModelState.IsValid)
                return View(newsToEdit);

            try
            {
                New news = ctx.News.FirstOrDefault(n => n.Id == newsToEdit.Id);
                news.IpHost = newsToEdit.IpHost;
                news.Message = newsToEdit.Message;
                news.Title = newsToEdit.Title;
                news.Date = newsToEdit.Date;
                ctx.SubmitChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View(newsToEdit);
            }
        }

        [Authorize]
        public ActionResult Delete(int id)
        {
            New news = ctx.News.FirstOrDefault(n => n.Id == id);
            ctx.News.DeleteOnSubmit(news);
            ctx.SubmitChanges();

            return RedirectToAction("Index");
        }

        protected void ValidateNews(string title, string message)
        {
            if (title.Trim().Length == 0)
                ModelState.AddModelError("title", "Введите заголовок новости");
            if (message.Trim().Length == 0)
                ModelState.AddModelError("message", "Введите текст новости");
        }
    }
}
