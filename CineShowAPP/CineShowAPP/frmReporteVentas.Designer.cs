namespace CineShowAPP
{
    partial class frmReporteVentas
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
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource2 = new Microsoft.Reporting.WinForms.ReportDataSource();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource3 = new Microsoft.Reporting.WinForms.ReportDataSource();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmReporteVentas));
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btn_todo = new System.Windows.Forms.Button();
            this.lblHasta = new System.Windows.Forms.Label();
            this.lblInicial = new System.Windows.Forms.Label();
            this.dtp_final = new System.Windows.Forms.DateTimePicker();
            this.dtp_inicial = new System.Windows.Forms.DateTimePicker();
            this.btn_personalizado = new System.Windows.Forms.Button();
            this.btn_anio = new System.Windows.Forms.Button();
            this.btn_30dias = new System.Windows.Forms.Button();
            this.btn_mes = new System.Windows.Forms.Button();
            this.btn_7dias = new System.Windows.Forms.Button();
            this.btn_hoy = new System.Windows.Forms.Button();
            this.VentasNetoPorPeriodoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.DetalleVentaBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.ReporteVentasBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.VentasNetoPorPeriodoBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.DetalleVentaBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ReporteVentasBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            reportDataSource1.Name = "VentasNetoPorPeriodo";
            reportDataSource1.Value = this.VentasNetoPorPeriodoBindingSource;
            reportDataSource2.Name = "DetalleVentas";
            reportDataSource2.Value = this.DetalleVentaBindingSource;
            reportDataSource3.Name = "ReporteVentas";
            reportDataSource3.Value = this.ReporteVentasBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource2);
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource3);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "CineShowAPP.ReporteVentas.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(174, 11);
            this.reportViewer1.Margin = new System.Windows.Forms.Padding(20);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(871, 562);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.ZoomMode = Microsoft.Reporting.WinForms.ZoomMode.PageWidth;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.ControlDark;
            this.panel1.BackgroundImage = global::CineShowAPP.Properties.Resources.pngtree_atmospheric_textured_film_and_television_company_propaganda_background_image_127872;
            this.panel1.Controls.Add(this.btn_todo);
            this.panel1.Controls.Add(this.lblHasta);
            this.panel1.Controls.Add(this.lblInicial);
            this.panel1.Controls.Add(this.dtp_final);
            this.panel1.Controls.Add(this.dtp_inicial);
            this.panel1.Controls.Add(this.btn_personalizado);
            this.panel1.Controls.Add(this.btn_anio);
            this.panel1.Controls.Add(this.btn_30dias);
            this.panel1.Controls.Add(this.btn_mes);
            this.panel1.Controls.Add(this.btn_7dias);
            this.panel1.Controls.Add(this.btn_hoy);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(20);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(176, 584);
            this.panel1.TabIndex = 0;
            // 
            // btn_todo
            // 
            this.btn_todo.BackColor = System.Drawing.Color.PaleTurquoise;
            this.btn_todo.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_todo.FlatAppearance.BorderSize = 0;
            this.btn_todo.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_todo.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_todo.Location = new System.Drawing.Point(9, 430);
            this.btn_todo.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_todo.Name = "btn_todo";
            this.btn_todo.Size = new System.Drawing.Size(157, 42);
            this.btn_todo.TabIndex = 8;
            this.btn_todo.Text = "Mostrar Todo";
            this.btn_todo.UseVisualStyleBackColor = false;
            this.btn_todo.Click += new System.EventHandler(this.button1_Click);
            // 
            // lblHasta
            // 
            this.lblHasta.AutoSize = true;
            this.lblHasta.BackColor = System.Drawing.Color.Transparent;
            this.lblHasta.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHasta.ForeColor = System.Drawing.Color.White;
            this.lblHasta.Location = new System.Drawing.Point(9, 317);
            this.lblHasta.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblHasta.Name = "lblHasta";
            this.lblHasta.Size = new System.Drawing.Size(40, 13);
            this.lblHasta.TabIndex = 9;
            this.lblHasta.Text = "Hasta";
            // 
            // lblInicial
            // 
            this.lblInicial.AutoSize = true;
            this.lblInicial.BackColor = System.Drawing.Color.Transparent;
            this.lblInicial.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblInicial.ForeColor = System.Drawing.Color.White;
            this.lblInicial.Location = new System.Drawing.Point(8, 293);
            this.lblInicial.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblInicial.Name = "lblInicial";
            this.lblInicial.Size = new System.Drawing.Size(43, 13);
            this.lblInicial.TabIndex = 8;
            this.lblInicial.Text = "Desde";
            // 
            // dtp_final
            // 
            this.dtp_final.CustomFormat = "dd/MM/yyyy";
            this.dtp_final.Location = new System.Drawing.Point(50, 315);
            this.dtp_final.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dtp_final.Name = "dtp_final";
            this.dtp_final.Size = new System.Drawing.Size(116, 20);
            this.dtp_final.TabIndex = 6;
            // 
            // dtp_inicial
            // 
            this.dtp_inicial.CustomFormat = "dd/MM/yyyy";
            this.dtp_inicial.Location = new System.Drawing.Point(50, 292);
            this.dtp_inicial.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dtp_inicial.Name = "dtp_inicial";
            this.dtp_inicial.Size = new System.Drawing.Size(116, 20);
            this.dtp_inicial.TabIndex = 5;
            // 
            // btn_personalizado
            // 
            this.btn_personalizado.BackColor = System.Drawing.Color.PaleTurquoise;
            this.btn_personalizado.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_personalizado.FlatAppearance.BorderSize = 0;
            this.btn_personalizado.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_personalizado.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_personalizado.Location = new System.Drawing.Point(9, 338);
            this.btn_personalizado.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_personalizado.Name = "btn_personalizado";
            this.btn_personalizado.Size = new System.Drawing.Size(157, 42);
            this.btn_personalizado.TabIndex = 7;
            this.btn_personalizado.Text = "Personalizado";
            this.btn_personalizado.UseVisualStyleBackColor = false;
            this.btn_personalizado.Click += new System.EventHandler(this.btn_personalizado_Click);
            // 
            // btn_anio
            // 
            this.btn_anio.BackColor = System.Drawing.Color.PaleTurquoise;
            this.btn_anio.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_anio.FlatAppearance.BorderSize = 0;
            this.btn_anio.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_anio.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_anio.Location = new System.Drawing.Point(9, 198);
            this.btn_anio.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_anio.Name = "btn_anio";
            this.btn_anio.Size = new System.Drawing.Size(157, 42);
            this.btn_anio.TabIndex = 4;
            this.btn_anio.Text = "Este Año";
            this.btn_anio.UseVisualStyleBackColor = false;
            this.btn_anio.Click += new System.EventHandler(this.btn_anio_Click);
            // 
            // btn_30dias
            // 
            this.btn_30dias.BackColor = System.Drawing.Color.PaleTurquoise;
            this.btn_30dias.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_30dias.FlatAppearance.BorderSize = 0;
            this.btn_30dias.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_30dias.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_30dias.Location = new System.Drawing.Point(9, 151);
            this.btn_30dias.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_30dias.Name = "btn_30dias";
            this.btn_30dias.Size = new System.Drawing.Size(157, 42);
            this.btn_30dias.TabIndex = 3;
            this.btn_30dias.Text = "Ultimos 30 Dias";
            this.btn_30dias.UseVisualStyleBackColor = false;
            this.btn_30dias.Click += new System.EventHandler(this.btn_30dias_Click);
            // 
            // btn_mes
            // 
            this.btn_mes.BackColor = System.Drawing.Color.PaleTurquoise;
            this.btn_mes.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_mes.FlatAppearance.BorderSize = 0;
            this.btn_mes.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_mes.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_mes.Location = new System.Drawing.Point(9, 104);
            this.btn_mes.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_mes.Name = "btn_mes";
            this.btn_mes.Size = new System.Drawing.Size(157, 42);
            this.btn_mes.TabIndex = 2;
            this.btn_mes.Text = "Este Mes";
            this.btn_mes.UseVisualStyleBackColor = false;
            this.btn_mes.Click += new System.EventHandler(this.btn_mes_Click);
            // 
            // btn_7dias
            // 
            this.btn_7dias.BackColor = System.Drawing.Color.PaleTurquoise;
            this.btn_7dias.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_7dias.FlatAppearance.BorderSize = 0;
            this.btn_7dias.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_7dias.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_7dias.Location = new System.Drawing.Point(9, 57);
            this.btn_7dias.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_7dias.Name = "btn_7dias";
            this.btn_7dias.Size = new System.Drawing.Size(157, 42);
            this.btn_7dias.TabIndex = 1;
            this.btn_7dias.Text = "Ultimos 7 Dias";
            this.btn_7dias.UseVisualStyleBackColor = false;
            this.btn_7dias.Click += new System.EventHandler(this.btn_7dias_Click);
            // 
            // btn_hoy
            // 
            this.btn_hoy.BackColor = System.Drawing.Color.PaleTurquoise;
            this.btn_hoy.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_hoy.FlatAppearance.BorderSize = 0;
            this.btn_hoy.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_hoy.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_hoy.Location = new System.Drawing.Point(9, 10);
            this.btn_hoy.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_hoy.Name = "btn_hoy";
            this.btn_hoy.Size = new System.Drawing.Size(157, 42);
            this.btn_hoy.TabIndex = 0;
            this.btn_hoy.Text = "Hoy";
            this.btn_hoy.UseVisualStyleBackColor = false;
            this.btn_hoy.Click += new System.EventHandler(this.btn_hoy_Click);
            // 
            // VentasNetoPorPeriodoBindingSource
            // 
            this.VentasNetoPorPeriodoBindingSource.DataSource = typeof(CineShowAPP.VentasNetoPorPeriodo);
            // 
            // DetalleVentaBindingSource
            // 
            this.DetalleVentaBindingSource.DataSource = typeof(CineShowAPP.DetalleVenta);
            // 
            // ReporteVentasBindingSource
            // 
            this.ReporteVentasBindingSource.DataSource = typeof(CineShowAPP.ReporteVentas);
            // 
            // frmReporteVentas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackgroundImage = global::CineShowAPP.Properties.Resources.pngtree_atmospheric_textured_film_and_television_company_propaganda_background_image_127872;
            this.ClientSize = new System.Drawing.Size(1056, 584);
            this.Controls.Add(this.reportViewer1);
            this.Controls.Add(this.panel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "frmReporteVentas";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Reporte Ventas";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmReporteVentas_FormClosing);
            this.Load += new System.EventHandler(this.frmReporteVentas_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.VentasNetoPorPeriodoBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.DetalleVentaBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ReporteVentasBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource VentasNetoPorPeriodoBindingSource;
        private System.Windows.Forms.BindingSource DetalleVentaBindingSource;
        private System.Windows.Forms.BindingSource ReporteVentasBindingSource;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btn_personalizado;
        private System.Windows.Forms.Button btn_anio;
        private System.Windows.Forms.Button btn_30dias;
        private System.Windows.Forms.Button btn_mes;
        private System.Windows.Forms.Button btn_7dias;
        private System.Windows.Forms.Button btn_hoy;
        private System.Windows.Forms.DateTimePicker dtp_final;
        private System.Windows.Forms.DateTimePicker dtp_inicial;
        private System.Windows.Forms.Label lblHasta;
        private System.Windows.Forms.Label lblInicial;
        private System.Windows.Forms.Button btn_todo;
    }
}