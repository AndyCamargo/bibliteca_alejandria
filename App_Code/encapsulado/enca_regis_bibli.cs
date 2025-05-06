using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de enca_regis_bibli
/// </summary>
public class enca_regis_bibli
{
	public enca_regis_bibli()
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

    private String ape;

    public String _ape
    {
        get { return ape; }
        set { ape = value; }
    }

    private String ced;

    public String _ced
    {
        get { return ced; }
        set { ced = value; }
    }

    private String dir;

    public String _dir
    {
        get { return dir; }
        set { dir = value; }
    }

    private String tel;

    public String _tel
    {
        get { return tel; }
        set { tel = value; }
    }

    private String fec;

    public String _fec
    {
        get { return fec; }
        set { fec = value; }
    }

    private String cor;

    public String _cor
    {
        get { return cor; }
        set { cor = value; }
    }

    private String cla;

    public String _cla
    {
        get { return cla; }
        set { cla = value; }
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


    public enca_regis_bibli(string nombre, string apellido, string cedula, string direccion, string telefono, string fecha, string correo, string clave, string clientIp, string clientmac)
    {
        // TODO: Complete member initialization
        this._nom = nombre;
        this._ape = apellido;
        this._ced = cedula;
        this._dir = direccion;
        this._tel = telefono;
        this._fec = fecha;
        this._cor = correo;
        this._cla = clave;
        this._ip = clientIp;
        this._mac = clientmac;
    }

}