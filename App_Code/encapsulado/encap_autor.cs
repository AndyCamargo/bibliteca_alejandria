using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de encap_autor
/// </summary>
public class encap_autor
{
	public encap_autor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    private String nom;

    public String _nom
    {
        get { return nom; }
        set { nom = value; }
    }

    private String res;

    public String _res
    {
        get { return res; }
        set { res = value; }
    }

    private String fec;

    public String _fec
    {
        get { return fec; }
        set { fec = value; }
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


    public encap_autor(string nombre, string reseña, string fecha, string clientIp, string clientmac)
    {
        // TODO: Complete member initialization
        this._nom = nombre;
        this._res = reseña;
        this._fec = fecha;
        this._ip = clientIp;
        this._mac = clientmac;
    }


}