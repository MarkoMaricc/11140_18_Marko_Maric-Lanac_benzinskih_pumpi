using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;
using System.Windows.Forms;


namespace ProjekatBaze
{

    


    class ObradaProizvoda
    {
        public static MySqlConnection GetConnection()
        {
            string sql = " datasource = localhost; port = 3306; username = root; password = zvezda888; database = benzinska_pumpa ";
            MySqlConnection connection = new MySqlConnection(sql);
            try
            {
                connection.Open();
            }
            catch (MySqlException exception)
            {
                MessageBox.Show("Problem sa MYSQL konekcijom! \n" + exception.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); 
            }

            return connection;
        }



        public static void izmjenaProizvoda(Proizvod pr,String vrsta)
        {
            string sql = "UPDATE `benzinska_pumpa`.`proizvod` SET Vrsta = @Vrsta, Cena = @Cena, idSkladista = @idSkladista WHERE Vrsta =@pVrsta";
            Console.WriteLine("string: "+sql);
            MySqlConnection connection = GetConnection(); 
            MySqlCommand command = new MySqlCommand(sql, connection); 
            command.CommandType = CommandType.Text;
            command.Parameters.Add("@Vrsta", MySqlDbType.VarChar).Value = pr.Vrsta;
            command.Parameters.Add("@Cena", MySqlDbType.Decimal).Value = Double.Parse(pr.Cena);
            command.Parameters.Add("@idSkladista", MySqlDbType.Int32).Value = Int32.Parse(pr.idSkladista);
            command.Parameters.Add("@pVrsta", MySqlDbType.VarChar).Value = vrsta;

            //Console.WriteLine(" idracuna " + command.Parameters["@Vrsta"].Value);
            try
            {
                command.ExecuteNonQuery(); 
                MessageBox.Show("Uspjesno ste izmjenili proizvod.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MySqlException exception)
            {
                MessageBox.Show("Doslo je do greske pri izmjeni \n" + exception.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); 
                Console.WriteLine(exception.StackTrace);
            }
            connection.Close();
        }




        public static void DisplayAndSearch(string query, DataGridView dataGridView)
        {
            string sql = query;
            MySqlConnection connection = GetConnection();
            MySqlCommand command = new MySqlCommand(sql, connection);
            MySqlDataAdapter adapter = new MySqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            dataGridView.DataSource = table;
            connection.Close();
        }
    }
}
