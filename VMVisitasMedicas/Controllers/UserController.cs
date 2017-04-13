using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VMVisitasMedicas.Models;

namespace VMVisitasMedicas.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        bd_VMVisitasMedicasEntities4 entidad = new bd_VMVisitasMedicasEntities4();

        public ActionResult Index()
        {
            var listaUsuario = entidad.Usuario;

            return View(listaUsuario.ToList());
        }

        public ActionResult ListadoMuestraUsuarios()
        {
            var listaUsuario = entidad.Usuario;
            return View(listaUsuario.ToList());
        }
        /*public ActionResult UsuarioXConsulta(int usu_id)
        {
            var modelo = from p in entidad.Usuario
                         where p.usu_id == usu_id
                         select p;
            return (modelo.ToList());
        }*/
    }
}