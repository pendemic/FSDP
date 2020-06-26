using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSDP.DATA.EF;

namespace FSDP.UI.MVC.Controllers
{
    public class ClassInfoesController : Controller
    {
        private FSDPEntities db = new FSDPEntities();

        // GET: ClassInfoes
        public ActionResult Index()
        {
            var classInfoes = db.ClassInfoes.Include(c => c.Level);
            return View(classInfoes.ToList());
        }
        public ActionResult BegIndex()
        {
            var begClass = db.ClassInfoes.Where(c => c.LevelRequired == 1);
            return View(begClass.ToList());
        }
        public ActionResult IntIndex()
        {
            var intClass = db.ClassInfoes.Where(c => c.LevelRequired == 2);
            return View(intClass.ToList());
        }
        public ActionResult AdvIndex()
        {
            var advClass = db.ClassInfoes.Where(c => c.LevelRequired == 3);
            return View(advClass.ToList());
        }
        //Remove View
        // GET: ClassInfoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassInfo classInfo = db.ClassInfoes.Find(id);
            if (classInfo == null)
            {
                return HttpNotFound();
            }
            return View(classInfo);
        }
        [Authorize(Roles = "Admin")]
        // GET: ClassInfoes/Create
        public ActionResult Create()
        {
            ViewBag.LevelRequired = new SelectList(db.Levels, "LevelID", "LevelName");
            return View();
        }

        // POST: ClassInfoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClassID,ClassName,Description,ClassDate,LevelRequired,ClassLimit")] ClassInfo classInfo)
        {
            if (ModelState.IsValid)
            {
                db.ClassInfoes.Add(classInfo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LevelRequired = new SelectList(db.Levels, "LevelID", "LevelName", classInfo.LevelRequired);
            return View(classInfo);
        }
        [Authorize(Roles = "Admin")]
        // GET: ClassInfoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassInfo classInfo = db.ClassInfoes.Find(id);
            if (classInfo == null)
            {
                return HttpNotFound();
            }
            ViewBag.LevelRequired = new SelectList(db.Levels, "LevelID", "LevelName", classInfo.LevelRequired);
            return View(classInfo);
        }

        // POST: ClassInfoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClassID,ClassName,Description,ClassDate,LevelRequired,ClassLimit")] ClassInfo classInfo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(classInfo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LevelRequired = new SelectList(db.Levels, "LevelID", "LevelName", classInfo.LevelRequired);
            return View(classInfo);
        }
        [Authorize(Roles = "Admin")]
        // GET: ClassInfoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassInfo classInfo = db.ClassInfoes.Find(id);
            if (classInfo == null)
            {
                return HttpNotFound();
            }
            return View(classInfo);
        }

        // POST: ClassInfoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ClassInfo classInfo = db.ClassInfoes.Find(id);
            db.ClassInfoes.Remove(classInfo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
