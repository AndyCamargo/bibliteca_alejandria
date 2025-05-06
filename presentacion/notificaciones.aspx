<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/notificaciones.aspx.cs" Inherits="presentacion_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="topnav">
      <ul>
       <li><a href="bibliotecario.aspx">Home</a></li>
        <li><a href="autores.aspx">Registro Autor</a></li>
        <li><a href="libros.aspx">Registro libros</a></li>
        <li><a href="notificaciones.aspx">Notificaciones Y Noticias</a></li>
        <li><a href="home.aspx">Cerrar Seccion</a></li>
      </ul>
    </div>
    <div id="services">
   </div>
   <div>
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    <table class="style1">
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style4">
                                Notificaciones Y Noticias</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Titulo</td>
                            <td class="style4">
                                <asp:TextBox ID="TB_titulo" runat="server" Width="260px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Descripcion</td>
                            <td class="style4">
                            <asp:TextBox ID="TB_descripcion" runat="server" Width="259px" Height="92px" 
                                    TextMode="MultiLine" Rows="10"></asp:TextBox>
                                </td>
                        </tr>
                           <tr>
                            <td class="style2">
                                Url</td>
                            <td class="style4">
                                <asp:FileUpload ID="FU_url" runat="server" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="style2">
                                Fecha</td>
                            <td class="style4">
                                <asp:TextBox ID="TB_fecha" runat="server" Width="255px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                <asp:Button ID="BT_guardar" runat="server" onclick="Button1_Click" 
                    Text="Guardar" Width="82px" ValidationGroup="v1" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>

