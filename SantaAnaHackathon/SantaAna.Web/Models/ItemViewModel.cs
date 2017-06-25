using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Models
{
    public class ItemViewModel<T>
    {
        public T Item { get; set; }
    }
}