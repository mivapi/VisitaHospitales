using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VMVisitasMedicas.Controllers
{
    public class AdministracionController : Controller
    {
        // GET: Administracion
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult HospitalConsulta()
        {
            //ViewBag.MessageID = id;
            return View();
        }
        public ActionResult AltaHospital(int id)
        {

            return View();
        }
    }
}