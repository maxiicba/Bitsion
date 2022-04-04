using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacionAdmin.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        // Todas las vistas
        #region VISTAS
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Clientes()
        {
            return View();
        }
        #endregion

        // Modulo Clientes
        #region CLIENTES
        [HttpGet]
        public JsonResult ListarClientes()
            {
            List<Clientes> oLista = new List<Clientes>();

            oLista = new CA_Clientes().Listar();

            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarCliente(Clientes objeto)
        {
            object resultado;
            string mensaje = string.Empty;
            if (objeto.IdCliente == 0)
            {
                resultado = new CA_Clientes().Registrar(objeto, out mensaje);
            }
            else
            {
                resultado = new CA_Clientes().Editar(objeto, out mensaje);
            }
            return Json(new { resultado = resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarCliente(int id)
        {
            bool respuesta = false;
            string mensaje = string.Empty;

            respuesta = new CA_Clientes().Eliminar(id, out mensaje);

            return Json(new { resultado = respuesta, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }
        #endregion

        // Atributos y Dashboard
        #region Atributos y Dashboard
        [HttpPost]
        public JsonResult ListarAtri(int id)
        {
            string oLista = string.Empty;

            oLista = new CA_Atributos().ListarAtri(id); //Traer atributos por ID para luego descomponer el JSON

            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult VistaDashboard()
        {
            DashBoard objeto = new CA_Dashboard().VerDashBoard();
            return Json(new { resultado = objeto }, JsonRequestBehavior.AllowGet);
        }
        #endregion

    }
}