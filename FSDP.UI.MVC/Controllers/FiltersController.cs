using FSDP.DATA.EF;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace FSDP.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        FSDPEntities db = new FSDPEntities();
        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ReservationSearch(string searchFilter)
        {
            if (String.IsNullOrEmpty(searchFilter))
            {
                return View(db.Reservations.ToList());
            }
            else
            {
                List<Reservation> searchResult = db.Reservations.Where(r => r.OwnerAsset.UserDetail.FirstName.ToLower().Contains(searchFilter.ToLower()) || r.OwnerAsset.AssetName.ToLower().Contains(searchFilter.ToLower())).ToList();
                return View(searchResult);
            }
        }
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
            return RedirectToAction("ReservationSearch");
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
                return RedirectToAction("ReservationSearch");
            }
            ViewBag.ClassID = new SelectList(db.ClassInfoes, "ClassID", "ClassName", reservation.ClassID);
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            return View(reservation);
        }

    }
}