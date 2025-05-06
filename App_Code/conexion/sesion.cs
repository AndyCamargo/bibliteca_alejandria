using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Descripción breve de sesion
/// </summary>
public class sesion
{
    public sesion()
    {
    }
    public DataTable loggin(encapsular datos)
    {
        DataTable loginuser = new DataTable();
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);

        try
        {
            /*cadena conexion para stored procedure*/
            MySqlDataAdapter adapter = new MySqlDataAdapter("SP_login", conect);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand.Parameters.Add("nom", MySqlDbType.Text).Value = datos._user;
            adapter.SelectCommand.Parameters.Add("cla", MySqlDbType.Text).Value = datos._clave;

            conect.Open();
            adapter.Fill(loginuser);
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
        return loginuser;
    }
}