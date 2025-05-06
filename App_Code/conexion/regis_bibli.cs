using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;


/// <summary>
/// Descripción breve de regis_bibli
/// </summary>
public class regis_bibli
{
    public regis_bibli()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public void regis(enca_regis_bibli datos)
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);



        try
        {
            conect.Open();
            MySqlCommand command = new MySqlCommand("SP_registro", conect);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("nom", MySqlDbType.VarChar, 30).Value = datos._nom;
            command.Parameters.Add("ape", MySqlDbType.VarChar, 30).Value = datos._ape;
            command.Parameters.Add("ced", MySqlDbType.Int16, 13).Value = datos._ced;
            command.Parameters.Add("dir", MySqlDbType.Text).Value = datos._dir;
            command.Parameters.Add("tel", MySqlDbType.Text).Value = datos._tel;
            command.Parameters.Add("fec", MySqlDbType.Date).Value = datos._fec;
            command.Parameters.Add("cor", MySqlDbType.Text).Value = datos._cor;
            command.Parameters.Add("id_r", MySqlDbType.Int16, 3).Value = "2";
            command.Parameters.Add("cla", MySqlDbType.VarChar, 30).Value = datos._cla;
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