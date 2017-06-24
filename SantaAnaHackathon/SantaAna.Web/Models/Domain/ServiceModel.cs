using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Models.Domain
{
    public class ServiceModel
    {
        public string PostedBy { get; set; }

        public string description { get; set; }

        public string name { get; set; }

        public string email { get; set; }

        public string phone { get; set; }

        public string website { get; set; }

        public string monday { get; set; }

        public string tuesday { get; set; }

        public string wednesday { get; set; }

        public string thursday { get; set; }

        public string friday { get; set; }

        public string saturday { get; set; }

        public string sunday { get; set; }

        public string addressline1 { get; set; }

        public string addressline2 { get; set; }

        public string city { get; set; }

        public string state { get; set; }

        public string zip { get; set; }
    }
}