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

namespace SantaAna.Web.api.Controllers
{
    [RoutePrefix("api/Main")]
    public class MainApiController : ApiController
    {
        [Route(""), HttpPost]
        public HttpResponseMessage ServiceInsert(MainAddRequest payload)
        {
            SuccessResponse response = new SuccessResponse();

            // Instantiate MainPayload
            MainUpdatedAddRequest mainPayload = new MainUpdatedAddRequest();

            mainPayload.Name = payload.Name;
            mainPayload.PostedBy = payload.PostedBy;
            mainPayload.Description = payload.Description;
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

        [Route("{id}"), HttpGet]
        public HttpResponseMessage ServiceGetById(int id)
        {
            ItemResponse<ServiceModel> response = new ItemResponse<ServiceModel>();

            response.item = MainService.ServiceSelectById(id);

            return Request.CreateResponse(response);
        }

        [Route(""), HttpGet]
        public HttpResponseMessage ServiceGetAll()
        {
            ItemsResponse<Service> response = new ItemsResponse<Service>();
            response.Items = MainService.GetServiceAll();
            return Request.CreateResponse(response);
        }

        [Route("tags"), HttpGet]
        public HttpResponseMessage GetAllTags()
        {
            ItemsResponse<Tag> response = new ItemsResponse<Tag>();
            response.Items = MainService.GetTags();
            return Request.CreateResponse(response);
        }

        [Route("ServiceByTag"), HttpPost]
        public HttpResponseMessage ServiceGetByTag(List<TagFix> tags)
        {
            ItemsResponse<ServiceFix> response = new ItemsResponse<ServiceFix>();

            // Main service to get Service By tags
            response.Items = MainService.GetServiceByTags(tags);

            return Request.CreateResponse(response);
        }
    }
}
