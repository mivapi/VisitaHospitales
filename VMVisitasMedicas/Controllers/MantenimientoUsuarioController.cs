using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VMVisitasMedicas.Models;
using System.Data;

namespace VMVisitasMedicas.Controllers
{
    public class MantenimientoUsuarioController : Controller
    {
        // GET: MantenimientoUsuario
        bd_VMVisitasMedicasEntities4 entidad = new bd_VMVisitasMedicasEntities4();

        public ActionResult Index(int id)
        {
            if (Session["usu_id"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {

                ViewBag.Message = Session["usu_id"];
                var x = from y in entidad.Usuario
                        where y.usu_id == id
                        //where y.password == password
                        select y;
                return View(x.ToList());

            }
            
        }

        public ActionResult InicioXUsuario(int id, string password)
        {
            ViewBag.Message = id;
            /*var x = from y in entidad.Usuario
                    where y.usu_id == id
                    where y.password == password
                    select y;
            if (x.Count() != 0)
            {
                return View(x.ToList());
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }*/
            return View(entidad.Usuario.ToList());
        }

        public ActionResult Dates(int id)
        {
            ViewBag.Message = id;
            var x = from y in entidad.Visita
                    where y.usu_id == id
                    select y;

            return View(x.ToList());
        }

        // GET: MantenimientoUsuario/Create
        public ActionResult DateCreate(int id)
        {
            ViewBag.MessageID = id.ToString();
            return View();
        }

        // POST: MantenimientoUsuario/Create
        [HttpPost]
        public ActionResult DateCreate(Visita insertaCita, int id)
        {
            ViewBag.MessageID = id.ToString();
            try
            {
                
                // TODO: Add insert logic here
                using (entidad)
                {
                    entidad.Visita.Add(insertaCita);
                    entidad.SaveChanges();
                }
                return RedirectToAction("Dates/"+ ViewBag.MessageID, "MantenimientoUsuario");
            }
            catch
            {
                return View();
            }
        }

        // GET: MantenimientoUsuario/Details/5
        public ActionResult Details(int id)
        {
            if (id != 0)
            {
                return View(entidad.Visita.Find(id));
            }
            else
            {
                return RedirectToAction("Details", "MantenimientoUsuario");
            }

        }

        // GET: MantenimientoUsuario/Create
        public ActionResult Create(int? value)
        {
            List<SelectListItem> items = new List<SelectListItem>();
            SelectListItem item1 = new SelectListItem() { Text = "Hombre", Value = "1", Selected = false };
            SelectListItem item2 = new SelectListItem() { Text = "Mujer", Value = "2", Selected = false };
            
            items.Add(item1);
            items.Add(item2);
            
            

            ViewBag.SexoItems = items;

            return View();
        }

        // POST: MantenimientoUsuario/Create
        [HttpPost]
        public ActionResult Create(Usuario insertaUsuario, int? value)
        {
            try
            {
                // TODO: Add insert logic here
                using (entidad)
                {
                    entidad.Usuario.Add(insertaUsuario);
                    entidad.SaveChanges();
                   
                }
                return RedirectToAction("Login", "Home");
            }
            catch
            {
                return View();
            }
        }

        // GET: MantenimientoUsuario/Edit/5
        public ActionResult Edit(int id)
        {
            ViewBag.MessageID = id.ToString();
            return View(entidad.Usuario.Find(id));
        }

        // POST: MantenimientoUsuario/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Usuario modificaUsuario)
        {
            try
            {
                ViewBag.MessageID = id.ToString();
                // TODO: Add update logic here
                entidad.Entry(modificaUsuario).State = System.Data.Entity.EntityState.Modified;
                entidad.SaveChanges();

                return RedirectToAction("Index/"+ ViewBag.MessageID);
            }
            catch
            {
                return View();
            }
        }

        // GET: MantenimientoUsuario/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: MantenimientoUsuario/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Visita(int id)
        {
            return View(entidad.Visita.ToList());
        }
        public ActionResult HospitalConsulta(int id)
        {
            ViewBag.MessageID = id;
            return View(entidad.Hospital.ToList());
        }
        // GET: MantenimientoUsuario/Create
        public ActionResult AltaHospital(int id)
        {
            ViewBag.MessageID = id;
            return View();
        }
        // POST: MantenimientoUsuario/Edit/5
        [HttpPost]
        public ActionResult AltaHospital(int id, Hospital insertaHospital)
        {
            try
            {
                ViewBag.MessageID = id;
                // TODO: Add insert logic here
                using (entidad)
                {
                    entidad.Hospital.Add(insertaHospital);
                    entidad.SaveChanges();

                }
                return RedirectToAction("HospitalConsulta/"+ ViewBag.MessageID,"MantenimientoUsuario");
            }
            catch
            {
                return View();
            }
            
        }
        public ActionResult ConsultaMedico(int id)
        {
            ViewBag.MessageID = id;
            return View(entidad.Medico.ToList());
        }
        // GET: MantenimientoUsuario/Create
        public ActionResult MedicoRegistra(int id)
        {
            ViewBag.MessageID = id;
            return View();
        }
        // POST: MantenimientoUsuario/Edit/5
        [HttpPost]
        public ActionResult MedicoRegistra(int id, Medico insertaMedico)
        {
            try
            {
                ViewBag.MessageID = id;
                // TODO: Add insert logic here
                using (entidad)
                {
                    entidad.Medico.Add(insertaMedico);
                    entidad.SaveChanges();

                }
                return RedirectToAction("ConsultaMedico/" + ViewBag.MessageID, "MantenimientoUsuario");
            }
            catch
            {
                return View();
            }

        }
    }
}
