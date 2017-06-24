using C30_PersonalProject.Web.Models.Responses;
using SantaAna.Web.Models.Domain;
using SantaAna.Web.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Routing;

namespace SantaAna.Web.Controllers
{
    [RoutePrefix("api/Main")]
    public class MainApiController : ApiController
    {
        [Route("")]
        public HttpResponseMessage ServiceInsert(MainAddRequest payload)
        {
            SuccessResponse response = new SuccessResponse();

            // Insert Contact Here, Return ContactId
            int contactId = ContactService.ContactInsert(payload.ContactInfo);

            // Insert Address Here, Return AddressId
            int addressId = AddressService.AddressInsert(payload.AddressInfo);

            // Insert Hours Here, Return HoursId

            // Insert Service Here, Return SuccessResponse

            return Request.CreateResponse(response);
        }
    }
}
