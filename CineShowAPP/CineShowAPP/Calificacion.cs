using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace CineShowAPP
{
    class Calificacion:TablaAuxiliar
    {
        Datos oBD = new Datos();



        int pk;
        string puntaje;

        public Calificacion()
        {
            this.pk = 0;
            this.puntaje = "";
        }

        public Calificacion(int pk, string puntaje)
        {
            this.pk = pk;
            this.puntaje = puntaje;
        }

        public int pPk { get => pk; set => pk = value; }
        public string pPuntaje { get => puntaje; set => puntaje = value; }


        override public DataTable recuperarDatos(string nombreTabla)
        {
            return oBD.consultarTabla(nombreTabla);
        }
    }
}
