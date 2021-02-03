using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sqlInjectionProtection
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            System.Data.SqlClient.SqlParameter spName = new System.Data.SqlClient.SqlParameter("@NAME", SqlDbType.VarChar);
            spName.Value = txtName.Text;

            System.Data.SqlClient.SqlParameter spEmail = new System.Data.SqlClient.SqlParameter("@EMAIL", SqlDbType.VarChar);
            spEmail.Value = txtEmail.Text;

            System.Data.SqlClient.SqlParameter spSubject = new System.Data.SqlClient.SqlParameter("@SUBJECT_", SqlDbType.VarChar);
            spSubject.Value = txtSuggestion.Text;

            DataProcess data = new DataProcess();
            data.fill(CommandType.StoredProcedure, "IK.dbo.INSERT_SUGGESTION", spName, spEmail, spSubject);
            MessageBox.Show("Kaydınız başarıyla oluşturuldu.");
        }
    }
}
