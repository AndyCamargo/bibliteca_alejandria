<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/registro.aspx.cs" Inherits="presentacion_Default" %>

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
                <td class="style3">
                    <table class="style1">
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style4">
                                Registro</td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text="Nombres"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_nombre" runat="server" Width="266px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TB_nombre" ErrorMessage="Nombres Obligatorios" 
                                    ValidationGroup="validar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label3" runat="server" Text="Apellidos"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_apellidos" runat="server" Width="266px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="TB_apellidos" ErrorMessage="Apellidos Obligatorios" 
                                    ValidationGroup="validar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label4" runat="server" Text="Cedula"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_cedula" runat="server" Width="265px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TB_cedula" ErrorMessage="Cedula Obligatoria" 
                                    ValidationGroup="validar"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="TB_cedula" ErrorMessage="****" 
                                    ValidationExpression="\d{7,12}" ValidationGroup="validar"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label5" runat="server" Text="Direccion"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_direccion" runat="server" Width="265px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TB_direccion" ErrorMessage="Direccion Obligatoria" 
                                    ValidationGroup="validar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label6" runat="server" Text="Telefono"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_telefono" runat="server" Width="267px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="TB_telefono" ErrorMessage="Telefono Obligatorio" 
                                    ValidationGroup="validar"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                    ControlToValidate="TB_telefono" ErrorMessage="****" 
                                    ValidationExpression="\d{7,10}" ValidationGroup="validar"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label7" runat="server" Text="Fecha Nacimiento"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_fecha" runat="server" Width="267px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label8" runat="server" Text="Correo Electronico"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_correo" runat="server" Width="268px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                    ControlToValidate="TB_correo" ErrorMessage="Correo Incorrecto" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ValidationGroup="validar"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label1" runat="server" Text="Clave"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_clave" runat="server" TextMode="Password" Width="268px"></asp:TextBox>
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
                <asp:Button ID="BT_registro" runat="server" onclick="Button1_Click" 
                    Text="Registrar" Width="82px" ValidationGroup="validar" />
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

