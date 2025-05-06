<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/genero.aspx.cs" Inherits="presentacion_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 193px;
        }
        .style3
        {
            width: 723px;
        }
        .style4
        {
            width: 338px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="topnav">
      <ul>
         <li><a href="administrador.aspx">Home</a></li>
         <li><a href="registro_bibliotecario.aspx">Registro Bibliotecario</a></li>
         <li><a href="genero.aspx">Generos Literarios</a></li>
         <li><a href="suspender.aspx">suspender</a></li>
         <li><a href="home.aspx">Cerrar Seccion</a></li>
      </ul>
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
                                Generos Literarios</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Genero</td>
                            <td class="style4">
                            <asp:TextBox ID="TB_genero" runat="server" Width="266px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Decripcion</td>
                            <td class="style4">
                            <asp:TextBox ID="TB_descripcion" runat="server" Width="266px"></asp:TextBox>
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

