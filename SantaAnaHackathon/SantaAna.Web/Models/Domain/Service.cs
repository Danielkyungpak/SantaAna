using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Models.Domain
{
    public class Service
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string PostedBy { get; set; }
        public int ContactId { get; set; }
        public int AddressId { get; set; }
        public int HoursId { get; set; }
        public string Description { get; set; }
        public List<Tag> Tags { get; set; }
    }
}