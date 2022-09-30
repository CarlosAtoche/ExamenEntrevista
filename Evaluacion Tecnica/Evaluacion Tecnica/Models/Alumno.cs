using System;
using System.Collections.Generic;

namespace Evaluacion_Tecnica.Models
{
    public partial class Alumno
    {
        public Alumno()
        {
            Solicituds = new HashSet<Solicitud>();
        }

        public int IdAlumno { get; set; }
        public string Nombres { get; set; } = null!;
        public string Apellidos { get; set; } = null!;

        public virtual ICollection<Solicitud> Solicituds { get; set; }
    }
}
