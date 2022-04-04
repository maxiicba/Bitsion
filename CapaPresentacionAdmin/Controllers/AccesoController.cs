using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CapaEntidad;
using CapaNegocio;
using System.Web.Security;

namespace CapaPresentacionAdmin.Controllers
{
    public class AccesoController : Controller
    {
        //Modulo de vistas
        #region vistas
        public ActionResult Index()
        {
            return View();
        }
        #endregion

        //Modulo de Post
        #region vistas
        [HttpPost]
        public ActionResult Index(string correo, string clave)
        {
            Usuarios oUsuario = new Usuarios();

            //Obtener datos de la tabla Usuarios y buscar si coincide el correo y la contraseña
            oUsuario = new CA_Usuarios().Listar().Where(u => u.Correo == correo && u.Clave == clave).FirstOrDefault();

            //Si no obtiene resultado
            if (oUsuario == null)
            {
                ViewBag.Error = "Correo o contraseña no correcta";
                return View();
            }
            else //Si trae resultado
            {
                ViewBag.Error = null;
                TempData["idUsuario"] = oUsuario.IdUsuario;
                FormsAuthentication.SetAuthCookie(oUsuario.Correo,false); //Se autentica por correo
                return RedirectToAction("Index", "Home");
            }
        }

        public ActionResult CerrarSesion()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Acceso");
        }
        #endregion

    }
}