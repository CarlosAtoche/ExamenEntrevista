using Evaluacion_Tecnica.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Linq;

namespace Evaluacion_Tecnica.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            using (var db = new UniversidadContext())
            {

                var alumnos  = from alumno in db.Alumnos select alumno;
                var cursos = from curso in db.Cursos select curso;
                
                ViewBag.alumnos = alumnos.ToList();
                ViewBag.cursos = cursos.ToList();
                return View();
            }
        }

        [HttpPost]
        public IActionResult Store([FromBody] Solicitud data)
        {

            // return Json(data);
            
                // var solicitud = new Solicitud();
                // solicitud.Carrera = data["Carrera"];
                // solicitud.CodRegistrante = int.Parse( data["CodRegistrante"]);
                // solicitud.FechaSolicitud = DateTime.Parse(data["FechaSolicitud"]);
                // solicitud.IdAlumno = Int16.Parse(data["IdAlumno"]);
                // solicitud.Periodo = data["Periodo"];

                // var detalles = new List<DetalleSolicitud>();
                // foreach (var item in data["detalles"])
                // {
                //     var detalleS = new DetalleSolicitud();
                //     detalleS.Aula = item["Aula"];
                //     detalleS.IdCurso = item["IdCurso"];
                //     detalleS.Observacion = item["Observacion"];
                //     detalleS.Profesor = item["Profesor"];
                //     detalleS.Sede = item["Sede"];
                //     solicitud.DetalleSolicituds.Add(detalleS);
                // }


                 using(var db = new UniversidadContext()){
                     db.Solicituds.Add(data);
                     db.SaveChanges();
                 }

                return  Redirect("/Home/Index");
        }

        public IActionResult Lista(){
            using(var db = new UniversidadContext()){

                

            var query     = from solicitud in db.Solicituds
                join alumno in db.Alumnos on solicitud.IdAlumno equals alumno.IdAlumno
                join detalle in db.DetalleSolicituds on solicitud.IdSolicitud equals detalle.IdSolicitud
                //join curso in db.Cursos on g.First().IdCurso equals curso.IdCurso 
                select new {
                    solicitud = solicitud,
                    alumno = alumno,
                };
            ViewBag.solicitudes = query.ToList();
                return View();
            }
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}