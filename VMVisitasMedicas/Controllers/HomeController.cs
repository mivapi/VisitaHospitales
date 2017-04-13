using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VMVisitasMedicas.Models;

namespace VMVisitasMedicas.Controllers
{
    public class HomeController : Controller
    {
        bd_VMVisitasMedicasEntities4 entidad = new bd_VMVisitasMedicasEntities4();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string nick, string password)
        {
            //ViewBag.Message = id;
            nick = "jaraiza";
            password = "123456";
            var x = from y in entidad.Usuario
                    where y.nickname == nick.ToString()
                    where y.password == password
                    select y;
            int id_entra = 19;
            /*if (x.Count() != 0)
            {*/

            Session["usu_id"] = 19;
            
            if (Convert.ToInt32(Session["usu_id"]) == 19)
            {
                Session["admin"] = 1;
            }
            

            return RedirectToAction("Index/" +id_entra, "MantenimientoUsuario");
            //return RedirectToAction("Index", "MantenimientoUsuario");
                //return View(x.ToList());
            /*}
            else
            {
                return RedirectToAction("Login", "Home");
            }*/
        }

    }
}