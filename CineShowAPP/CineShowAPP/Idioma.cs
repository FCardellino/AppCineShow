using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace CineShowAPP
{
    class Idioma:TablaAuxiliar
    {
        Datos oBD = new Datos();

        int pk;
        string idioma;

        public Idioma()
        {
            this.pk = 0;
            this.idioma = "";
        }

        public Idioma(int pk, string idioma)
        {
            this.pk = pk;
            this.idioma = idioma;
        }

        public int pPk { get => pk; set => pk = value; }
        public string pIdioma { get => idioma; set => idioma = value; }

        override public DataTable recuperarDatos(string nombreTabla)
        {
            return oBD.consultarTabla(nombreTabla);
        }
    }
}
