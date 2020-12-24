using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CineShowAPP
{
    public partial class frmReporteVentas : Form
    {
        public frmReporteVentas()
        {
            InitializeComponent();
        }

        
        private void GetSalesReport(DateTime fechaInicial, DateTime fechaFinal)
        {
            ReporteVentas modelo = new ReporteVentas();
            modelo.CrearReporteVentas(fechaInicial, fechaFinal);

            ReporteVentasBindingSource.DataSource = modelo;
            DetalleVentaBindingSource.DataSource = modelo.listadoVentas;
            VentasNetoPorPeriodoBindingSource.DataSource = modelo.ventasNetasPorPeriodo;

            this.reportViewer1.RefreshReport();
        }

        private void frmReporteVentas_Load(object sender, EventArgs e)
        {
            dtp_inicial.MaxDate = DateTime.Now;
            dtp_final.MaxDate = DateTime.Now;

            var fechaInicial = new DateTime(1960, 1, 1);
            var fechaFinal = DateTime.Now;

            GetSalesReport(fechaInicial, fechaFinal);
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }

        private void btn_hoy_Click(object sender, EventArgs e)
        {
            var fechaInicial = DateTime.Today;
            var fechaFinal = DateTime.Now;

            GetSalesReport(fechaInicial, fechaFinal);
        }

        private void btn_7dias_Click(object sender, EventArgs e)
        {
            var fechaInicial = DateTime.Today.AddDays(-7).Date;
            var fechaFinal = DateTime.Now;

            GetSalesReport(fechaInicial, fechaFinal);
        }

        private void btn_mes_Click(object sender, EventArgs e)
        {
            var fechaInicial = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            var fechaFinal = DateTime.Now;

            GetSalesReport(fechaInicial, fechaFinal);
        }

        private void btn_30dias_Click(object sender, EventArgs e)
        {
            var fechaInicial = DateTime.Today.AddDays(-30).Date;
            var fechaFinal = DateTime.Now;

            GetSalesReport(fechaInicial, fechaFinal);
        }

        private void btn_anio_Click(object sender, EventArgs e)
        {
            var fechaInicial = new DateTime(DateTime.Now.Year, 1, 1);
            var fechaFinal = DateTime.Now;

            GetSalesReport(fechaInicial, fechaFinal);
        }

        private void btn_personalizado_Click(object sender, EventArgs e)
        {
            var fechaInicial = dtp_inicial.Value.Date;
            var fechaFinal = dtp_final.Value.Date;
            fechaFinal = fechaFinal.AddHours(23).AddMinutes(59).AddSeconds(59);

            if(fechaInicial > fechaFinal)
            {
                MessageBox.Show("Por favor ingrese fechas validas.");
                return;
            }

            GetSalesReport(fechaInicial, fechaFinal);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var fechaInicial = new DateTime(1960, 1, 1);
            var fechaFinal = DateTime.Now;
            
            GetSalesReport(fechaInicial, fechaFinal);
        }

        private void frmReporteVentas_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Está seguro que desea salir?",
                   "SALIENDO",
                   MessageBoxButtons.YesNo,
                   MessageBoxIcon.Question,
                   MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {

                e.Cancel = false;
            }
            else e.Cancel = true;
        }
    }
}
