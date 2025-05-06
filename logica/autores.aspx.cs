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
            if (int.Parse(Session["rol"].ToString()) != 2)
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
            String nombre = TB_nombre.Text;
            String reseña = TB_reseña.Text;
            String fecha = TB_fecha.Text;

            encap_autor autores = new encap_autor(nombre, reseña, fecha, clientIp, clientmac);
            regis_autor autor = new regis_autor();
            autor.rautor(autores);

            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Su Registro Fue Exitoso'); window.location=\"bibliotecario.aspx\"</script>");

        }
        catch
        {
            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error De Registro'); window.location=\"autor.aspx\"</script>");

        }

    }
 
}