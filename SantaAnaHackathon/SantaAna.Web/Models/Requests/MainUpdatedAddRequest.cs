using SantaAna.Web.Models.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Models.Requests
{
    public class MainUpdatedAddRequest
    {
        public string Name { get; set; }

        public string PostedBy { get; set; }

        public int contactId { get; set; }

        public int addressId { get; set; }

        public int hoursId { get; set; }

        public string Description { get; set; }

        public List<Tag> Tags { get; set; }
    }
}