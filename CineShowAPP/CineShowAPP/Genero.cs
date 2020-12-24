using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace CineShowAPP
{
    class Genero:TablaAuxiliar
    {
        Datos oBD = new Datos();

        int pk;
        string genero;

        public Genero()
        {
            this.pk = 0;
            this.genero = "";
        }

        public Genero( int pk, string genero)
        {
            
            this.pk = pk;
            this.genero = genero;
        }

        public int pPk { get => pk; set => pk = value; }
        public string pGenero { get => genero; set => genero = value; }

        override public DataTable recuperarDatos(string nombreTabla)
        {
            return oBD.consultarTabla(nombreTabla);
        }




    }
}
