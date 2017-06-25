using SantaAna.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SantaAna.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [Route("about/{id}")]
        public ActionResult About(int id)
        {
            ItemViewModel<int> model = new ItemViewModel<int>();
            model.Item = id;
            return View(model);

        }
        public ActionResult Manage()
        {
            return View();
        }
    }
}
