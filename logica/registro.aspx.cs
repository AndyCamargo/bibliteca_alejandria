using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.NetworkInformation;

public partial class presentacion_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String clientIp = (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? Request.ServerVariables["REMOTE_ADDR"]).Split(',')[0].Trim();
        NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
        string clientmac = nics[2].GetPhysicalAddress().ToString();
        ClientScriptManager jk = this.ClientScript;
        try
        {
            String nombre = TB_nombre.Text;
            String apellido = TB_apellidos.Text;
            String cedula = TB_cedula.Text;
            String direccion = TB_direccion.Text;
            String telefono = TB_telefono.Text;
            String fecha = TB_fecha.Text;
            String correo = TB_correo.Text;
            String clave = TB_clave.Text;

            enca_registro regi = new enca_registro(nombre, apellido, cedula, direccion, telefono, fecha, correo, clave, clientIp, clientmac);
            registro_conexion usuario = new registro_conexion();
            usuario.regist(regi);

            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Su Registro Fue Exitoso'); window.location=\"login.aspx\"</script>");

        }
        catch
        {
            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error De Registro'); window.location=\"registro.aspx\"</script>");

        }

    }
}