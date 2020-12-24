using System;

namespace CineShowAPP
{
    public class DetalleVenta
    {
        public int id_comprobante { get; set; }
        public DateTime fecha_compra { get; set; }
        public string nombre_cliente { get; set; }
        public string apellido_cliente { get; set; }
        public string pelicula { get; set; }
        public double monto { get; set; }
        public string nombre_empleado { get; set; }
        public string apellido_empleado { get; set; }
        public string Cliente
        {
            get
            {
                return apellido_cliente + ", " + nombre_cliente;
            }
        }
        public string Empleado
        {
            get
            {
                return apellido_empleado + ", " + nombre_empleado;
            }
        }
    }
}