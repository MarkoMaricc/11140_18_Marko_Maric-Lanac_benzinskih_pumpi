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
    public partial class PrikazStavki : Form
    {

        DodajStavku sta;
        public bool ispis = false;
        public string idRacuna;
        public PrikazStavki(bool tekst,string id)
        {
            InitializeComponent();
            label3.Text = "";
            ispis = tekst;
            idRacuna = id;
           if (ispis)
                label3.Text += (" na racunu: " + idRacuna);
            sta = new DodajStavku(this);

        }

        public void Display()
        {
            if(!ispis)
            ObradaRacuna.DisplayAndSearch("SELECT idStavke,Kolicina,Cena,idRacuna,PROIZVOD_Vrsta FROM `benzinska_pumpa`.`stavka`", dataGridView2);
            else
            ObradaRacuna.DisplayAndSearch("SELECT idStavke,Kolicina,Cena,idRacuna,PROIZVOD_Vrsta FROM `benzinska_pumpa`.`stavka` WHERE idRacuna="+idRacuna, dataGridView2);
        }

        private void PrikazStavki_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Display();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            sta.ocisti();
           sta.ShowDialog();
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                if (MessageBox.Show("Da li zaista želite da obrišete stavku?", "Information", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) == DialogResult.Yes)
                {
                   ObradaStavki.obrisiStavku(dataGridView2.Rows[e.RowIndex].Cells[1].Value.ToString());
                    Display();
                }
                return;
            }

        }

        
    }
}
