using System;
using System.Collections.Generic;

namespace Evaluacion_Tecnica.Models
{
    public partial class Curso
    {
        public Curso()
        {
            DetalleSolicituds = new HashSet<DetalleSolicitud>();
        }

        public int IdCurso { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Descripcion { get; set; }
        public int NroCreditos { get; set; }
        public bool Activo { get; set; }

        public virtual ICollection<DetalleSolicitud> DetalleSolicituds { get; set; }
    }
}
