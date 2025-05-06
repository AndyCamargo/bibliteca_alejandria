<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/libros.aspx.cs" Inherits="presentacion_Default" %>

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
       <li><a href="bibliotecario.aspx">Home</a></li>
        <li><a href="autores.aspx">Registro Autor</a></li>
        <li><a href="libros.aspx">Registro libros</a></li>
        <li><a href="notificaciones.aspx">Notificaciones Y Noticias</a></li>
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
                                Registro Libros</td>
                        </tr>
                        <tr>
                            <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text="Nombre Libro"></asp:Label>
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TB_nombre" runat="server" Width="266px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Descripcion</td>
                            <td class="style4">
                            <asp:TextBox ID="TB_descripcion" runat="server" Width="266px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Genero</td>
                            <td class="style4">
                                <asp:DropDownList ID="DL_genero" runat="server" 
                                    DataSourceID="ObjectDataSource1" DataTextField="nombre_genero" 
                                    DataValueField="id_genero">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                    SelectMethod="genero" TypeName="Registro_libros"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Cantidad</td>
                            <td class="style4">
                            <asp:TextBox ID="TB_cantidad" runat="server" Width="265px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Categoria</td>
                            <td class="style4">
                                <asp:DropDownList ID="DL_categoria" runat="server" 
                                    DataSourceID="ObjectDataSource2" DataTextField="descripcion" 
                                    DataValueField="id_categoria">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                                    SelectMethod="categoria" TypeName="Registro_libros"></asp:ObjectDataSource>
                                <br />
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
                                Etiqueta Libros</td>
                            <td class="style4">
                                <asp:DropDownList ID="DL_etiqueta" runat="server" 
                                    DataSourceID="ObjectDataSource3" DataTextField="nombre_etiqueta" 
                                    DataValueField="id_etiqueta">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                    SelectMethod="etiqueta" TypeName="Registro_libros"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Autores</td>
                            <td class="style4">
                                <asp:DropDownList ID="DL_autor1" runat="server" 
                                    DataSourceID="ObjectDataSource4" DataTextField="nombre_autor" 
                                    DataValueField="id_autor">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style4">
                                <asp:DropDownList ID="DL_autor2" runat="server" 
                                    DataSourceID="ObjectDataSource4" DataTextField="nombre_autor" 
                                    DataValueField="id_autor">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style4">
                                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                                    SelectMethod="autor" TypeName="Registro_libros"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style4">
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
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
                <asp:Button ID="BT_registrar" runat="server" onclick="Button1_Click" 
                    Text="Registrar" Width="82px" ValidationGroup="v1" />
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



