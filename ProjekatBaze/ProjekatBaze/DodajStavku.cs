using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjekatBaze
{
    public partial class DodajStavku : Form
    {
        private PrikazStavki otac;

        public DodajStavku(PrikazStavki pOtac)
        {
            InitializeComponent();
            otac = pOtac;
            
        }


        public void ocisti() {
            idS.Text =string.Empty;
            kol.Text = string.Empty;
            idR.Text = string.Empty;
            cen.Text = string.Empty;
            vrP.Text = string.Empty;

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            Stavka sta = new Stavka(idS.Text.Trim(), kol.Text.Trim(), cen.Text.Trim(), idR.Text.Trim(), vrP.Text.Trim());
            ObradaStavki.dodajStavku(sta);
            this.Close();



        }

        private void DodajStavku_Load(object sender, EventArgs e)
        {

        }
    }
}
