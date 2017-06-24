﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace C30_PersonalProject.Web.Models.Responses
{
    public abstract class BaseResponse
    {
        public bool IsSuccessful { get; set; }

        public string TransactionId { get; set; }

        public BaseResponse()
        {
            this.TransactionId = Guid.NewGuid().ToString();
        }
    }
}