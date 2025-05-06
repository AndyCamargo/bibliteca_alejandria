using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de encap_libros
/// </summary>
public class encap_libros
{
    private string nombre;

    public string _nom
    {
        get { return nombre; }
        set { nombre = value; }
    }
    private string descripcion;

    public string _des
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    private string cantidad;

    public string _can
    {
        get { return cantidad; }
        set { cantidad = value; }
    }
    private string id_genero;

    public string _gen
    {
        get { return id_genero; }
        set { id_genero = value; }
    }

    private string id_categoria;

    public string _cate
    {
        get { return id_categoria; }
        set { id_categoria = value; }
    }
    private string url;

    public string _url
    {
        get { return url; }
        set { url = value; }
    }
    private string id_etiqueta_libros;

    public string _eti
    {
        get { return id_etiqueta_libros; }
        set { id_etiqueta_libros = value; }
    }
    private string autor1;

    public string _aut1
    {
        get { return autor1; }
        set { autor1 = value; }
    }
    private string autor2;

    public string _aut2
    {
        get { return autor2; }
        set { autor2 = value; }
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

	public encap_libros()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
    }

    public encap_libros(string nombre, string descripcion, string cantidad, string id_genero, string id_categoria, string url, string id_etiqueta_libros, string autor1, string autor2, string clientIp, string clientmac)
    {
        // TODO: Complete member initialization
        this._nom = nombre;
        this._des = descripcion;
        this._can = cantidad;
        this._gen = id_genero;
        this._cate = id_categoria;
        this._url = url;
        this._eti = id_etiqueta_libros;
        this._aut1 = autor1;
        this._aut2 = autor2;
        this._ip = clientIp;
        this._mac = clientmac;
    }

     

}
