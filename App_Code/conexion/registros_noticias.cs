using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Descripción breve de registros_noticias
/// </summary>
public class registros_noticias
{
	public registros_noticias()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public void rnoticias(encap_notificaciones datos)
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);



        try
        {
            conect.Open();
            MySqlCommand command = new MySqlCommand("SP_libros", conect);
            command.CommandType = CommandType.StoredProcedure;


           
            command.Parameters.Add("ur", MySqlDbType.Text).Value = datos._url;
            

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