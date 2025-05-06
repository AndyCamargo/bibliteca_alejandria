using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de encap_genero
/// </summary>
public class encap_genero
{
	public encap_genero()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private String gen;

    public String _gen
    {
        get { return gen; }
        set { gen = value; }
    }

    private String des;

    public String _des
    {
        get { return des; }
        set { des = value; }
    }

     private String ip;

    public String _ip
    {
        get { return ip; }
        set { ip = value; }
    }
    private String mac;

    public String _mac
    {
        get { return mac; }
        set { mac = value; }
    }


    public encap_genero(string genero, string descripcion, string clientIp, string clientmac)
    {
        // TODO: Complete member initialization
        this._gen = genero;
        this._des = descripcion;
        this._ip = clientIp;
        this._mac = clientmac;
    }
}