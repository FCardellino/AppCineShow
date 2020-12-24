using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace CineShowAPP
{
    class Nacionalidad : TablaAuxiliar
    {
        Datos oBD = new Datos();

        int pk;
        string nac;

        public Nacionalidad()
        {
            this.pk = 0;
            this.nac = "";
        }

        public Nacionalidad(int pk, string nac)
        {
            this.pk = pk;
            this.nac = nac;
        }

        public int pPk { get => pk; set => pk = value; }
        public string pNac { get => nac; set => nac = value; }


        override public DataTable recuperarDatos(string nombreTabla)
        {
            return oBD.consultarTabla(nombreTabla);
        }
    }
}
