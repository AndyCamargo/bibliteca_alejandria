<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/login.aspx.cs" Inherits="presentacion_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 190px;
        }
        .style3
        {
            width: 210px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div id="topnav">
      <ul>
        <li><a href="home.aspx">Home</a></li>
        <li><a href="login.aspx">Login</a></li>
        <li><a href="registro.aspx">Registro</a></li>
      </ul>
    </div>
    <div>
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Iniciar Sesion"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <table class="style1">
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
                            </td>
                            <td class="style3">
                            <asp:TextBox ID="TB_usuario" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TB_usuario" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label2" runat="server" Text="Clave"></asp:Label>
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="TB_clave" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TB_clave" ErrorMessage="Ingrese Contraseña"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl="~/presentacion/registro.aspx">Abrir cuenta</asp:HyperLink>
                            </td>
                            <td class="style3">
                                <asp:Button ID="BT_aceptar" runat="server" onclick="BT_aceptar_Click" 
                                    Text="Iniciar" />
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
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>

</asp:Content>

