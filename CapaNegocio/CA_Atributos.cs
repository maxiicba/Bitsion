using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CA_Atributos
    {
        //Llamar a capa datos
        private CD_Atributos objCapaDatos = new CD_Atributos();

        //Listar los atributos
        public List<Atributos> Listar()
        {
            return objCapaDatos.Listar();
        }

        //Registrar los atributos
        public int Registrar(Atributos obj, out string Mensaje)
        {
            Mensaje = String.Empty;
            //Comprobar
            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "La nombre del cliente no puede ser vacio";
            }

            if (string.IsNullOrEmpty(Mensaje))
            {
                return objCapaDatos.Registrar(obj, out Mensaje);

            }
            else
            {
                return 0;
            }
        }

        //Editar los atributos
        public bool Editar(Atributos obj, out string Mensaje)
        {
            Mensaje = String.Empty;
            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "La nombre del cliente no puede ser vacio";
            }
            if (string.IsNullOrEmpty(Mensaje))
            {
                return objCapaDatos.Editar(obj, out Mensaje);

            }
            else
            {
                return false;
            }
        }

        public bool Eliminar(int id, out string Mensaje)
        {
            return objCapaDatos.Eliminar(id, out Mensaje);
        }

        public string ListarAtri(int id)
        {
            return objCapaDatos.ListarAtri(id);
        }

    }
}
