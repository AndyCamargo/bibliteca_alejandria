# Sistema de Gestión de Biblioteca 📚

Sistema web para la administración de una biblioteca desarrollado en ASP.NET Web Forms con base de datos MySQL.

## 📋 Descripción

Sistema integral de gestión bibliotecaria que permite administrar libros, autores, préstamos y usuarios con diferentes niveles de acceso según roles definidos.

## 🚀 Características

### Gestión de Usuarios
- **Tres niveles de acceso:**
  - Administrador: Control total del sistema
  - Bibliotecario: Gestión de libros y préstamos
  - Usuario: Consulta y solicitud de préstamos
- Sistema de autenticación con sesiones
- Registro de usuarios con validación
- Estado de usuarios (activo/inactivo)

### Gestión de Libros
- Registro completo de libros con:
  - Información básica (título, descripción)
  - Múltiples autores por libro
  - Categorización (género, categoría, etiquetas)
  - Control de inventario (cantidad disponible)
  - Imágenes de portadas
- Búsqueda y filtrado de libros

### Gestión de Préstamos
- Control de préstamos y devoluciones
- Sistema de multas por retraso
- Historial de préstamos por usuario

### Seguridad
- Auditoría completa de acciones (tabla `seguridad`)
- Registro de IP y MAC address
- Prevención de acceso no autorizado
- Cache deshabilitado para páginas protegidas

## 🛠️ Tecnologías Utilizadas

- **Frontend:** ASP.NET Web Forms (.aspx)
- **Backend:** C# (.NET Framework 4.0)
- **Base de Datos:** MySQL 5.6+
- **Conector:** MySQL.Data 6.6.5.0

## 📁 Estructura del Proyecto

```
biblioteca/
│
├── bd/                      # Scripts de base de datos
│   ├── b.sql               # Script completo con datos
│   ├── base.sql            # Estructura base
│   └── base3.sql           # Estructura alternativa
│
├── presentacion/           # Páginas ASPX (Vista)
│   ├── login.aspx          # Página de inicio de sesión
│   ├── registro.aspx       # Registro de usuarios
│   ├── administrador.aspx  # Panel de administrador
│   ├── bibliotecario.aspx  # Panel de bibliotecario
│   ├── usuario.aspx        # Panel de usuario
│   ├── libros.aspx         # Gestión de libros
│   ├── autores.aspx        # Gestión de autores
│   └── ...
│
├── logica/                 # Code-behind (Controlador)
│   ├── login.aspx.cs       # Lógica de autenticación
│   ├── registro.aspx.cs    # Lógica de registro
│   └── ...
│
├── App_Code/               # Clases del modelo
│   ├── Conexion/           # Clases de conexión a BD
│   ├── Encapsular/         # Clases de encapsulación
│   └── ...
│
├── imagenes/               # Almacenamiento de imágenes
├── Styles/                 # Archivos CSS
│
├── Site.master             # Master page principal
├── Site.master.cs          # Code-behind del master
└── Web.config              # Configuración de la aplicación
```

## 💾 Base de Datos

### Tablas Principales

- `usuarios` - Información de usuarios del sistema
- `rol` - Roles disponibles (1=Admin, 2=Bibliotecario, 3=Usuario)
- `estado` - Estados posibles (1=Activo, 2=Inactivo)
- `libros` - Catálogo de libros
- `autor` - Registro de autores
- `libro_autores` - Relación muchos a muchos libros-autores
- `genero` - Géneros literarios
- `categoria` - Categorías de libros
- `etiquetas` - Etiquetas descriptivas
- `prestamo` - Control de préstamos
- `notificaciones` - Sistema de notificaciones
- `seguridad` - Log de auditoría

### Procedimientos Almacenados

El sistema utiliza procedimientos almacenados para todas las operaciones:
- `SP_login` - Autenticación de usuarios
- `SP_registro` - Registro de nuevos usuarios
- `SP_libros` - Gestión de libros
- `SP_autor` - Gestión de autores
- `SP_seguridad` - Registro de auditoría
- Y muchos más...

## ⚙️ Instalación

### Requisitos Previos

1. Visual Studio 2010 o superior
2. .NET Framework 4.0
3. MySQL Server 5.6 o superior
4. IIS o IIS Express

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/tu-usuario/biblioteca.git
   ```

2. **Configurar la base de datos**
   - Crear una base de datos llamada `biblioteca` en MySQL
   - Ejecutar el script `bd/b.sql` para crear las tablas y datos de ejemplo
   ```sql
   mysql -u root -p biblioteca < bd/b.sql
   ```

3. **Configurar la conexión**
   - Editar `Web.config` y actualizar la cadena de conexión:
   ```xml
   <connectionStrings>
     <add name="ConnectionStringMySql" 
          connectionString="server=localhost;user=root;database=biblioteca;port=3306;pwd=TU_PASSWORD" />
   </connectionStrings>
   ```

4. **Abrir el proyecto en Visual Studio**
   - Abrir el archivo de solución o el proyecto web
   - Restaurar paquetes NuGet si es necesario
   - Compilar el proyecto

5. **Ejecutar la aplicación**
   - Presionar F5 o usar IIS Express
   - La aplicación se abrirá en `http://localhost:[puerto]/login.aspx`

## 👤 Usuarios de Prueba

El sistema incluye los siguientes usuarios de ejemplo:

| Usuario | Contraseña | Rol |
|---------|------------|-----|
| alenyi2@hotmail.com | 3214 | Administrador |
| apanda_3@hotmail.com | 1234 | Bibliotecario |
| prueba@prueba.com | prueba | Usuario |

## 📱 Funcionalidades por Rol

### Administrador
- Registrar bibliotecarios
- Gestionar géneros literarios
- Ver todos los usuarios del sistema
- Suspender/activar usuarios
- Acceso completo al sistema

### Bibliotecario
- Registrar nuevos libros
- Gestionar autores
- Crear notificaciones
- Gestionar préstamos
- Ver reportes de biblioteca

### Usuario
- Ver catálogo de libros
- Solicitar préstamos
- Ver historial personal
- Actualizar perfil

## 🔒 Seguridad

- Autenticación basada en sesiones
- Validación de roles en cada página
- Registro de auditoría de todas las acciones
- Prevención de cache en páginas sensibles
- Encriptación de contraseñas (recomendado implementar)

## 🐛 Solución de Problemas

### Error de conexión a base de datos
- Verificar que MySQL esté ejecutándose
- Confirmar credenciales en Web.config
- Verificar que el puerto 3306 esté abierto

### Error al cargar imágenes
- Verificar permisos de escritura en carpeta `imagenes/`
- Confirmar límite de tamaño de archivo en IIS

### Problemas de sesión
- Verificar configuración de timeout en Web.config
- Limpiar cookies del navegador

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la [Licencia MIT](LICENSE).

## 👥 Autores

- Sistema desarrollado para gestión bibliotecaria
- Creado con fines educativos

## 📞 Soporte

Para reportar problemas o solicitar funcionalidades, por favor crear un issue en el repositorio de GitHub.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:
1. Fork el proyecto
2. Cree una rama para su feature (`git checkout -b feature/NuevaFuncionalidad`)
3. Commit sus cambios (`git commit -m 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/NuevaFuncionalidad`)
5. Abra un Pull Request

---

**Nota:** Este sistema fue desarrollado con propósitos educativos. Se recomienda implementar medidas de seguridad adicionales antes de usar en producción.
