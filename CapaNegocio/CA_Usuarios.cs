using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CA_Usuarios
    {
        private CD_Usuarios objCapaDatos = new CD_Usuarios();
        public List<Usuarios> Listar()
        {
            return objCapaDatos.Listar();
        }
    }
}
