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
        
            String nombre = TB_nombre.Text;
            String descripcion = TB_descripcion.Text;
            String id_genero = DL_genero.Text;
            String cantidad = TB_cantidad.Text;
            String id_categoria = DL_categoria.Text;
            String url = "~\\imagenes\\" + nombreArchivo;
            String id_etiqueta_libros = DL_etiqueta.Text;
            String autor1=DL_autor1.Text;
            String autor2 = DL_autor2.Text;
            encap_libros libros = new encap_libros(nombre, descripcion, cantidad, id_genero, id_categoria, url, id_etiqueta_libros, autor1, autor2, clientIp, clientmac);
            Registro_libros libro = new Registro_libros();
            libro.rlibro(libros);
            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Registro correctamente '); window.location=\"bibliotecario.aspx\"</script>");

        }
        catch
        {
            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error De Registro'); window.location=\"libros.aspx\"</script>");

        }

    }

}