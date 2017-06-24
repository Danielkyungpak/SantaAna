using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Models.Domain
{
    public class Contact
    {
        public int ID { get; set; }

        public string Email { get; set; }

        public int Phone { get; set; }

        public string Website { get; set; }

    }
}