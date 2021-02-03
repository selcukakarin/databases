namespace raiseError
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblBarkod = new System.Windows.Forms.Label();
            this.txtBarkod = new System.Windows.Forms.TextBox();
            this.btnSql = new System.Windows.Forms.Button();
            this.btnSp = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblBarkod
            // 
            this.lblBarkod.AutoSize = true;
            this.lblBarkod.Location = new System.Drawing.Point(40, 29);
            this.lblBarkod.Name = "lblBarkod";
            this.lblBarkod.Size = new System.Drawing.Size(41, 13);
            this.lblBarkod.TabIndex = 0;
            this.lblBarkod.Text = "Barkod";
            // 
            // txtBarkod
            // 
            this.txtBarkod.Location = new System.Drawing.Point(43, 58);
            this.txtBarkod.Name = "txtBarkod";
            this.txtBarkod.Size = new System.Drawing.Size(205, 20);
            this.txtBarkod.TabIndex = 1;
            // 
            // btnSql
            // 
            this.btnSql.Location = new System.Drawing.Point(43, 103);
            this.btnSql.Name = "btnSql";
            this.btnSql.Size = new System.Drawing.Size(75, 45);
            this.btnSql.TabIndex = 2;
            this.btnSql.Text = "Ürün Oku (SQL)";
            this.btnSql.UseVisualStyleBackColor = true;
            this.btnSql.Click += new System.EventHandler(this.btnSql_Click);
            // 
            // btnSp
            // 
            this.btnSp.Location = new System.Drawing.Point(173, 103);
            this.btnSp.Name = "btnSp";
            this.btnSp.Size = new System.Drawing.Size(75, 59);
            this.btnSp.TabIndex = 3;
            this.btnSp.Text = "Ürün Oku (Stored Procedure)";
            this.btnSp.UseVisualStyleBackColor = true;
            this.btnSp.Click += new System.EventHandler(this.btnSp_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(327, 204);
            this.Controls.Add(this.btnSp);
            this.Controls.Add(this.btnSql);
            this.Controls.Add(this.txtBarkod);
            this.Controls.Add(this.lblBarkod);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblBarkod;
        private System.Windows.Forms.TextBox txtBarkod;
        private System.Windows.Forms.Button btnSql;
        private System.Windows.Forms.Button btnSp;
    }
}

