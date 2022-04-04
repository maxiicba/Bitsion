using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using System.Data.SqlClient;
using System.Data;

namespace CapaDatos
{
    public class CD_Dashboard
    {
        public DashBoard VerDashBoard()
        {
            DashBoard objeto = new DashBoard();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {

                    SqlCommand cmd = new SqlCommand("sp_ReporteDashboard", oconexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    oconexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read()) //mientras lee hace esto:
                        {
                            objeto = new DashBoard()
                            {
                                TotalClientes = Convert.ToInt32(dr["TotalClientes"]),
                                TotalAtributos = Convert.ToInt32(dr["TotalAtributos"]),
                            };
                        }
                    }
                }
            }
            catch //(Exception ex) PARA VER ERRORES
            {
                objeto = new DashBoard();
            }
            return objeto;
        }
    }
}
