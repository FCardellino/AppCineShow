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
    public partial class frmAPPCineShow : Form
    {
        Datos oBase = new Datos();//Data Source=localhost;Initial Catalog=CineSHOW;Integrated Security=True

        List<string> listaProcAlamcenados = new List<string>();


        //funcionalidad basica del form
        public frmAPPCineShow()
        {
            InitializeComponent();
            
        }

        void LimpiarGrillas()
        {
            limpiarGrilla(dgvConsuta1);
            limpiarGrilla(dgvConsulta2);
            limpiarGrilla(dgvConsulta3);
            limpiarGrilla(dgvConsulta4);
            limpiarGrilla(dgvConsulta5);
            limpiarGrilla(dgvConsulta6);
            limpiarGrilla(dgvConsulta7);
            limpiarGrilla(dgvConsulta8);
        }

        private void rbtTabConsulta1_CheckedChanged(object sender, EventArgs e)
        {
            LimpiarGrillas();
            tabControlPrincipal.SelectedTab = tabControlPrincipal.TabPages[0];
        }

        private void rbtTabConsulta2_CheckedChanged(object sender, EventArgs e)
        {
            LimpiarGrillas();
            tabControlPrincipal.SelectedTab = tabControlPrincipal.TabPages[1];
        }

        private void rbtTabConsulta3_CheckedChanged(object sender, EventArgs e)
        {
            LimpiarGrillas();
            tabControlPrincipal.SelectedTab = tabControlPrincipal.TabPages[2];
        }

        private void rbtTabConsulta4_CheckedChanged(object sender, EventArgs e)
        {
            LimpiarGrillas();
            tabControlPrincipal.SelectedTab = tabControlPrincipal.TabPages[3];
        }

        private void rbtTabConsulta5_CheckedChanged(object sender, EventArgs e)
        {
            LimpiarGrillas();
            tabControlPrincipal.SelectedTab = tabControlPrincipal.TabPages[4];
        }

        private void rbtTabConsulta6_CheckedChanged(object sender, EventArgs e)
        {
            LimpiarGrillas();
            tabControlPrincipal.SelectedTab = tabControlPrincipal.TabPages[5];
        }

        private void rbtTabConsulta7_CheckedChanged(object sender, EventArgs e)
        {
            LimpiarGrillas();
            tabControlPrincipal.SelectedTab = tabControlPrincipal.TabPages[6];
        }

        private void rbtTabConsulta8_CheckedChanged(object sender, EventArgs e)
        {
            LimpiarGrillas();
            tabControlPrincipal.SelectedTab = tabControlPrincipal.TabPages[7];
        }

        private void frmAPPCineShow_FormClosing(Object sender, FormClosingEventArgs e)
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

        private void frmAPPCineShow_Load(object sender, EventArgs e)
        {
            listaProcAlamcenados.Clear();
            listaProcAlamcenados.Add( "exec sp_consulta_filtroGenero @genero = '%anim%'");//0
            listaProcAlamcenados.Add("exec sp_consulta_filtroGenero @genero = '%susp%'");//1
            listaProcAlamcenados.Add("exec sp_consulta_filtroGenero @genero = '%dram%'");//2
            listaProcAlamcenados.Add("exec sp_consulta_filtroGenero @genero = '%crim%'");//3
            listaProcAlamcenados.Add("exec sp_consulta_filtroGenero @genero = '%acc%'");//4
            listaProcAlamcenados.Add("exec sp_ImporteTot_Sup_o_Igual_PromMensual");//5
            listaProcAlamcenados.Add("exec sp_Consulta1_SinFiltros");//6
            listaProcAlamcenados.Add("exec sp_Consulta1_Original");//7
            listaProcAlamcenados.Add("exec sp_Consulta2_Original");//8
            listaProcAlamcenados.Add("exec sp_Consulta2_anioPasado");//9
            listaProcAlamcenados.Add("exec sp_Consulta2_SinFiltro");//10
            listaProcAlamcenados.Add("exec sp_Consulta3_Original");//11
            listaProcAlamcenados.Add("exec sp_Consulta4_Original");//12
            listaProcAlamcenados.Add("exec sp_Consulta4_EsteAnio");//13
            listaProcAlamcenados.Add("exec sp_Consulta7_TicketsSupProm");//14
            listaProcAlamcenados.Add("exec sp_Consulta7_Original");//15

            cargarCombo(cboFiltroGenero);
            cheksOn(false);


        }
        //-------------------------------------------

        //FER
        //Consulta1
        private void cheksOn(bool v)
        {
            rbtFiltroGenero.Checked = v;
            rbtFiltroSubconsulta.Checked = v;
            chkSentenciaBase.Checked = v;
            rbtPelisEstrenoMundial.Checked = v;
            rbtPelisAnioAnterior.Checked = v;
            rbtImportesSupEsteAnio.Checked = v;
            rbtMesesMayorRendimiento.Checked = v;
            rbtHistoricoTicketsTotal.Checked = v;
            rbtHistoricoTicketsPeliSupMinutoProm.Checked = v;
            rbtClientesPremium.Checked = v;
            rbtTodosClientes.Checked = v;
            rbtTodosRating.Checked = v;
            rbtMostrarMayorRating.Checked = v;
            chkDetalleAnioAnterior.Checked = v;
        }

        private void cargarCombo(ComboBox combo)
        {
            //hago este metodo, que no es de la forma ideal, solo para mostrar los generos
            //que si devuelven algo
            combo.Items.Add("Anmimación");
            combo.Items.Add("Suspenso");
            combo.Items.Add("Drama");
            combo.Items.Add("Crimen");
            combo.Items.Add("Acción");
            combo.SelectedIndex = -1;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
            combo.Enabled = false;
        }

        private void btnMostrarConsulta1_Click(object sender, EventArgs e)
        {
            string sentenciaSQL = "";
            DataTable tb = new DataTable();

            limpiarGrilla(dgvConsuta1);

            if (rbtFiltroGenero.Checked)
            {
                if(cboFiltroGenero.SelectedIndex == -1)
                {
                    MessageBox.Show("Por favor elija un género");
                    return;
                }
                sentenciaSQL=elegirSentencia(cboFiltroGenero.SelectedIndex+1);
                tb=oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsuta1.DataSource = tb;
                rbtFiltroGenero.Checked = false;
                
            }
            else if (rbtFiltroSubconsulta.Checked)
            {
                sentenciaSQL = listaProcAlamcenados[5];
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsuta1.DataSource = tb;
            }
            else if (chkSentenciaBase.Checked)
            {
                sentenciaSQL = listaProcAlamcenados[7];
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsuta1.DataSource = tb;
            }
            else
            {
                sentenciaSQL = listaProcAlamcenados[6];
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsuta1.DataSource = tb;
            }

           


            cboFiltroGenero.Enabled = false;
            cheksOn(false);

        }

        private void limpiarGrilla(DataGridView nombreGrilla)
        {
            nombreGrilla.DataSource = null;//asi se limpia la grilla
            nombreGrilla.Rows.Clear();//con estas dos lineas
        }

        private string elegirSentencia(int i)
        {
            //este metodo es para no poner todas las sentencias dentro del boton, segun el numero q se le pase al metodo es la sentencia
            //q enviará a sql
            string sentencia = "";
            if(i >= 1 && i <= 6)
            {
                sentencia = listaProcAlamcenados[i - 1];
            }
            /*
            switch (i)
            {
                //CONSULTA 1
                //si elige por genero
                //anim
                case 1: sentencia = listaProcAlamcenados[0]; 
                    break;
                
                //suspenso
                case 2: sentencia = listaProcAlamcenados[1];
                        
                    break;
                //drama
                case 3:
                    sentencia = listaProcAlamcenados[2];
                        
                    break;
                //crimen
                case 4:
                    sentencia = listaProcAlamcenados[3];
                       
                    break;
                //accion
                case 5:
                    sentencia = listaProcAlamcenados[4];
                        
                    break;
                //si elige filtro deimporte mayor o superior al primedio mensual
                case 6:
                    sentencia = listaProcAlamcenados[5];
                       
                    break;
                
                default:
                    break;
            }
            */
            return sentencia;
        }

        private void rbtFiltroGenero_CheckedChanged(object sender, EventArgs e)
        {

            cboFiltroGenero.Enabled = true;

        }

        private void rbtFiltroSubconsulta_CheckedChanged(object sender, EventArgs e)
        {
            cboFiltroGenero.Enabled = false;
        }

        //---------------------------------------------------------

        //Consulta 2

        private void btnConsulta2_Click(object sender, EventArgs e)
        {
            string sentenciaSQL = "";
            DataTable tb = new DataTable();
            limpiarGrilla(dgvConsulta2);

            if (rbtPelisEstrenoMundial.Checked)
            {
                sentenciaSQL = listaProcAlamcenados[8];
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta2.DataSource = tb;
                dgvConsulta2.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
            }
            else if (rbtPelisAnioAnterior.Checked)
            {
                sentenciaSQL = listaProcAlamcenados[9];
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta2.DataSource = tb;
                dgvConsulta2.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
            }
            else
            {
                sentenciaSQL = listaProcAlamcenados[10];
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta2.DataSource = tb;
                dgvConsulta2.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta2.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
            }
            


            
            cheksOn(false);
        }

        private void btnConsulta3_Click(object sender, EventArgs e)
        {
            string sentenciaSQL = "exec sp_Consulta3_Original";
            DataTable tb = new DataTable();
            limpiarGrilla(dgvConsulta3);
            tb = oBase.consultarProcedimiento(sentenciaSQL);
            dgvConsulta3.DataSource = tb;
            dgvConsulta3.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
            dgvConsulta3.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
            dgvConsulta3.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
            dgvConsulta3.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
            dgvConsulta3.Columns[4].SortMode = DataGridViewColumnSortMode.NotSortable;
            
        }

        private void btnConsulta4_Click(object sender, EventArgs e)
        {
            string sentenciaSQL = "";
            DataTable tb = new DataTable();
            limpiarGrilla(dgvConsulta4);

            if (rbtMesesMayorRendimiento.Checked)
            {
                sentenciaSQL = "exec sp_Consulta4_Original";//12
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta4.DataSource = tb;
                dgvConsulta4.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta4.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta4.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta4.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;

            }
            else if (rbtImportesSupEsteAnio.Checked)
            {
                sentenciaSQL = listaProcAlamcenados[13];//"exec sp_Consulta4_EsteAnio";//13
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta4.DataSource = tb;
                dgvConsulta4.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta4.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta4.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta4.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
            }
            else
            {
                MessageBox.Show("Debe elegir un filtro");
            }

            cheksOn(false);

        }

        private void btnConsulta7_Click(object sender, EventArgs e)
        {
            string sentenciaSQL = "";
            DataTable tb = new DataTable();
            limpiarGrilla(dgvConsulta7);
            if (rbtHistoricoTicketsTotal.Checked)
            {
                sentenciaSQL = "exec sp_Consulta7_TicketsSupProm";//14
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta7.DataSource = tb;
                dgvConsulta7.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta7.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta7.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;



            }
            else if (rbtHistoricoTicketsPeliSupMinutoProm.Checked)
            {
                sentenciaSQL = "exec sp_Consulta7_Original";//15
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta7.DataSource = tb;
                dgvConsulta7.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta7.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta7.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;


            }
            else
            {
                MessageBox.Show("Debe elegir un filtro");
            }

            cheksOn(false);
        }

        private void btnConsulta8_Click(object sender, EventArgs e)
        {
            string sentenciaSQL = "";
            DataTable tb = new DataTable();
            limpiarGrilla(dgvConsulta8);
            if (rbtTodosClientes.Checked)
            {
                sentenciaSQL = "exec sp_Consulta8_TodosClientes";
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta8.DataSource = tb;
                dgvConsulta8.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta8.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta8.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;



            }
            else if (rbtClientesPremium.Checked)
            {
                sentenciaSQL = "exec sp_Consulta8_original";
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta8.DataSource = tb;
                dgvConsulta8.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta8.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta8.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;


            }
            else
            {
                MessageBox.Show("Debe elegir un filtro");
            }

            cheksOn(false);
        }

        private void btnConsulta5_Click(object sender, EventArgs e)
        {
            string sentenciaSQL = "";
            DataTable tb = new DataTable();
            limpiarGrilla(dgvConsulta5);
            if (rbtTodosRating.Checked)
            {
                sentenciaSQL = "exec sp_Consulta5_PuntajesTodos";
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta5.DataSource = tb;
                dgvConsulta5.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta5.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta5.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta5.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta5.Columns[4].SortMode = DataGridViewColumnSortMode.NotSortable;



            }
            else if (rbtMostrarMayorRating.Checked)
            {
                sentenciaSQL = "exec sp_Consulta5_Original";
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta5.DataSource = tb;
                dgvConsulta5.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta5.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta5.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta5.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta5.Columns[4].SortMode = DataGridViewColumnSortMode.NotSortable;


            }
            else
            {
                MessageBox.Show("Debe elegir un filtro");
            }

            cheksOn(false);
        }

        private void btnConsulta6_Click(object sender, EventArgs e)
        {
            string sentenciaSQL = "";
            DataTable tb = new DataTable();
            limpiarGrilla(dgvConsulta6);

            if (chkDetalleAnioAnterior.Checked)
            {
                sentenciaSQL = "exec sp_Consulta6_Original";
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta6.DataSource = tb;
                dgvConsulta6.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta6.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta6.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta6.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta6.Columns[4].SortMode = DataGridViewColumnSortMode.NotSortable;


            }
            else
            {

                sentenciaSQL = "exec sp_Consulta6_MinutosTotales";
                tb = oBase.consultarProcedimiento(sentenciaSQL);
                dgvConsulta6.DataSource = tb;
                dgvConsulta6.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta6.Columns[1].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta6.Columns[2].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta6.Columns[3].SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvConsulta6.Columns[4].SortMode = DataGridViewColumnSortMode.NotSortable;


            }



            cheksOn(false);
        }

        private void tabConsulta1_Click(object sender, EventArgs e)
        {

        }




        













    }
}
