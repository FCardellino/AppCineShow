using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace CineShowAPP
{
    class Clasificacion:TablaAuxiliar
    {
        Datos oBD = new Datos();


        int pk;
        string categoria;

        public Clasificacion()
        {
            this.pk = 0;
            this.categoria = "";
        }

        public Clasificacion(int pk, string categoria)
        {
            this.pk = pk;
            this.categoria = categoria;
        }

        public int pPk { get => pk; set => pk = value; }
        public string pCategoria { get => categoria; set => categoria = value; }


        override public DataTable recuperarDatos(string nombreTabla)
        {
            return oBD.consultarTabla(nombreTabla);
        }


    }
}
