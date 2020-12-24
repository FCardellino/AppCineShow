using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineShowAPP
{
    class ReporteVentas
    {
        public DateTime fechaDelReporte { get; private set; }
        public DateTime fechaInicial { get; private set; }
        public DateTime fechaFinal { get; private set; }
        public List<DetalleVenta> listadoVentas { get; private set; }
        public List<VentasNetoPorPeriodo> ventasNetasPorPeriodo { get; private set; }
        public double totalVentasNeto { get; private set; }

        public void CrearReporteVentas(DateTime fechaInicial, DateTime fechaFinal)
        {
            fechaDelReporte = DateTime.Now;
            this.fechaInicial = fechaInicial;
            this.fechaFinal = fechaFinal;

            var objetoDatos = new Datos();
            var resultado = objetoDatos.ObtenerDatosVentas(fechaInicial, fechaFinal);
            
            listadoVentas = new List<DetalleVenta>();

            foreach(DataRow fila in resultado.Rows)
            {
                var detalleVenta = new DetalleVenta()
                {
                    id_comprobante = Convert.ToInt32(fila[0]),
                    fecha_compra = Convert.ToDateTime(fila[1]),
                    nombre_cliente = Convert.ToString(fila[2]),
                    apellido_cliente = Convert.ToString(fila[3]),
                    pelicula = Convert.ToString(fila[4]),
                    monto = Convert.ToDouble(fila[5]),
                    nombre_empleado = Convert.ToString(fila[6]),
                    apellido_empleado = Convert.ToString(fila[7])
                };

                listadoVentas.Add(detalleVenta);

                //calcular total de ventas neto
                totalVentasNeto += detalleVenta.monto;
            }

            //crear ventas neto por periodo
            //crear lista temporal de ventas por fecha
            //LINQ para hacer una consulta de la lista de ventas que tengo
            //LINQ: Lenguaje Integrado de Consultas
            var listaVentasPorFecha = (from ventas in listadoVentas
                                       group ventas by ventas.fecha_compra
                                       into listaVentas
                                       select new
                                       {
                                           fecha = listaVentas.Key,
                                           total = listaVentas.Sum(item => item.monto)
                                       }).AsEnumerable();

            //obtener numero de dias del reporte
            int diasTotal = Convert.ToInt32((fechaFinal - fechaInicial).Days);

            //agrupar periodo por dias
            if(diasTotal <= 7)
            {
                ventasNetasPorPeriodo = (from ventas in listaVentasPorFecha
                                         group ventas by ventas.fecha.ToString("yyyy-MM-dd")
                                         into listaVentas
                                         select new VentasNetoPorPeriodo
                                         {
                                             periodo = listaVentas.Key,
                                             ventasNeto = listaVentas.Sum(item => item.total)
                                         }).ToList();
            }
            //agrupar periodo por semanas
            //para obtener cual es el numero de semana de tal fecha, se usa system.globalization.etc.GetWeekOfYear
            //los parametros son: la fecha de la que se quiere saber la semana, y reglas sobre como elegir la primera semana
            else if(diasTotal <= 31)
            {
                ventasNetasPorPeriodo = (from ventas in listaVentasPorFecha
                                         group ventas by System.Globalization.CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(ventas.fecha, System.Globalization.CalendarWeekRule.FirstDay, DayOfWeek.Monday)
                                         into listaVentas
                                         select new VentasNetoPorPeriodo
                                         {
                                             periodo = "Semana " + listaVentas.Key.ToString(),
                                             ventasNeto = listaVentas.Sum(item => item.total)
                                         }).ToList();
            }
            //agrupar periodo por meses
            else if(diasTotal <= 366)
            {
                ventasNetasPorPeriodo = (from ventas in listaVentasPorFecha
                                         group ventas by ventas.fecha.ToString("yyyy-MM")
                                         into listaVentas
                                         select new VentasNetoPorPeriodo
                                         {
                                             periodo = listaVentas.Key,
                                             ventasNeto = listaVentas.Sum(item => item.total)
                                         }).ToList();
            }
            //agrupar periodo por años
            else
            {
                ventasNetasPorPeriodo = (from ventas in listaVentasPorFecha
                                         group ventas by ventas.fecha.ToString("yyyy")
                                         into listaVentas
                                         select new VentasNetoPorPeriodo
                                         {
                                             periodo = listaVentas.Key,
                                             ventasNeto = listaVentas.Sum(item => item.total)
                                         }).ToList();
            }
        }
    }
}
