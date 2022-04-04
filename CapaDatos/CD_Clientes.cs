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
    public class CD_Clientes
    {
        
        public List<Clientes> Listar()
        {
            List<Clientes> lista = new List<Clientes>();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {
                    StringBuilder sb = new StringBuilder();
                    sb.AppendLine("select IdCliente, Nombre, Identificacion, Edad, Genero, Estado, Atributos, InfoAdicional");
                    sb.AppendLine("from CLIENTES ");
                    SqlCommand cmd = new SqlCommand(sb.ToString(), oconexion);
                    cmd.CommandType = CommandType.Text;

                    oconexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read()) //mientras lee hace esto:
                        {
                            lista.Add(
                                new Clientes()
                                {
                                    IdCliente = Convert.ToInt32(dr["IdCliente"]),
                                    Nombre = dr["Nombre"].ToString(),
                                    Identificacion = Convert.ToInt32(dr["Identificacion"]),
                                    Edad = Convert.ToInt32(dr["Edad"]),
                                    Genero = Convert.ToBoolean(dr["Genero"]),
                                    Estado = Convert.ToBoolean(dr["Estado"]),
                                    oAtributos = dr["Atributos"].ToString(),
                                    InfoAdicional = dr["InfoAdicional"].ToString()
                                }
                                );
                        }
                    }
                }
            }
            catch (Exception ex) 
            {
                string mensaje = ex.ToString();
                lista = new List<Clientes>();
            }
            return lista;
        }
        public int Registrar(Clientes obj, out string Mensaje)
        {
            int idautogenerado = 0;
            Mensaje = string.Empty;
            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("sp_RegistrarCliente", oconexion);
                    cmd.Parameters.AddWithValue("Nombre", obj.Nombre);
                    cmd.Parameters.AddWithValue("Identificacion", obj.Identificacion);
                    cmd.Parameters.AddWithValue("Edad", obj.Edad);
                    cmd.Parameters.AddWithValue("Genero", obj.Genero);
                    cmd.Parameters.AddWithValue("Estado", obj.Estado);
                    cmd.Parameters.AddWithValue("Atributos", obj.oAtributos);
                    cmd.Parameters.AddWithValue("InfoAdicional", obj.InfoAdicional);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oconexion.Open();

                    cmd.ExecuteNonQuery();

                    idautogenerado = Convert.ToInt32(cmd.Parameters["Resultado"].Value);
                    Mensaje = cmd.Parameters["Mensaje"].Value.ToString();

                }
            }
            catch (Exception ex)
            {
                idautogenerado = 0;
                Mensaje = ex.Message;
            }
            return idautogenerado;
        }


        public bool Editar(Clientes obj, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;
            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("sp_EditarCliente", oconexion);
                    cmd.Parameters.AddWithValue("IdCliente", obj.IdCliente);
                    cmd.Parameters.AddWithValue("Nombre", obj.Nombre);
                    cmd.Parameters.AddWithValue("Identificacion", obj.Identificacion);
                    cmd.Parameters.AddWithValue("Edad", obj.Edad);
                    cmd.Parameters.AddWithValue("Genero", obj.Genero);
                    cmd.Parameters.AddWithValue("Estado", obj.Estado);
                    cmd.Parameters.AddWithValue("Atributos", obj.oAtributos);
                    cmd.Parameters.AddWithValue("InfoAdicional", obj.InfoAdicional);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oconexion.Open();

                    cmd.ExecuteNonQuery();

                    resultado = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
                    Mensaje = cmd.Parameters["Mensaje"].Value.ToString();

                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }
            return resultado;
        }

        public bool Eliminar(int id, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;
            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("sp_EliminarCliente", oconexion);
                    cmd.Parameters.AddWithValue("IdCliente", id);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oconexion.Open();

                    cmd.ExecuteNonQuery();

                    resultado = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
                    Mensaje = cmd.Parameters["Mensaje"].Value.ToString();

                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }
            return resultado;
        }
    }
}
