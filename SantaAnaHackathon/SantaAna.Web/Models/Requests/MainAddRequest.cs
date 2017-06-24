using SantaAna.Web.Models.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Models.Domain
{
    public class MainAddRequest
    {

        public string PostedBy { get; set; }

        public ContactAddRequest ContactInfo { get; set; }

        public AddressAddRequest AddressInfo { get; set; }

        public OperationTimeAddRequest OperationTime { get; set; }

        public string Description { get; set; }

        public List<Tag> Tags { get; set; }


    }
}