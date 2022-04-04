using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CapaEntidad;
using CapaNegocio;
using Newtonsoft.Json;

namespace CapaPresentacionAdmin.Controllers
{
    [Authorize]
    public class MantenedorController : Controller
    {
        // GET: Mantenedor
        public ActionResult Atributos()
        {
            return View();
        }

        // ++++++++++++++++++++++ Atributos ++++++++++++++++++++++
        #region LISTAR ATRIBUTO
        [HttpGet]
        public JsonResult ListarAtributos()
        {
            List<Atributos> oLista = new List<Atributos>();

            oLista = new CA_Atributos().Listar();

            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region GUARDAR ATRIBUTO
        [HttpPost]
        public JsonResult GuardarAtributos(Atributos objeto)
        {
            object resultado;
            string mensaje = string.Empty;

            if (objeto.IdAtributo == 0)
            {
                resultado = new CA_Atributos().Registrar(objeto, out mensaje);
            }
            else
            {
                resultado = new CA_Atributos().Editar(objeto, out mensaje);
            }
            return Json(new { resultado = resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region ELIMINAR ATRIBUTO
        [HttpPost]
        public JsonResult EliminarAtributos(int id)
        {
            bool respuesta = false;
            string mensaje = string.Empty;

            respuesta = new CA_Atributos().Eliminar(id, out mensaje);

            return Json(new { resultado = respuesta, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }
        #endregion

    }
}