using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineShowAPP
{
    class Salas:TablaAuxiliar 
    {
        Datos oBD = new Datos();

        int pk;
        string tipo_sala;

        public Salas()
        {
            this.pk = 0;
            this.tipo_sala = "";
        }

        public Salas(int pk, string tipo_sala)
        {
            this.pk = pk;
            this.tipo_sala = tipo_sala;
        }

        public string pTipo_sala { get => tipo_sala; set => tipo_sala = value; }
        public int pPk { get => pk; set => pk = value; }

        override public DataTable recuperarDatos(string nombreTabla)
        {
            return oBD.consultarTabla(nombreTabla);
        }
    }
}
