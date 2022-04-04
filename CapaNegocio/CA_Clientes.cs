using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CA_Clientes
    {
        private CD_Clientes objCapaDatos = new CD_Clientes();
        public List<Clientes> Listar()
        {
            return objCapaDatos.Listar();
        }

        public int Registrar(Clientes obj, out string Mensaje)
        {
            Mensaje = String.Empty;
            //Comprobar
            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "La nombre del cliente no puede ser vacio";
            }
            else if (obj.Identificacion <= 1)
            {
                Mensaje = "Debes colocar una identificacion";
            }
            else if (obj.Edad < 1)
            {
                Mensaje = "Debes colocar una edad";
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

        public bool Editar(Clientes obj, out string Mensaje)
        {
            Mensaje = String.Empty;
            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "La nombre del cliente no puede ser vacio";
            }
            else if (obj.Identificacion <= 1)
            {
                Mensaje = "Debes colocar una identificacion";
            }
            else if (obj.Edad < 1)
            {
                Mensaje = "Debes colocar una edad";
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
    }
}
