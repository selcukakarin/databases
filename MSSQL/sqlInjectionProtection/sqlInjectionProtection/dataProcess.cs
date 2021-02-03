using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sqlInjectionProtection
{
    class DataProcess
    {
        public string cs = "Server=.; Database= TIGER2; Integrated Security=True;";

        public DataSet fill(CommandType commandType,string commandText,params SqlParameter[] parameters)
        {
            SqlConnection conn = new SqlConnection(cs);
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand(commandText, conn);
            cmd.CommandType = commandType;
            cmd.CommandTimeout = 200;
            int i;
            for (i = 0; (i <= (parameters.Length - 1)); i++)
            {
                cmd.Parameters.Add(parameters[i]);
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }

    }
}
