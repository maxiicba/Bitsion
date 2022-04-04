using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CA_Dashboard
    {
        private CD_Dashboard objCapaDatos = new CD_Dashboard();
        public DashBoard VerDashBoard()
        {
            return objCapaDatos.VerDashBoard();
        }
    }
}
