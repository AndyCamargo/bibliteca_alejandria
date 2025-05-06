using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// Descripción breve de generos
/// </summary>
public class generos
{
	public generos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public void gene(encap_genero datos)
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);



        try
        {
            conect.Open();
            MySqlCommand command = new MySqlCommand("SP_genero", conect);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("gen", MySqlDbType.VarChar, 30).Value = datos._gen;
            command.Parameters.Add("des", MySqlDbType.VarChar, 30).Value = datos._des;
            command.Parameters.Add("ip_usu", MySqlDbType.VarChar, 100).Value = datos._ip;
            command.Parameters.Add("mac_usu", MySqlDbType.VarChar, 100).Value = datos._mac;


            command.ExecuteNonQuery();
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

    }
}