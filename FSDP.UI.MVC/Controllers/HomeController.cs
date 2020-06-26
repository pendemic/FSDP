using FSDP.UI.MVC.Models;
using System;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace FSDP.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpPost]
        public JsonResult ContactAjax(ContactViewModel cvm)
        {
            string message = $"You have received an email from {cvm.Name} with the subject - {cvm.Subject}. Please respond to {cvm.Email} with your response to the following message: <br><cite>{cvm.Message}</cite>";
            MailMessage msg = new MailMessage(
                "admin@mikeoskinner.com",
                "mikeokskinner@outlook.com",
                cvm.Subject,
                message
                );
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;
            msg.ReplyToList.Add(cvm.Email);
            SmtpClient client = new SmtpClient("mail.mikeoskinner.com");
            client.Credentials = new NetworkCredential("admin@mikeoskinner.com", "Skinner=1997");
            client.Port = 8889;
            try
            {
                client.Send(msg);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.StackTrace;
                throw;
            }
            return Json(cvm);
        }
    }
}
