using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace CineShowAPP
{
    class Pelicula
    {
        Datos oBD = new Datos();


        int pk;
        string titulo;
        string descripcion;
        int genero;
        int duracion;
        DateTime estreno;
        int idioma;
        int clasificacion;
        int calificacion;
        int nacionalidad;

        public Pelicula()
        {
            this.pk = 0;
            this.titulo = "";
            this.descripcion = "";
            this.genero = 0;
            this.duracion = 0;
            this.estreno = DateTime.Now;
            this.idioma = 0;
            this.clasificacion = 0;
            this.calificacion = 0;
            this.nacionalidad = 0;
        }

        public Pelicula(int pk, string titulo, string descripcion, int genero, int duracion, DateTime estreno, int idioma, int clasificacion, int calificacion, int nacionalidad)
        {
            this.pk = pk;
            this.titulo = titulo;
            this.descripcion = descripcion;
            this.genero = genero;
            this.duracion = duracion;
            this.estreno = estreno;
            this.idioma = idioma;
            this.clasificacion = clasificacion;
            this.calificacion = calificacion;
            this.nacionalidad = nacionalidad;
        }

        public int pPk { get => pk; set => pk = value; }
        public string pTitulo { get => titulo; set => titulo = value; }
        public string pDescripcion { get => descripcion; set => descripcion = value; }
        public int pGenero { get => genero; set => genero = value; }
        public int pDuracion { get => duracion; set => duracion = value; }
        public DateTime pEstreno { get => estreno; set => estreno = value; }
        public int pIdioma { get => idioma; set => idioma = value; }
        public int pClasificacion { get => clasificacion; set => clasificacion = value; }
        public int pCalificacion { get => calificacion; set => calificacion = value; }
        public int pNacionalidad { get => nacionalidad; set => nacionalidad = value; }


        public override string ToString()
        {
            return titulo;
        }

        public DataTable recuperarPeliculas(string nombreTabla)
        {
            string consultaSQL = "";

            return oBD.consultar(consultaSQL);
        }


        public void insertarPeliculas()
        {
            string consultaSQL = "insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) " +
                                                         "values (@titulo,@descripcion,@genero,@duracion,@estreno,@idioma,@clasific,@calific,@nacion)";

            oBD.actualizarConParamteros(consultaSQL, this);
        }

        public void editarPelicula()
        {
            string consultaSQL = "update Peliculas set titulo=@titulo, descripcion=@descripcion, id_genero=@genero, duracion=duracion, fecha_estreno=@estreno, " +
                                                    "id_idioma=@idioma, id_clasificacion=@clasific, id_calificacion=@calific, id_nac=@nacion " +
                                                    "where id_pelicula = @codigo";

            oBD.actualizarConParamteros(consultaSQL, this);
        }

        public void eliminarPelicula()
        {
            string consultaSQL = "delete Peliculas where id_pelicula = @codigo";

            oBD.actualizarConParamteros(consultaSQL, this);
        }


        public List<Pelicula> retornarLista(string nombreTabla)
        {
            List<Pelicula> lP = new List<Pelicula>();

            lP.Clear();
            oBD.leerTabla(nombreTabla);
            while (oBD.pLec.Read())
            {
                Pelicula p = new Pelicula();
                if (!oBD.pLec.IsDBNull(0))
                    p.pPk = oBD.pLec.GetInt32(0);
                if (!oBD.pLec.IsDBNull(1))
                    p.pTitulo = oBD.pLec.GetString(1);
                if (!oBD.pLec.IsDBNull(2))
                    p.pDescripcion = oBD.pLec.GetString(2);
                if (!oBD.pLec.IsDBNull(3))
                    p.pGenero = oBD.pLec.GetInt32(3);
                if (!oBD.pLec.IsDBNull(4))
                    p.pDuracion = oBD.pLec.GetInt32(4);
                if (!oBD.pLec.IsDBNull(5))
                    p.pEstreno = oBD.pLec.GetDateTime(5);
                if (!oBD.pLec.IsDBNull(6))
                    p.pIdioma = oBD.pLec.GetInt32(6);
                if (!oBD.pLec.IsDBNull(7))
                    p.pClasificacion = oBD.pLec.GetInt32(7);
                if (!oBD.pLec.IsDBNull(8))
                    p.pCalificacion = oBD.pLec.GetInt32(8);
                if (!oBD.pLec.IsDBNull(8))
                    p.pNacionalidad = oBD.pLec.GetInt32(9);




                lP.Add(p);


            }
            oBD.pLec.Close();
            oBD.desconectar();

            return lP;



        }
    }
}