using C30_PersonalProject.Web.Models.Responses;
using SantaAna.Web.Models.Domain;
using SantaAna.Web.Models.Requests;
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

            // Instantiate MainPayload
            MainUpdatedAddRequest mainPayload = new MainUpdatedAddRequest();

            // Insert Contact Here, Return ContactId
            mainPayload.contactId = ContactService.ContactInsert(payload.ContactInfo);

            // Insert Address Here, Return AddressId
            mainPayload.addressId = AddressService.AddressInsert(payload.AddressInfo);

            // Insert Hours Here, Return HoursId
            mainPayload.hoursId = OperationTimeService.OperationTimeInsert(payload.OperationTime);

            // Insert Tags Here
            mainPayload.Tags = payload.Tags;

            // Insert Service Here, Return SuccessResponse
            MainService.MainInsert(mainPayload);

            return Request.CreateResponse(response);
        }
    }
}
