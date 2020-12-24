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
    public partial class frmReporteEntradas : Form
    {
        Datos oBD = new Datos();
        Salas oSala = new Salas();

        public frmReporteEntradas()
        {
            InitializeComponent();
        }

        private void frmReporteEntradas_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'dsEntradas.DataTableEntradasOk' Puede moverla o quitarla según sea necesario.
            //this.dataTableEntradasOkTableAdapter.Fill(this.dsEntradas.DataTableEntradasOk);
            // TODO: esta línea de código carga datos en la tabla 'dsEntradas.DataTableEntradas' Puede moverla o quitarla según sea necesario.
            //this.DataTableEntradasTableAdapter.Fill(this.dsEntradas.DataTableEntradas);

            //this.reportViewer1.RefreshReport();

            cargarCombo(oSala, cboTipoSala, "Tipos_Salas");
        }
        private void cargarCombo(TablaAuxiliar t, ComboBox combo, string nombreTabla)
        {
            //Clase objeto = new Clase();
            DataTable dt = new DataTable();
            dt = t.recuperarDatos(nombreTabla);
            combo.DataSource = dt;
            combo.ValueMember = dt.Columns[0].ColumnName;
            combo.DisplayMember = dt.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
            combo.SelectedIndex = -1;
        }

        private void btnImprimirEnt_Click(object sender, EventArgs e)
        {
            string sentSQL = "Select p.id_pelicula, p.titulo,f.dia_funcion, "+
                " c.nombre+' '+c.apellido Cliente, count(*) 'Cantidad_Entradas', dc.monto, " +
                " ts.tipo_sala, sum(dc.monto) 'Monto_Total' " +
                " from Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula " +
                " join Salas_Funciones sf on sf.id_funcion = f.id_funcion " +
                " join Detalles_Comprobantes dc on dc.id_sala_funcion = sf.id_sala_funcion " +
                " join Comprobantes_Compras cc on cc.id_comprobante = dc.id_comprobante " +
                " join Clientes c on c.id_cliente = cc.id_cliente " +
                " join Salas s on s.id_sala = sf.id_sala " +
                " join Tipos_Salas ts on ts.id_tipo_sala = s.id_tipo_sala " +
                " group by p.id_pelicula,p.titulo,f.id_funcion, f.dia_funcion,c.id_cliente,c.nombre,c.apellido, ts.tipo_sala, dc.monto " +
                " order by 1 ";

            this.dataTableEntradasOkBindingSource.DataSource = oBD.consultar(sentSQL);
            this.reportViewer2E.RefreshReport();

            limpiarTodo();
        }

        private void limpiarTodo()
        {
            cboTipoSala.SelectedIndex = -1;
            txtNomCliente.Text = string.Empty;
            txtFiltroTituloE.Text = string.Empty;
            dtpDesdeE.Value = DateTime.Now;
            dtpHastaE.Value = DateTime.Now;

        }

        private void btnTipoSala_Click(object sender, EventArgs e)
        {
            if (cboTipoSala.SelectedIndex == -1)
            {
                MessageBox.Show("Debe seleccionar tipo de sala", "AVISO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cboTipoSala.Focus();
            }
            else
            {
                string sentenciaSQL = "Select p.id_pelicula, p.titulo,f.dia_funcion, "+
                                " c.nombre+' '+c.apellido Cliente, count(*) 'Cantidad_Entradas', dc.monto, " +
                                " ts.tipo_sala, sum(dc.monto) 'Monto_Total' " +
                                " from Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula " +
                                " join Salas_Funciones sf on sf.id_funcion = f.id_funcion " +
                                " join Detalles_Comprobantes dc on dc.id_sala_funcion = sf.id_sala_funcion " +
                                " join Comprobantes_Compras cc on cc.id_comprobante = dc.id_comprobante " +
                                " join Clientes c on c.id_cliente = cc.id_cliente " +
                                " join Salas s on s.id_sala = sf.id_sala " +
                                " join Tipos_Salas ts on ts.id_tipo_sala = s.id_tipo_sala " +
                                " where ts.id_tipo_sala = " + cboTipoSala.SelectedValue + " "+
                                " group by p.id_pelicula,p.titulo,f.id_funcion, f.dia_funcion,c.id_cliente,c.nombre,c.apellido, ts.tipo_sala, dc.monto " +
                                " order by 1 ";

                this.dataTableEntradasOkBindingSource.DataSource = oBD.consultar(sentenciaSQL);
                this.reportViewer2E.RefreshReport();

                this.limpiarMenos(cboTipoSala);


            }
        }

        private void btnNomCliente_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNomCliente.Text))
            {
                MessageBox.Show("Debe ingresar nombre de algún cliente", "AVISO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtNomCliente.Focus();

            }
            else
            {
                string sentenciaSQL = "Select p.id_pelicula, p.titulo,f.dia_funcion, " +
                                " c.nombre+' '+c.apellido Cliente, count(*) 'Cantidad_Entradas', dc.monto, " +
                                " ts.tipo_sala, sum(dc.monto) 'Monto_Total' " +
                                " from Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula " +
                                " join Salas_Funciones sf on sf.id_funcion = f.id_funcion " +
                                " join Detalles_Comprobantes dc on dc.id_sala_funcion = sf.id_sala_funcion " +
                                " join Comprobantes_Compras cc on cc.id_comprobante = dc.id_comprobante " +
                                " join Clientes c on c.id_cliente = cc.id_cliente " +
                                " join Salas s on s.id_sala = sf.id_sala " +
                                " join Tipos_Salas ts on ts.id_tipo_sala = s.id_tipo_sala " +
                                " where c.nombre LIKE  '" + txtNomCliente.Text + "%' " +
                                " group by p.id_pelicula,p.titulo,f.id_funcion, f.dia_funcion,c.id_cliente,c.nombre,c.apellido, ts.tipo_sala, dc.monto " +
                                " order by 1 ";

                this.dataTableEntradasOkBindingSource.DataSource = oBD.consultar(sentenciaSQL);
                this.reportViewer2E.RefreshReport();

                this.limpiarMenos(txtNomCliente);
            }
        }

        private void btnFiltrarTituloE_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtFiltroTituloE.Text))
            {
                MessageBox.Show("Debe ingresar título de alguna pelicula", "AVISO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtFiltroTituloE.Focus();

            }
            else
            {
                string sentenciaSQL = "Select p.id_pelicula, p.titulo,f.dia_funcion, " +
                                " c.nombre+' '+c.apellido Cliente, count(*) 'Cantidad_Entradas', dc.monto, " +
                                " ts.tipo_sala, sum(dc.monto) 'Monto_Total' " +
                                " from Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula " +
                                " join Salas_Funciones sf on sf.id_funcion = f.id_funcion " +
                                " join Detalles_Comprobantes dc on dc.id_sala_funcion = sf.id_sala_funcion " +
                                " join Comprobantes_Compras cc on cc.id_comprobante = dc.id_comprobante " +
                                " join Clientes c on c.id_cliente = cc.id_cliente " +
                                " join Salas s on s.id_sala = sf.id_sala " +
                                " join Tipos_Salas ts on ts.id_tipo_sala = s.id_tipo_sala " +
                                " where p.titulo LIKE '" + txtFiltroTituloE.Text + "%' " +
                                " group by p.id_pelicula,p.titulo,f.id_funcion, f.dia_funcion,c.id_cliente,c.nombre,c.apellido, ts.tipo_sala, dc.monto " +
                                " order by 1 ";

                this.dataTableEntradasOkBindingSource.DataSource = oBD.consultar(sentenciaSQL);
                this.reportViewer2E.RefreshReport();

                this.limpiarMenos(txtFiltroTituloE);
            }

        }

        private void btnFiltroFechaE_Click(object sender, EventArgs e)
        {
            if (dtpDesdeE.Value > dtpHastaE.Value)
            {
                MessageBox.Show("Debe ingresar un orden correcto de las fechas", "AVISO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                dtpDesdeE.Focus();
            }
            else
            {
                string sentenciaSQL = "Select p.id_pelicula, p.titulo,f.dia_funcion, " +
                               " c.nombre+' '+c.apellido Cliente, count(*) 'Cantidad_Entradas', dc.monto, " +
                               " ts.tipo_sala, sum(dc.monto) 'Monto_Total' " +
                               " from Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula " +
                               " join Salas_Funciones sf on sf.id_funcion = f.id_funcion " +
                               " join Detalles_Comprobantes dc on dc.id_sala_funcion = sf.id_sala_funcion " +
                               " join Comprobantes_Compras cc on cc.id_comprobante = dc.id_comprobante " +
                               " join Clientes c on c.id_cliente = cc.id_cliente " +
                               " join Salas s on s.id_sala = sf.id_sala " +
                               " join Tipos_Salas ts on ts.id_tipo_sala = s.id_tipo_sala " +
                               " where f.dia_funcion between '" + dtpDesdeE.Value.ToString("yyyyMMdd") + "' and  '" + dtpHastaE.Value.ToString("yyyyMMdd") + "' " +
                               " group by p.id_pelicula,p.titulo,f.id_funcion, f.dia_funcion,c.id_cliente,c.nombre,c.apellido, ts.tipo_sala, dc.monto " +
                               " order by 1 ";

                this.dataTableEntradasOkBindingSource.DataSource = oBD.consultar(sentenciaSQL);
                this.reportViewer2E.RefreshReport();

                this.limpiarMenos(dtpDesdeE);
               

            }
        }
        private void limpiarMenos(object o)
        {
                if (o is ComboBox)
                {
                   txtNomCliente.Text = string.Empty;
                   txtApeCliente.Text = string.Empty;
                   txtFiltroTituloE.Text = string.Empty;
                   dtpDesdeE.Value = DateTime.Now;
                   dtpHastaE.Value = DateTime.Now;

                }
                else if (o is TextBox)
                {
                    if (o == txtNomCliente)
                    {
                        cboTipoSala.SelectedIndex = -1;
                        txtApeCliente.Text = string.Empty;
                        txtFiltroTituloE.Text = string.Empty;
                        dtpDesdeE.Value = DateTime.Now;
                        dtpHastaE.Value = DateTime.Now;
                    }
                    else if (o == txtApeCliente)
                    {
                        cboTipoSala.SelectedIndex = -1;
                        txtNomCliente.Text = string.Empty;
                        txtFiltroTituloE.Text = string.Empty;
                        dtpDesdeE.Value = DateTime.Now;
                        dtpHastaE.Value = DateTime.Now;
                }
                    else if (o == txtFiltroTituloE)
                    {
                        cboTipoSala.SelectedIndex = -1;
                        txtNomCliente.Text = string.Empty;
                        txtApeCliente.Text = string.Empty;
                        dtpDesdeE.Value = DateTime.Now;
                        dtpHastaE.Value = DateTime.Now;
                    }

                }
                else if(o is DateTimePicker)
                {
                    cboTipoSala.SelectedIndex = -1;
                    txtNomCliente.Text = string.Empty;
                    txtApeCliente.Text = string.Empty;
                    txtFiltroTituloE.Text = string.Empty;
                }
        }

        private void frmReporteEntradas_FormClosing(object sender, FormClosingEventArgs e)
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

        private void btnApeCliente_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtApeCliente.Text))
            {
                MessageBox.Show("Debe ingresar apellido de algún cliente", "AVISO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtApeCliente.Focus();

            }
            else
            {
                string sentenciaSQL = "Select p.id_pelicula, p.titulo,f.dia_funcion, " +
                                " c.nombre+' '+c.apellido Cliente, count(*) 'Cantidad_Entradas', dc.monto, " +
                                " ts.tipo_sala, sum(dc.monto) 'Monto_Total' " +
                                " from Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula " +
                                " join Salas_Funciones sf on sf.id_funcion = f.id_funcion " +
                                " join Detalles_Comprobantes dc on dc.id_sala_funcion = sf.id_sala_funcion " +
                                " join Comprobantes_Compras cc on cc.id_comprobante = dc.id_comprobante " +
                                " join Clientes c on c.id_cliente = cc.id_cliente " +
                                " join Salas s on s.id_sala = sf.id_sala " +
                                " join Tipos_Salas ts on ts.id_tipo_sala = s.id_tipo_sala " +
                                " where c.apellido LIKE  '" + txtApeCliente.Text + "%' " +
                                " group by p.id_pelicula,p.titulo,f.id_funcion, f.dia_funcion,c.id_cliente,c.nombre,c.apellido, ts.tipo_sala, dc.monto " +
                                " order by 1 ";

                this.dataTableEntradasOkBindingSource.DataSource = oBD.consultar(sentenciaSQL);
                this.reportViewer2E.RefreshReport();

                this.limpiarMenos(txtApeCliente);
            }
        }
    }
}
