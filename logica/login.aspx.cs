using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class presentacion_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["rol"] = 0; 
        Session["id_usuario"]=0;
        Session["nombre"]=null;
        Session["id_estado"] = 0;

    }
    protected void BT_aceptar_Click(object sender, EventArgs e)
    {
        string[] dato = new string[5];
        String user = TB_usuario.Text; /*recoge valores*/
        String clave = TB_clave.Text;
        DataTable data = new DataTable();/*crea tabla o vector*/
        encapsular encap = new encapsular(user, clave);/*envia variables y encapsula*/
        /*encap._user*/
        sesion loog = new sesion();/*llama clase de conection para la consulta de login*/
        data = loog.loggin(encap);/*recoge datos de consulta*/
        ClientScriptManager jk = this.ClientScript;

        if (data.Rows.Count > 0)
        {

            Session["rol"] = data.Rows[0]["id_rol"].ToString();
            Session["nombre"] = data.Rows[0]["nombres"];
            Session["id_usuario"] = data.Rows[0]["id_usuario"].ToString();
            Session["id_estado"] = data.Rows[0]["id_estado"].ToString();
            if (Session["id_estado"].Equals("1")) {
            if (Session["rol"].Equals("1"))
            {
                jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Bienvenido Administrador');window.location=\"administrador.aspx\"</script>");
            }

            if (Session["rol"].Equals("2"))
            {
                jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Bienvenido Bibliotecario');window.location=\"bibliotecario.aspx\"</script>");
            }

            if (Session["rol"].Equals("3"))
            {
                jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Bienvenido Usuario');window.location=\"usuario.aspx\"</script>");
            }



        }
        else
        {
            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error de usuario');</script>");

        }

       }
       else
       {
            jk.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('usuario desactivado');</script>");

       }
    }
}