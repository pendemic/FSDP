using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FSDP.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage ="Please Enter a Name")]
        public string Name { get; set; }
        [DataType(DataType.EmailAddress)]
        [Required(ErrorMessage = "Please Enter a Email")]
        public string Email { get; set; }
        public string Subject { get; set; }
        [Required(ErrorMessage = "Please Enter a Message")]
        [UIHint("MultilineText")]
        public string Message { get; set; }
    }
}