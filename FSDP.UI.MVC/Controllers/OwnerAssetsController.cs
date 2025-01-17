﻿using System;
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
    public class OwnerAssetsController : Controller
    {
        private FSDPEntities db = new FSDPEntities();

        // GET: OwnerAssets
        [Authorize(Roles = "Admin, Owner, Employee")]
        public ActionResult Index()
        {
            string user = User.Identity.GetUserId();
            var asset = db.OwnerAssets.Where(a => a.OwnerID == user).Include(r => r.Reservations);
            
            return View(asset.ToList());
        }
        public ActionResult Members()
        {
            return View(db.OwnerAssets.ToList());
        }
        [Authorize(Roles = "Admin, Owner, Employee")]
        // GET: OwnerAssets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAsset ownerAsset = db.OwnerAssets.Find(id);
            if (ownerAsset == null)
            {
                return HttpNotFound();
            }
            return View(ownerAsset);
        }
        [Authorize(Roles = "Admin, Owner")]
        // GET: OwnerAssets/Create
        public ActionResult Create()
        {
            ViewBag.LevelID = new SelectList(db.Levels, "LevelID", "LevelName");
            ViewBag.OwnerID = new SelectList(db.UserDetails, "UserID", "FirstName");
            return View();
        }

        // POST: OwnerAssets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OwnerAssetID,AssetName,OwnerID,AssetPhoto,LevelID,SpecialNotes,IsActive,DateAdded")] OwnerAsset ownerAsset, HttpPostedFileBase assetPhoto)
        {
            if (ModelState.IsValid)
            {
                string imgName = "NoImage.png";
                if (assetPhoto != null)
                {
                    imgName = assetPhoto.FileName;
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    if (goodExts.Contains(ext.ToLower()) && (assetPhoto.ContentLength <= 4194304))
                    {
                        imgName = Guid.NewGuid() + ext;
                        assetPhoto.SaveAs(Server.MapPath("~/Content/img/" + imgName));
                    }
                    else
                    {
                        imgName = "NoImage.png";
                    }
                }
                ownerAsset.AssetPhoto = imgName;
                ownerAsset.DateAdded = DateTime.Now;
                ownerAsset.OwnerID = User.Identity.GetUserId();
                db.OwnerAssets.Add(ownerAsset);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LevelID = new SelectList(db.Levels, "LevelID", "LevelName", ownerAsset.LevelID);
            ViewBag.OwnerID = new SelectList(db.UserDetails, "UserID", "FirstName", ownerAsset.OwnerID);
            return View(ownerAsset);
        }
        [Authorize(Roles = "Admin, Owner")]
        // GET: OwnerAssets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAsset ownerAsset = db.OwnerAssets.Find(id);
            if (ownerAsset == null)
            {
                return HttpNotFound();
            }
            ViewBag.LevelID = new SelectList(db.Levels, "LevelID", "LevelName", ownerAsset.LevelID);
            ViewBag.OwnerID = new SelectList(db.UserDetails, "UserID", "FirstName", ownerAsset.OwnerID);
            return View(ownerAsset);
        }

        // POST: OwnerAssets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OwnerAssetID,AssetName,OwnerID,AssetPhoto,LevelID,SpecialNotes,IsActive,DateAdded")] OwnerAsset ownerAsset, HttpPostedFileBase assetPhoto)
        {
            if (ModelState.IsValid)
            {
                if (assetPhoto != null)
                {
                    string imgName = assetPhoto.FileName;
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    if (goodExts.Contains(ext.ToLower()) && (assetPhoto.ContentLength <= 4194304))
                    {
                        imgName = Guid.NewGuid() + ext;
                        assetPhoto.SaveAs(Server.MapPath("~/Content/img/" + imgName));
                        if (ownerAsset.AssetPhoto != null && ownerAsset.AssetPhoto != "NoImage.png")
                        {
                            System.IO.File.Delete(Server.MapPath("~/Content/Images/" + Session["currentImage"].ToString()));
                        }
                        ownerAsset.AssetPhoto = imgName;
                    }
                }
                db.Entry(ownerAsset).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LevelID = new SelectList(db.Levels, "LevelID", "LevelName", ownerAsset.LevelID);
            ViewBag.OwnerID = new SelectList(db.UserDetails, "UserID", "FirstName", ownerAsset.OwnerID);
            return View(ownerAsset);
        }
        [Authorize(Roles = "Admin, Owner")]
        // GET: OwnerAssets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAsset ownerAsset = db.OwnerAssets.Find(id);
            if (ownerAsset == null)
            {
                return HttpNotFound();
            }
            return View(ownerAsset);
        }

        // POST: OwnerAssets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OwnerAsset ownerAsset = db.OwnerAssets.Find(id);
            //if (ownerAsset.AssetPhoto != null && ownerAsset.AssetPhoto != "NoImage.png")
            //{
            //    System.IO.File.Delete(Server.MapPath("~/Content/Images/" + Session["currentImage"].ToString()));
            //}
            db.OwnerAssets.Remove(ownerAsset);
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
