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
    public partial class PrikazR : Form
    {
        
        public PrikazR()
        {
            InitializeComponent();
           
           
        }

        public void Display()
        {
            ObradaRacuna.DisplayAndSearch("SELECT idRacuna,Datum,Cena,idKase FROM `benzinska_pumpa`.`racun`", dataGridView);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Display();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            PrikazP prikP = new PrikazP();
        
            prikP.ShowDialog();
            
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            PrikazStavki pr = new PrikazStavki(false,"");
            pr.ShowDialog();
           
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {


            if (e.ColumnIndex == 1)
            {

                PrikazStavki pr = new PrikazStavki(true, dataGridView.Rows[e.RowIndex].Cells[3].Value.ToString());
                
                pr.ShowDialog();
               
                
               
            }


            if (e.ColumnIndex == 2)
            {
                if (MessageBox.Show("Da li zaista želite da obrišete račun?", "Information", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) == DialogResult.Yes)
                {
                    ObradaRacuna.obrisiRacun(dataGridView.Rows[e.RowIndex].Cells[3].Value.ToString());
                    Display();
                }
                return;
            }
        }
    }
}
