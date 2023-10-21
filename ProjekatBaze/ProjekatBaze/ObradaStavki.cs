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
    class ObradaStavki
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


        public static void dodajStavku(Stavka sta)
        {
           
            string sql = " datasource = localhost; port = 3306; username = root; password = zvezda888; database = benzinska_pumpa  ";
            MySqlConnection conn = new MySqlConnection(sql);
            MySqlCommand cmd = new MySqlCommand();

            try
            {
                Console.WriteLine(" ispis: " + sta.ProizvodVrsta);


                conn.Open();
                cmd.Connection = conn;
               

                cmd.CommandText = "`dodavanjeStavke`";
                cmd.CommandType = CommandType.StoredProcedure;
                
              
                cmd.Parameters.Add("@pIdStavke", MySqlDbType.Int16).Value = Int16.Parse(sta.idStavke);
                cmd.Parameters["@pIdStavke"].Direction = ParameterDirection.Input;

               
                cmd.Parameters.Add("@pKolicina", MySqlDbType.Int16).Value = Int16.Parse(sta.Kolicina);
                cmd.Parameters["@pKolicina"].Direction = ParameterDirection.Input;

              
                cmd.Parameters.Add("@pCena", MySqlDbType.Decimal).Value = Double.Parse(sta.Cena);
                cmd.Parameters["@pCena"].Direction = ParameterDirection.Input;
                
                cmd.Parameters.Add("@pIdRacuna", MySqlDbType.Int16).Value = Int16.Parse(sta.idRacuna);
                cmd.Parameters["@pIdRacuna"].Direction = ParameterDirection.Input;

                //cmd.Parameters.AddWithValue("@pVrsta", sta.ProizvodVrsta);
                cmd.Parameters.Add("@pVrsta", MySqlDbType.VarChar).Value = sta.ProizvodVrsta;
                cmd.Parameters["@pVrsta"].Direction = ParameterDirection.Input;

               
                cmd.ExecuteNonQuery();

            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Console.WriteLine("Nemate dozvolu da pristupite bazi " + ex.Number + "izazvan: " + ex.Message);
            }
            conn.Close();
        }



        public static void obrisiStavku(string pidStavke)
        {
            string sql = "DELETE FROM `benzinska_pumpa`.`stavka` WHERE idStavke = @idStavke";
            MySqlConnection connection = GetConnection();
            MySqlCommand command = new MySqlCommand(sql, connection);
            command.CommandType = CommandType.Text;
            command.Parameters.Add("@idStavke", MySqlDbType.Int32).Value = Int32.Parse(pidStavke);
            //Console.WriteLine(" idStavke " + command.Parameters["@idStavke"].Value);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Uspjesno obrisana stavka.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MySqlException exception)
            {
                MessageBox.Show("Niste uspjeli da obrisete stavku. \n" + exception.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
