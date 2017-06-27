using SantaAna.Web.Models.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Models.Requests
{
    public class ServiceByTagsRequest
    {
        public List<TagFix> tags { get; set; }
    }
}