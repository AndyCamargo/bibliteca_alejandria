<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/suspender.aspx.cs" Inherits="presentacion_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 <div id="topnav">
      <ul>
        <li><a href="administrador.aspx">Home</a></li>
        <li><a href="registro_bibliotecario.aspx">Registro Bibliotecario</a></li>
         <li><a href="genero.aspx">Generos Literarios</a></li>
         <li><a href="suspender.aspx">suspender</a></li>
          <li><a href="home.aspx">Cerrar Seccion</a></li>
          <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                  SelectMethod="consul_usua" TypeName="consulta_usuario_modificar" 
                  DeleteMethod="elimi_usu">
              <DeleteParameters>
                  <asp:Parameter Name="id_usuario" Type="Int32" />
              </DeleteParameters>
          </asp:ObjectDataSource>
      </ul>
      
    </div>
   
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ObjectDataSource1" >
       <Columns>
           <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
           <asp:BoundField DataField="nombres" HeaderText="Nombre" />
           <asp:BoundField DataField="apellidos" HeaderText="Apellido" />
           <asp:BoundField DataField="cedula" HeaderText="Cedula" />
           <asp:BoundField DataField="direccion" HeaderText="Dirreccion" />
           <asp:BoundField DataField="telefono" HeaderText="Telefono" />
           <asp:BoundField DataField="correo" HeaderText="Correo" />
           <asp:BoundField DataField="nombre_estado" HeaderText="Estado" />
       </Columns>
      </asp:GridView>
</asp:Content>

