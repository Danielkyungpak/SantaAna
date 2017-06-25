using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Models.Requests
{
    public class ContactAddRequest
    {
        public string Email { get; set; }

        public string Phone { get; set; }

        public string Website { get; set; }
    }
}