using CDMAC.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace CDMAC
{
    class Program
    {
        static void Main(string[] args)
        {
            //String de conexao
            const string connectionString = "Server=127.0.0.1,1433;Database=Clinica;User ID=sa;Password=1q2w3e4r@#$;TrustServerCertificate=true";
            // using cria um bloco de código que é executado e depois descartado
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                // query faz a consulta no banco de dados em lista de materiais, usando comando sql
                var materiais = connection.Query<Material>("SELECT * FROM Material");
                // foreach faz um loop em cada categoria
                foreach (var material in materiais)
                {
                    Console.WriteLine($"{material.Id} - {material.Nome}");
                }
            }
        }
    }
}