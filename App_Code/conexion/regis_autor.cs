using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// Descripción breve de regis_autor
/// </summary>
public class regis_autor
{
	public regis_autor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public void rautor(encap_autor datos)
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);



        try
        {
            conect.Open();
            MySqlCommand command = new MySqlCommand("SP_autor", conect);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("nom", MySqlDbType.VarChar, 30).Value = datos._nom;
            command.Parameters.Add("res", MySqlDbType.VarChar, 30).Value = datos._res;
            command.Parameters.Add("fec", MySqlDbType.Date).Value = datos._fec;
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