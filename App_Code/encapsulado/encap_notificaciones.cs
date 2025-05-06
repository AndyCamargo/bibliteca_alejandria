using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de encap_notificaciones
/// </summary>
public class encap_notificaciones
{
   

	public encap_notificaciones()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private string titu;

    public string _titu
    {
        get { return titu; }
        set { titu = value; }
    }
    private string descrip;

    public string _descrip
    {
        get { return descrip; }
        set { descrip = value; }
    }
    private string url;

    public string _url
    {
        get { return url; }
        set { url = value; }
    }
    private string fecha;

    public string _fecha
    {
        get { return fecha; }
        set { fecha = value; }
    }
    private string clientIp;

    public string _ip
    {
        get { return clientIp; }
        set { clientIp = value; }
    }
    private string clientmac;

    public string _mac
    {
        get { return clientmac; }
        set { clientmac = value; }
    }

    public encap_notificaciones(string titu, string descrip, string url, string fecha, string clientIp, string clientmac)
    {
        // TODO: Complete member initialization
        this._titu = titu;
        this._descrip = descrip;
        this._url = url;
        this._fecha = fecha;
        this._ip = clientIp;
        this._mac = clientmac;
    }
}