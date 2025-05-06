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
        Response.Cache.SetNoStore();
        if (Session["id_usuario"] != null)
        {
            if (int.Parse(Session["rol"].ToString()) != 1)
            {
                Response.Redirect("login.aspx");
            }
        }
        else
            Response.Redirect("login.aspx");
     
    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String clientIp = (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? Request.ServerVariables["REMOTE_ADDR"]).Split(',')[0].Trim();
        NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
        string clientmac = nics[2].GetPhysicalAddress().ToString();
        ClientScriptManager jk = this.ClientScript;
        try
        {
            String generos = TB_genero.Text;
            String descripcion = TB_descripcion.Text;


            encap_genero gener = new encap_genero(generos, descripcion, clientIp, clientmac);
            generos genero = new generos();
            genero.gene(gener);

            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Se Guardo Genero'); window.location=\"administrador.aspx\"</script>");

        }
        catch
        {
            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error'); window.location=\"genero.aspx\"</script>");

        }

    }
}