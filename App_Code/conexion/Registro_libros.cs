using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
/// <summary>
/// Descripción breve de Registro_libros
/// </summary>
public class Registro_libros
{
	public Registro_libros()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public DataTable categoria()
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_consulta_categoria", conect);
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

    public DataTable genero()
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_consulta_genero", conect);
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
    public DataTable etiqueta()
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_consulta_etiqueta", conect);
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

    public DataTable autor()
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_consulta_autor", conect);
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
    public void rlibro(encap_libros datos)
    {
        MySqlConnection conect = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);



        try
        {
            conect.Open();
            MySqlCommand command = new MySqlCommand("SP_libros", conect);
            command.CommandType = CommandType.StoredProcedure;
            
            
            command.Parameters.Add("nom_lib", MySqlDbType.Text).Value = datos._nom;
            command.Parameters.Add("des_lib", MySqlDbType.Text).Value = datos._des;
            command.Parameters.Add("gen", MySqlDbType.Int16, 13).Value = datos._gen;
            command.Parameters.Add("can", MySqlDbType.Int16, 13).Value = datos._can;
            command.Parameters.Add("cate", MySqlDbType.Int16, 13).Value = datos._cate;
            command.Parameters.Add("ur", MySqlDbType.Text).Value = datos._url;
            command.Parameters.Add("eti", MySqlDbType.Int16, 13).Value = datos._eti;
            command.Parameters.Add("ip_usu", MySqlDbType.VarChar,100).Value = datos._ip;
            command.Parameters.Add("mac_usu", MySqlDbType.VarChar,100).Value = datos._mac;
            command.Parameters.Add("aut1", MySqlDbType.Int16, 13).Value = datos._aut1;
            command.Parameters.Add("aut2", MySqlDbType.Int16, 13).Value = datos._aut2;
         
           
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