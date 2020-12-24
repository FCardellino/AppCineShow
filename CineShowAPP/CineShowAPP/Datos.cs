using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CineShowAPP
{
    class Datos
    {
        private SqlConnection conx;
        private SqlCommand com;
        private SqlDataReader lec;
        private string cadConex;
        public Datos()
        {
            this.conx = new SqlConnection();
            this.com = new SqlCommand();
            this.lec = null;
            this.cadConex = @"Data Source=localhost;Initial Catalog=CineSHOW;Integrated Security=True";//"Data Source=localhost;Initial Catalog=CineSHOW_BDMIn_TablaPeli_Auxil;Integrated Security=True";
        }
        /*
        public Datos(string cadenaConexion)
        {
            this.conx = new SqlConnection();
            this.com = new SqlCommand();
            this.lec = null;
            this.cadConex = cadenaConexion;
        }
        */
        public SqlDataReader pLec { get => lec; set => lec = value; }
        public string pCadenaConexion { get => cadConex; set => cadConex = value; }

        public void conectar()
        {
            conx.ConnectionString = cadConex;
            conx.Open();

            com.Connection = conx;
            com.CommandType = CommandType.Text;
        }

        public void desconectar()
        {
            conx.Close();
            conx.Dispose();
        }

        public DataTable consultarTabla(string nombreTabla)
        {
            this.conectar();
            this.com.CommandText = "SELECT * FROM " + nombreTabla;
            DataTable tabla = new DataTable();
            tabla.Load(com.ExecuteReader());
            this.desconectar();
            return tabla;
        }

        public DataTable consultarProcedimiento(string consultaSql)
        {
            this.conectar();
            this.com.CommandText = consultaSql;
            DataTable tabla = new DataTable();
            tabla.Load(com.ExecuteReader());
            this.desconectar();
            return tabla;
        }

        public DataTable consultar(string consultaSQL)
        {
            try
            {
                this.conectar();
                this.com.CommandText = consultaSQL;
                DataTable tabla = new DataTable();
                tabla.Load(com.ExecuteReader());
                this.desconectar();
                return tabla;
            }catch(Exception e)
            {
                this.desconectar();
                System.Windows.Forms.MessageBox.Show("EXCEPTION:\n" + e.Message);
                return null;
            }
        }

        public void leerTabla(string nombreTabla)
        {
            this.conectar();
            this.com.CommandText = "SELECT * FROM " + nombreTabla;
            this.lec = com.ExecuteReader();
        }

        public void actualizar(string consultaSql)
        {
            this.conectar();
            this.com.CommandText = consultaSql;
            this.com.ExecuteNonQuery();
            this.desconectar();

        }

        public void actualizarConParamteros(string consultaSql, Pelicula p)
        {
            this.conectar();
            this.com.CommandText = consultaSql;

            this.com.Parameters.Clear();

            

            com.Parameters.AddWithValue("@titulo", p.pTitulo );
            com.Parameters.AddWithValue("@descripcion", p.pDescripcion);
            com.Parameters.AddWithValue("@genero", p.pGenero);
            com.Parameters.AddWithValue("@duracion", p.pDuracion);
            com.Parameters.AddWithValue("@estreno", p.pEstreno);
            com.Parameters.AddWithValue("@idioma", p.pIdioma);
            com.Parameters.AddWithValue("@clasific", p.pClasificacion);
            com.Parameters.AddWithValue("@calific", p.pCalificacion);
            com.Parameters.AddWithValue("@nacion", p.pNacionalidad);
            com.Parameters.AddWithValue("@codigo", p.pPk);


            this.com.ExecuteNonQuery();
            this.desconectar();


        }

        public DataTable ObtenerDatosVentas(DateTime fechaInicial, DateTime fechaFinal)
        {
            using(var conexion = ObtenerConexion())
            {
                conexion.Open();
                using(var comando = new SqlCommand())
                {
                    comando.Connection = conexion;
                    comando.CommandText = @"select comprobante.id_comprobante,
	                                            comprobante.fecha_compra,
	                                            cliente.nombre 'nombre_cliente',
	                                            cliente.apellido 'apellido_cliente',
	                                            pelicula.titulo 'pelicula',
	                                            detalle.monto ,
	                                            empleado.nombre 'nombre_empleado',
	                                            empleado.apellido 'apellido_empleado'
                                            from Tickets ticket
                                            inner join Detalles_Comprobantes detalle on ticket.id_det_comp = detalle.id_det_comp
                                            --inner join Descuentos descuento on detalle.id_descuento = descuento.id_descuento
                                            inner join Comprobantes_Compras comprobante on detalle.id_comprobante = comprobante.id_comprobante
                                            inner join Salas_Funciones salaFuncion on detalle.id_sala_funcion = salaFuncion.id_sala_funcion
                                            inner join Funciones funcion on salaFuncion.id_funcion = funcion.id_funcion
                                            inner join Peliculas pelicula on funcion.id_pelicula = pelicula.id_pelicula
                                            inner join Empleados empleado on comprobante.id_empleado = empleado.id_empleado
                                            inner join Clientes cliente on comprobante.id_cliente = cliente.id_cliente
                                            where comprobante.fecha_compra between @fechaInicial and @fechaFinal
                                            order by fecha_compra";
                    comando.Parameters.Add("@fechaInicial", SqlDbType.Date).Value = fechaInicial;
                    comando.Parameters.Add("@fechaFinal", SqlDbType.Date).Value = fechaFinal;
                    comando.CommandType = CommandType.Text;

                    var lectorSQL = comando.ExecuteReader();
                    var tabla = new DataTable();
                    tabla.Load(lectorSQL);
                    lectorSQL.Dispose();
                    return tabla;
                }
            }
        }

        private SqlConnection ObtenerConexion()
        {
            return new SqlConnection(cadConex);
        }
    }
}
