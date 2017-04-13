using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VMVisitasMedicas.Models
{

    public class user
    {
        
        public int Id { get; set; }

        public string nickname { get; set; }

        public string password { get; set; }

    }

    public class ElUsuario
    {
        public int usu_id { get; set; }
        public string usu_nombre { get; set; }
        public string usu_apellidoPaterno { get; set; }
        public string usu_apellidoMaterno { get; set; }
        public int usu_edad { get; set; }
        public string usu_telefono { get; set; }
        public int sex_id { get; set; }
        public int est_id { get; set; }
        public DateTime usu_fecha_alta { get; set; }
        public DateTime usu_fecha_baja { get; set; }
        public bool usu_admin { get; set; }
        public string password { get; set; }
    }

    public class Resultado
    {
        public string Fecha { get; set; }
        public string Doctor { get; set; }
        public string Especialidad { get; set; }
    }

}