using System;
using System.Collections.Generic;

namespace Evaluacion_Tecnica.Models
{
    public partial class DetalleSolicitud
    {
        public int IdDetalleSol { get; set; }
        public int IdSolicitud { get; set; }
        public int IdCurso { get; set; }
        public string Profesor { get; set; } = null!;
        public string Aula { get; set; } = null!;
        public string Sede { get; set; } = null!;
        public string? Observacion { get; set; }

        public virtual Curso IdCursoNavigation { get; set; } = null!;
        public virtual Solicitud IdSolicitudNavigation { get; set; } = null!;
    }
}
