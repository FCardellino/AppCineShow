using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace CineShowAPP
{
    abstract class TablaAuxiliar
    {

        abstract public DataTable recuperarDatos(string nombreTabla);
        
    }
}
