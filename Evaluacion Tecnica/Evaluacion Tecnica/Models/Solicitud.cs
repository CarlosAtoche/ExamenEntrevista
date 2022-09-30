using System;
using System.Collections.Generic;

namespace Evaluacion_Tecnica.Models
{
    public partial class Solicitud
    {
        public Solicitud()
        {
            DetalleSolicituds = new HashSet<DetalleSolicitud>();
        }

        public int IdSolicitud { get; set; }
        public int IdAlumno { get; set; }
        public DateTime FechaSolicitud { get; set; }
        public int CodRegistrante { get; set; }
        public string Carrera { get; set; } = null!;
        public string Periodo { get; set; } = null!;

        public virtual Alumno IdAlumnoNavigation { get; set; } = null!;
        public virtual ICollection<DetalleSolicitud> DetalleSolicituds { get; set; }
    }
}
