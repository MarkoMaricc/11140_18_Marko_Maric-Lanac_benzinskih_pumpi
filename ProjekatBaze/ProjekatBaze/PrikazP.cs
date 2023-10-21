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
    public partial class PrikazP : Form
    {

        IzmjenaProizvoda proiz;
        public PrikazP()
        {
            InitializeComponent();
            proiz = new IzmjenaProizvoda(this);
        }


        public void Display()
        {
            ObradaRacuna.DisplayAndSearch("SELECT Vrsta,Cena,idSkladista FROM `benzinska_pumpa`.`proizvod`", dataGridView1);
        }

        private void PrikazP_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Display();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
               
                {

                    proiz.ocisti();
                    proiz.vrsta = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                    proiz.ShowDialog();
                   
                    Display();
                }
                return;
            }
        }
    }
}
