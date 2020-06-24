using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSDP.DATA.EF;
using Microsoft.AspNet.Identity;

namespace FSDP.UI.MVC.Controllers
{
    public class ReservationsController : Controller
    {
        private FSDPEntities db = new FSDPEntities();

        // GET: Reservations
        public ActionResult Index()
        {
            if (User.IsInRole("Admin") || User.IsInRole("Employee"))
            {
                var reservations = db.Reservations.Include(r => r.ClassInfo).Include(r => r.Location).Include(r => r.OwnerAsset);
                return View(reservations.ToList());
            }
            string user = User.Identity.GetUserId();
            var asset = db.Reservations.Where(a => a.OwnerAsset.OwnerID == user);
            return View(asset.ToList());
        }

        // GET: Reservations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }
        [Authorize(Roles = "Admin, Employee, Owner")]
        // GET: Reservations/Create
        public ActionResult Create()
        {
            ViewBag.ClassID = new SelectList(db.ClassInfoes, "ClassID", "ClassName");
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName");
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName");
            return View();
        }

        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservationID,OwnerAssetID,LocationID,ClassID")] Reservation reservation)
        {
            int nbrRes = db.Reservations.Where(c => c.ClassID == reservation.ClassID).Count();
            int nbrMax = db.ClassInfoes.Where(m => m.ClassID == reservation.ClassID).FirstOrDefault().ClassLimit;
            if (ModelState.IsValid)
            {
                //Add functionality for class restrictions
                if (db.Reservations.Where(o => o.OwnerAssetID == reservation.OwnerAssetID).Count() > 0)
                {
                    return RedirectToAction("Index");
                }
                if (nbrRes < nbrMax )
                {
                    db.Reservations.Add(reservation);
                    db.SaveChanges();
                    
                    return RedirectToAction("Index");
                }
                
                else
                {
                    return RedirectToAction("Index");
                }
                
            }
            
            ViewBag.ClassID = new SelectList(db.ClassInfoes, "ClassID", "ClassName", reservation.ClassID);
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            return View(reservation);
        }
        [Authorize(Roles = "Admin, Employee, Owner")]
        // GET: Reservations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            ViewBag.ClassID = new SelectList(db.ClassInfoes, "ClassID", "ClassName", reservation.ClassID);
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            return View(reservation);
        }

        // POST: Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReservationID,OwnerAssetID,LocationID,ClassID")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ClassID = new SelectList(db.ClassInfoes, "ClassID", "ClassName", reservation.ClassID);
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            return View(reservation);
        }
        [Authorize(Roles = "Admin, Employee, Owner")]
        // GET: Reservations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // POST: Reservations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservation reservation = db.Reservations.Find(id);
            db.Reservations.Remove(reservation);
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
