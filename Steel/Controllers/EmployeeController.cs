using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Steel.Models;
using Steel.Models.DAL;

namespace Steel.Controllers
{
    public class EmployeeController : Controller
    {
        /// <summary>
        /// Контекст данных
        /// </summary>
        private SteelDBDataContext ctx = new SteelDBDataContext();

        //
        // GET: /Employee/
        public ActionResult Index()
        {
            ViewData["Auth"] = UserAuth.IsAuthenticated();
            return View(ctx.Employees.AsEnumerable().
                OrderBy(e => e.Number).ToList());
        }

        //
        // GET: /Employee/Create
        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Employee/Create
        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Create([Bind(Exclude = "Id,Picture")]Employee emp, HttpPostedFileBase PictureFile)
        {
            ValidateEmployee(emp);
            if (PictureFile == null)
                ModelState.AddModelError("PictureFile", "Необходимо указать изображение");
            if (!ModelState.IsValid)
                return View();
            
            try
            {
                string path = "~/Content/Employee/";
                string ext = Path.GetExtension(PictureFile.FileName);
                string fileName = Guid.NewGuid() + ext;
                PictureFile.SaveAs(Server.MapPath(path + fileName));

                emp.Picture = fileName;
                ctx.Employees.InsertOnSubmit(emp);
                ctx.SubmitChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Employee/Edit/5
        [Authorize]
        public ActionResult Edit(int id)
        {
            Employee emp = ctx.Employees.FirstOrDefault(e => e.Id == id);
            return View(emp);
        }

        //
        // POST: /Employee/Edit/5
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit([Bind(Exclude = "Picture")]Employee emp, HttpPostedFileBase PictureFile)
        {
            ValidateEmployee(emp);
            if (!ModelState.IsValid)
                return View();

            try
            {
                Employee empBase = ctx.Employees.FirstOrDefault(e => e.Id == emp.Id);
                if (PictureFile != null)
                {
                    string path = "~/Content/Employee/";
                    string ext = Path.GetExtension(PictureFile.FileName);
                    string fileName = Guid.NewGuid() + ext;
                    PictureFile.SaveAs(Server.MapPath(path + fileName));

                    string deletePath = Server.MapPath(path + empBase.Picture);
                    if (System.IO.File.Exists(deletePath))
                        System.IO.File.Delete(deletePath);

                    empBase.Picture = fileName;
                }

                empBase.Number = emp.Number;
                empBase.Phone = emp.Phone;
                empBase.Post = emp.Post;
                empBase.FIO = emp.FIO;

                ctx.SubmitChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [Authorize]
        public ActionResult Delete(int id)
        {
            Employee emp = ctx.Employees.FirstOrDefault(e => e.Id == id);
            if (emp != null)
            {
                string path = "~/Content/Employee/";
                string deletePath = Server.MapPath(path + emp.Picture);
                if (System.IO.File.Exists(deletePath))
                    System.IO.File.Delete(deletePath);

                ctx.Employees.DeleteOnSubmit(emp);
                ctx.SubmitChanges();
            }
            return RedirectToAction("Index");
        }

        protected void ValidateEmployee(Employee emp)
        {
            if (emp.FIO.Trim().Length == 0)
                ModelState.AddModelError("FIO", "Необходимо ввести Ф.И.О.");
            if (emp.Post.Trim().Length == 0)
                ModelState.AddModelError("Post", "Необходимо ввести должность");
            if (emp.Phone.Trim().Length == 0)
                ModelState.AddModelError("Phone", "Необходимо ввести телефон");
        }
    }
}
