using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Descripción breve de consulta_usuario_modificar
/// </summary>
public class consulta_usuario_modificar
{
	public consulta_usuario_modificar()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public DataTable consul_usua()
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_usuario", conect);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conect.Open();
            dataAdapter.Fill(dataTable);
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (conect != null)
            {
                conect.Close();
            }
        }
        return dataTable;
    }
    public void elimi_usu(int id_usuario)
    {

        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);

        try
        {

            conect.Open();
            MySqlCommand dataAdapter = new MySqlCommand("SP_eliminar_usu", conect);
            dataAdapter.CommandType = CommandType.StoredProcedure;

            dataAdapter.Parameters.Add("id", MySqlDbType.Int32, 3).Value = id_usuario;


            dataAdapter.ExecuteNonQuery();


            dataAdapter.ExecuteNonQuery();

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conect != null)
            {
                conect.Close();
            }
        }

    }
}