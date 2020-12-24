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
    public partial class frmPelicula : Form
    {
        Calificacion oCalif = new Calificacion();
        Clasificacion oClasif = new Clasificacion();
        Genero oGen = new Genero();
        Idioma oIdio = new Idioma();
        Nacionalidad oNac = new Nacionalidad();
        Pelicula oPel = new Pelicula();
        List<Pelicula> lPel = new List<Pelicula>();


        enum picks
        {
            nuevo, editar
        }

        picks misPicks;

        public frmPelicula()
        {
            InitializeComponent();
        }

        private void frmPelicula_Load(object sender, EventArgs e)
        {
            cargarCombo(oNac, cboNacionalidad, "Nacionalidades");
          
            cargarCombo(oGen, cboGenero, "Generos");
            cargarCombo(oIdio, cboIdioma, "Idiomas");
            cargarCombo(oClasif, cboClasificacion, "Clasificaciones");
            cargarCombo(oCalif, cboCalificacion, "Calificacion");

            cargarLista("Peliculas");

            habilitar(false);
            misPicks = picks.editar;
        }

        private void habilitar(bool x)//x valen un valor bool y !x valen el contrario a ese valor boole pasado
        {
            txtCodigo.Enabled = x;
            txtDescripcion.Enabled = x;
            cboCalificacion.Enabled = x;
            cboClasificacion.Enabled = x;
            cboGenero.Enabled = x;
            cboIdioma.Enabled = x;
            cboNacionalidad.Enabled = x;
            dtpEstreno.Enabled = x;
            txtDuracion.Enabled = x;
            txtTitulo.Enabled = x;
            btnCancelar.Enabled = x;
            btnGrabar.Enabled = x;
            btnNuevo.Enabled = !x;
            btnEditar.Enabled = !x;
            btnBorrar.Enabled = !x;
            btnSalir.Enabled = !x;
            lstPeliculas.Enabled = !x;
        }

        private void cargarLista(string nombreTabla)
        {
            //Pelicula oPel = new Pelicula();
            //List<Pelicula> lPel = new List<Pelicula>();
            lPel = oPel.retornarLista(nombreTabla);
            lstPeliculas.Items.Clear();
            
            for (int i = 0; i < lPel.Count; i++)
            {
                lstPeliculas.Items.Add(lPel[i].ToString());
            }
            lstPeliculas.SelectedIndex = 0;
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

        private void limpiar()
        {
            txtCodigo.Clear();
            txtDescripcion.Clear();
            txtDuracion.Clear();
            txtTitulo.Clear();
            cboCalificacion.SelectedIndex = -1;
            cboClasificacion.SelectedIndex = -1;
            cboGenero.SelectedIndex = -1;
            cboIdioma.SelectedIndex = -1;
            cboNacionalidad.SelectedIndex = -1;
            dtpEstreno.Value = DateTime.Now;
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            habilitar(true);
            txtCodigo.Enabled = false;
            misPicks = picks.nuevo;
            this.limpiar();
            txtTitulo.Focus();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            habilitar(true);
            txtCodigo.Enabled = false;
            txtTitulo.Focus();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            misPicks = picks.editar;
            habilitar(false);
            this.limpiar();
            cargarCampos(lstPeliculas.SelectedIndex);
        }

        private void lstPeliculas_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarCampos(lstPeliculas.SelectedIndex);
        }

        private void cargarCampos(int i)
        {
            
            
            txtCodigo.Text = lPel[i].pPk.ToString();
            txtTitulo.Text = lPel[i].pTitulo;
            cboGenero.SelectedValue = lPel[i].pGenero;
            txtDuracion.Text = lPel[i].pDuracion.ToString();
            dtpEstreno.Value = lPel[i].pEstreno;
            cboIdioma.SelectedValue = lPel[i].pIdioma;
            cboClasificacion.SelectedValue = lPel[i].pClasificacion;
            cboCalificacion.SelectedValue = lPel[i].pCalificacion;
            cboNacionalidad.SelectedValue = lPel[i].pNacionalidad;
            txtDescripcion.Text = lPel[i].pDescripcion;

        }

        private void btnGrabar_Click(object sender, EventArgs e)
        {

            if (validarDatos())
            {
                Pelicula p = new Pelicula();

                p.pTitulo = txtTitulo.Text;
                p.pDescripcion = txtDescripcion.Text;
                p.pGenero = (int)cboGenero.SelectedValue;
                p.pDuracion = int.Parse(txtDuracion.Text);
                p.pEstreno = dtpEstreno.Value;
                p.pIdioma = (int)cboIdioma.SelectedValue;
                p.pClasificacion = (int)cboClasificacion.SelectedValue;
                p.pCalificacion = (int)cboCalificacion.SelectedValue;
                p.pNacionalidad = (int)cboNacionalidad.SelectedValue;


                if (misPicks == picks.nuevo)
                {
                    if (peliculaExistente(p.pTitulo,p.pEstreno,p.pIdioma))
                    {
                        p.insertarPeliculas();
                        cargarLista("Peliculas");
                    }
                    



                }
                else
                {
                    p.pPk = int.Parse(txtCodigo.Text);
                    p.editarPelicula();
                    cargarLista("Peliculas");
                }
                misPicks = picks.editar;
                habilitar(false);
            }
            
            



        }

        private bool peliculaExistente(string titulo, DateTime fecha, int idioma)
        {
            bool respuesta = true;

            for (int i = 0; i < lPel.Count; i++)
            {
                if(lPel[i].pTitulo == titulo)
                {
                    if(lPel[i].pEstreno.Date == fecha.Date)
                    {
                        if(lPel[i].pIdioma == idioma)
                        {
                            if (MessageBox.Show("La película " + titulo + " ya figura en la Base de Datos (id_Pelicula: " + lPel[i].pPk + "). Está seguro que desea ingresarla nuevamente?",
                                        "AvISO", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                            {
                                
                                respuesta = true;
                            }
                            else
                            {
                                lstPeliculas.SelectedItem = lPel[i].pTitulo;
                                respuesta = false;
                            }
                                
                        }
                        
                    }
                }
            }

            return respuesta;
        }

        private bool validarDatos()
        {
            if (string.IsNullOrWhiteSpace(txtTitulo.Text))
            {
                MessageBox.Show("Falta ingresar un Titulo.");
                txtTitulo.Focus();
                return false;
            }

            if(txtTitulo.Text.Length > 70)
            {
                MessageBox.Show("El Titulo no debe superar los 70 caracteres, incluidos espacios.");
                txtTitulo.Focus();
                return false;
            }

            if(cboGenero.SelectedIndex == -1)
            {
                MessageBox.Show("Debe indicar un Género.");
                cboGenero.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtDuracion.Text))
            {
                MessageBox.Show("Debe ingresar los minutos de Duración.");
                txtDuracion.Focus();
                return false;
            }

            if (cboIdioma.SelectedIndex == -1)
            {
                MessageBox.Show("Debe indicar un Idioma.");
                cboIdioma.Focus();
                return false;
            }

            if (cboCalificacion.SelectedIndex == -1)
            {
                MessageBox.Show("Debe idicar un Puntaje.");
                cboCalificacion.Focus();
                return false;
            }

            if (cboClasificacion.SelectedIndex == -1)
            {
                MessageBox.Show("Debe indicar una Categoría.");
                cboClasificacion.Focus();
                return false;
            }

            if (cboNacionalidad.SelectedIndex == -1)
            {
                MessageBox.Show("Debe indicar una País.");
                cboNacionalidad.Focus();
                return false;
            }

            if (txtDescripcion.Text.Length > 280)
            {
                MessageBox.Show("El Resumen no debe superar los 280 caracteres, incluidos espacios.");
                txtDescripcion.Focus();
                return false;
            }

            return true;
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            

            int b = lstPeliculas.SelectedIndex;

            if (MessageBox.Show("Esta seguro que desea borra la Película: " + lPel[b].pTitulo, "BORRANDO",
                                MessageBoxButtons.YesNo,
                                MessageBoxIcon.Warning,
                                MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                
                lPel[b].eliminarPelicula();
                cargarLista("Peliculas");
                this.limpiar();
                cargarCampos(lstPeliculas.SelectedIndex);


            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmPelicula_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Está seguro que desea salir?", "SALIENDO",
                                MessageBoxButtons.YesNo,
                                MessageBoxIcon.Question,
                                MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                e.Cancel = false;
            else
                e.Cancel = true;
        }

        private void txtDescripcion_TextChanged(object sender, EventArgs e)
        {
            lblCantCaract.Text = Convert.ToString(txtDescripcion.Text.Length);
        }
    }
}
