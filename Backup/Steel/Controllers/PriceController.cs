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
    public class PriceController : Controller
    {
        /// <summary>
        /// Контекст данных
        /// </summary>
        private SteelDBDataContext ctx = new SteelDBDataContext();


        //
        // GET: /Price/
        public ActionResult Index()
        {
            ViewData["Auth"] = UserAuth.IsAuthenticated();
            return View(ctx.ProductGroups.AsEnumerable().
                OrderBy(g => g.Number).ToList());
        }

        public ActionResult Print()
        {
            var result = ctx.ProductGroups.AsEnumerable().OrderBy(g => g.Number).ToList();

            int resSize = result.Count;
            Dictionary<int, int> eachGroupCount = new Dictionary<int, int>();
            int i = 1;
            int prodCount = 0;
            foreach (ProductGroup pg in result)
                eachGroupCount.Add(i++, pg.Products.Count());
            foreach (int par in eachGroupCount.Values)
                prodCount += par;
            prodCount += resSize;
            i = 1;
            int j = 0;
            int finalCount = 0;
            foreach (var kv in eachGroupCount)
            {
                finalCount++;
                j++;
                j += kv.Value;
                if (j > prodCount / 2)
                    break;
            }

            ViewData["Count"] = finalCount;
            return View(result);
        }

        //
        // GET: /Price/Create
        [Authorize]
        public ActionResult Create()
        {
            AddGroupList();
            return View();
        }

        protected void AddGroupList()
        {
            var groups = ctx.ProductGroups.AsEnumerable().
               OrderBy(g => g.Number).ToList();
            ViewData["GroupId"] = new SelectList(groups, "Id", "Name");
        }

        protected void AddSelectedGroupList(int selectedId)
        {
            var groups = ctx.ProductGroups.AsEnumerable().
               OrderBy(g => g.Number).ToList();
            ViewData["GroupId"] = new SelectList(groups, "Id", "Name", selectedId);
        }

        //
        // POST: /Price/Create
        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Create([Bind(Exclude = "Id")]Product product)
        {
            ValidateProduct(product);
            if (!ModelState.IsValid)
            {
                AddGroupList();
                return View();
            }

            try
            {
                ctx.Products.InsertOnSubmit(product);
                ctx.SubmitChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                AddGroupList();
                return View();
            }
        }

        //
        // GET: /Price/Edit/5
        [Authorize]
        public ActionResult Edit(int id)
        {
            Product product = ctx.Products.FirstOrDefault(p => p.Id == id);
            AddSelectedGroupList(product.GroupId);
            return View(product);
        }

        //
        // POST: /Price/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Edit(Product productToEdit)
        {
            ValidateProduct(productToEdit);
            if (!ModelState.IsValid)
            {
                AddSelectedGroupList(productToEdit.GroupId);
                return View(productToEdit);
            }
            try
            {
                Product product = ctx.Products.FirstOrDefault(g => g.Id == productToEdit.Id);
                if (product != null)
                {
                    product.Name = productToEdit.Name;
                    product.Number = productToEdit.Number;
                    product.GroupId = productToEdit.GroupId;
                    product.Price = productToEdit.Price;
                    product.PriceByMiter = productToEdit.PriceByMiter;

                    ctx.SubmitChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                AddSelectedGroupList(productToEdit.GroupId);
                return View(productToEdit);
            }
        }

        [Authorize]
        public ActionResult QuickEdit()
        {
            return View(ctx.ProductGroups.AsEnumerable().
                OrderBy(g => g.Number).ToList());
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult QuickEdit(int id, decimal? price, decimal? priceByMiter)
        {
            if (Request.IsAjaxRequest())
            {
                Product product = ctx.Products.FirstOrDefault(p => p.Id == id);
                if (product != null)
                {
                    try
                    {
                        if (price.HasValue)
                            product.Price = price.Value;
                        else
                            throw new Exception();
                        product.PriceByMiter = priceByMiter;
                        ctx.SubmitChanges();

                        return Content("<span style='color:green;'>Ok</span>");
                    }
                    catch
                    {
                        return Content("<span style='color:red;'>Er</span>");
                    }
                }
            }

            return View();
        }

        [Authorize]
        public ActionResult Delete(int id)
        {
            Product product = ctx.Products.FirstOrDefault(g => g.Id == id);
            if (product != null)
            {
                ctx.Products.DeleteOnSubmit(product);
                ctx.SubmitChanges();
            }
            return RedirectToAction("Index");
        }

        protected void ValidateProduct(Product product)
        {
            if (product.Name.Trim().Length == 0)
                ModelState.AddModelError("Name", "Необходимо ввести наименование");
        }

        [Authorize]
        public ActionResult Load()
        {
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Load(HttpPostedFileBase priceFile)
        {
            if (priceFile != null)
            {
                string pricePath = Server.MapPath("~/price.xls");
                string pricePathTemp = Server.MapPath("~/price_.xls");
                try
                {
                    System.IO.File.Move(pricePath, pricePathTemp);
                    priceFile.SaveAs(pricePath);
                    if (System.IO.File.Exists(pricePathTemp))
                        System.IO.File.Delete(pricePathTemp);

                    return RedirectToAction("Index", "About");
                }
                catch
                {
                    if (System.IO.File.Exists(pricePath))
                        System.IO.File.Delete(pricePath);

                    if (System.IO.File.Exists(pricePathTemp))
                        System.IO.File.Move(pricePathTemp, pricePath);

                    return View();
                }
            }

            return View();
        }
    }
}
