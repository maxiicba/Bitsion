using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class Clientes
    {
        public int IdCliente { get; set; }
        public string Nombre { get; set; }
        public int Identificacion { get; set; }
        public int Edad { get; set; }
        public bool Genero { get; set; }
        public bool Estado { get; set; }
        public string oAtributos { get; set; }
        public string InfoAdicional { get; set; }

    }
}
