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
    public partial class IzmjenaProizvoda : Form
    {
        PrikazP root;
       public String vrsta;
        public IzmjenaProizvoda(PrikazP otac)
        {
            InitializeComponent();
            root = otac;


        }

        public void ocisti() {

            vrsta = "";
            //textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
        }

        private void IzmjenaProizvoda_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void izmjeni_Click(object sender, EventArgs e)
        {
            Proizvod pro = new Proizvod(vrsta.Trim(),textBox2.Text.Trim(),textBox3.Text.Trim());
            ObradaProizvoda.izmjenaProizvoda(pro,vrsta);
            this.Close();

        }
    }
}
