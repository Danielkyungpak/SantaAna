using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C30_PersonalProject.Web.Models.Responses
{
    public class ItemResponse<T> : SuccessResponse
    {
        public T item { get; set; }
    }
}