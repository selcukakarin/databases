using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace raiseError
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnSql_Click(object sender, EventArgs e)
        {
            string sql = "select * from TIGER2.dbo.LG_217_ITEMS where CODE='" + txtBarkod.Text + "'";
            string conStr = "Server=.; Database= TIGER2; Integrated Security=True;";
            DataSet ds = getDataSetFunc(conStr, sql);

            if (ds.Tables[0].Rows.Count == 0)
            {
                MessageBox.Show("Ürün bulunamadı.");
            }
            else
            {
                lblBarkod.Text = ds.Tables[0].Rows[0]["NAME"].ToString();
            }
            
        }

        private void btnSp_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "EXEC TIGER2.DBO.GET_BARCODE_INFO'" + txtBarkod.Text + "'";
                string conStr = "Server=.; Database= TIGER2; Integrated Security=True;";
                DataSet ds=getDataSetFunc(conStr, sql);
                lblBarkod.Text = ds.Tables[0].Rows[0]["NAME"].ToString();

            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public DataSet getDataSetFunc(string ConnectionString, string SQL)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = SQL;
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();

            conn.Open();
            da.Fill(ds);
            conn.Close();

            return ds;
        }
    }
}
