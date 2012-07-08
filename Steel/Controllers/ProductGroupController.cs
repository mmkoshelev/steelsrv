using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Steel.Models.DAL;

namespace Steel.Controllers
{
    public class ProductGroupController : Controller
    {
        /// <summary>
        /// Контекст данных
        /// </summary>
        private SteelDBDataContext ctx = new SteelDBDataContext();

        //
        // GET: /ProductGroup/
        [Authorize]
        public ActionResult Index()
        {
            return View(ctx.ProductGroups.AsEnumerable().
                OrderBy(g => g.Number).ToList());
        }

        //
        // GET: /ProductGroup/Create
        [Authorize]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /ProductGroup/Create
        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Create([Bind(Exclude="Id")]ProductGroup group)
        {
            ValidateGroup(group);
            if (!ModelState.IsValid)
                return View();

            try
            {
                ctx.ProductGroups.InsertOnSubmit(group);
                ctx.SubmitChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /ProductGroup/Edit/5
        [Authorize]
        public ActionResult Edit(int id)
        {
            ProductGroup group = ctx.ProductGroups.FirstOrDefault(g => g.Id == id);
            return View(group);
        }

        //
        // POST: /ProductGroup/Edit/5
        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Edit(ProductGroup groupToEdit)
        {
            ValidateGroup(groupToEdit);
            if (!ModelState.IsValid)
                return View(groupToEdit);
            try
            {
                ProductGroup group = ctx.ProductGroups.FirstOrDefault(g => g.Id == groupToEdit.Id);
                if (group != null)
                {
                    group.Name = groupToEdit.Name;
                    group.Number = groupToEdit.Number;
                    ctx.SubmitChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View(groupToEdit);
            }
        }

        [Authorize]
        public ActionResult Delete(int id)
        {
            ProductGroup group = ctx.ProductGroups.FirstOrDefault(g => g.Id == id);
            if (group != null)
            {
                ctx.ProductGroups.DeleteOnSubmit(group);
                ctx.SubmitChanges();
            }
            return RedirectToAction("Index");
        }

        /// <summary>
        /// Проверка валидности данных группы
        /// </summary>
        /// <param name="group">Данные</param>
        protected void ValidateGroup(ProductGroup group)
        {
            if (group.Name.Trim().Length == 0)
                ModelState.AddModelError("Name", "Необходимо ввести наименование");
        }
    }
}
