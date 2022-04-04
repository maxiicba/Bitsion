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
    public class CD_Usuarios
    {
        public List<Usuarios> Listar()
        {
            List<Usuarios> lista = new List<Usuarios>();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {

                    StringBuilder sb = new StringBuilder();
                    sb.AppendLine("select IdUsuario, Correo, Clave");
                    sb.AppendLine("from Usuarios ");
                    SqlCommand cmd = new SqlCommand(sb.ToString(), oconexion);
                    cmd.CommandType = CommandType.Text;

                    oconexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read()) //mientras lee hace esto:
                        {
                            lista.Add(
                                new Usuarios()
                                {
                                    IdUsuario = Convert.ToInt32(dr["IdUsuario"]),
                                    Correo = dr["Correo"].ToString(),
                                     Clave = dr["Clave"].ToString()
                                }
                                );
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string mensaje = ex.ToString();
                lista = new List<Usuarios>();
            }
            return lista;
        }
    }
}
