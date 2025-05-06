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
        String nombreArchivo = System.IO.Path.GetFileName(FU_url.PostedFile.FileName);
        string extension = System.IO.Path.GetExtension(FU_url.PostedFile.FileName);

         try
        {
        if ((string.Compare(extension, ".jpg", true) == 0 || string.Compare(extension, ".png", true) == 0 || string.Compare(extension, ".jpeg", true) == 0 || string.Compare(extension, ".gif", true) == 0))
        {
            
            string saveLocation = Server.MapPath("~\\imagenes") + "\\" + nombreArchivo;

            if (System.IO.File.Exists(saveLocation))
            {
                jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Ya existe un archivo adjunto en el servidor con ese nombre');</script>");
                return;
            }

            try
            {
                FU_url.PostedFile.SaveAs(saveLocation);
                        }
            catch (Exception exc)
            {
                jk.RegisterClientScriptBlock(this.GetType(), "", string.Format("<script type='text/javascript'>alert('Error: {0}');</script>", exc.Message));
                return;
            }

        }

        String titu = TB_titulo.Text;
        String descrip = TB_descripcion.Text;
        String url = "~\\imagenes\\" + nombreArchivo;
        String fecha = TB_fecha.Text;
        encap_notificaciones noti = new encap_notificaciones(titu, descrip, url, fecha, clientIp, clientmac);
     
           
        jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Registro correctamente '); window.location=\"bibliotecario.aspx\"</script>");

        }
         catch
         {
             jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error De Registro'); window.location=\"notificaciones.aspx\"</script>");

         }



    }
}