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
    class ObradaRacuna
    {

        public static MySqlConnection GetConnection()
        {
            string sql = " datasource = localhost; port = 3306; username = root; password = zvezda888; database = benzinska_pumpa  ";
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



        public static void obrisiRacun(string idRacuna)
        {
            string sql = "DELETE FROM `benzinska_pumpa`.`stavka` WHERE idRacuna = @idRacuna";
            MySqlConnection connection = GetConnection();
            MySqlCommand command = new MySqlCommand(sql, connection);
            command.CommandType = CommandType.Text;
            command.Parameters.Add("@idRacuna", MySqlDbType.Int32).Value = Int32.Parse(idRacuna);
           // Console.WriteLine(" idracuna " + command.Parameters["@idRacuna"].Value);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Uspjesno brisanje.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MySqlException exception)
            {
                MessageBox.Show("Racun nije obrisan. \n" + exception.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                connection.Close();
            }
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
