# TPI_P2
Trabajo Práctico Integrador de Programación 2

Integrantes:    
- 110849 - Garnica Rodriguez, Vanesa.
- 111894 - Marini, Melisa Ailen.
- 111896 - Cornaglia, Leandro Leonel.
- 112089 - Cardellino, Fernando Agustin.

Curso: 1W3.

Materia: Programación II.

Fecha de entrega: 04/11/2020



NOTAS ACLARATORIAS:

1) Se incluye un archivo PDF con el diagrama de la Base de Datos

2) Se acompaña el Script de la Base de Datos. 

3) Los menues que tienen funcionalidad son los siguientes:
A) En el menú Peliculas, el submenu Altas Peliculas contiene el ABM de Películas. En este caso se trabajaron las tablas: Peliculas, Generos, Idiomas,  Clasificaciones, Calificacion, Nacionalidades.
B) En el menú Ver, submenú Reportes, se encuentran tres reportes:
B.1) Peliculas. En este caso se trabajaron las tablas: Peliculas, Generos, Idiomas,  Clasificaciones, Calificacion, Nacionalidades.
B.2) Entradas. En este caso se trabajaron las tablas: Peliculas, Funciones, Salas_Funciones, Detalles_Comprobantes, Comprobantes_Compras, Clientes, Salas, Tipos_Salas.
B.3) Ventas. En este caso se trabajaron las tablas: Tickets, Detalles_Comprobantes, Descuentos, Comprobantes_Compras, Salas_Funciones, Funciones, Peliculas, Empleados, Clientes.
C) En el menú Ver, submenú Consultas, se encuentra el form presentado para Laboratorio de Computación II, con las consultas respectivas. Para que funcione adecaudamente deben ejecutarse los procedimeintos almacenados que incluye el Script de la BD CineShow.
   
    
RECOMENDACIONES:
- Al momento de ejecutar el Scrip de la BD: Puede suceder que cuando se ejecuten los inserts salte algún error al llegar a los inserts de FUNCIONES (no hemos descubierto el motivo ya que los datos respetan la sintaxis para su cargado). En caso de que surja el error es IMPORTANTE eliminar la base de datos y volver a ejecutarla (o en su caso reiniciar el conteo de identities para la tabla en donde hubo el error), ya que de lo contrario se altera el orden de los PK, debido a que todos los campos "id" son de tipo identity, por lo que puede haber inconvenientes en los posteriores inserts que se sigan ejecutando. Y esto puede derivar en que la aplicación propuesta no funcione adecuadamente. Lo recomendable es ir ejecutando los insertes de a tramos.
- En la clase Datos, se recomienda realizar los ajustes correspondientes al string de conexión para lograr la conexión a la base de datos creada con el Script que se acompaña.
 
