using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de encapsular
/// </summary>
public class encapsular
{
    public encapsular()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    private String user;

    public String _user
    {
        get { return user; }
        set { user = value; }
    }
    private String clave;

    public String _clave
    {
        get { return clave; }
        set { clave = value; }
    }

    //encapsular usuario
    public encapsular(string user, string clave)
    {
        // TODO: Complete member initialization
        this._user = user;
        this._clave = clave;
    }
}