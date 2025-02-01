using CDMAC.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using System.Runtime.Intrinsics.Arm;

namespace CDMAC
{
    class Program
    {
        static void Main(string[] args)
        {
            #region String de conexao
            const string connectionString = "Server=127.0.0.1,1433;Database=Clinica;User ID=sa;Password=1q2w3e4r@#$;TrustServerCertificate=true";
            #endregion
            // using cria um bloco de código que é executado e depois descartado
            using (var connection = new SqlConnection(connectionString))
            {
                InserirUsuario(connection);
                ListarUsuarios(connection);
                DeletarUsuario(connection);
            }
        }
        static void ListarUsuarios(SqlConnection connection)
        {
            var usuarios = connection.Query<Login>("SELECT [Usuario], [Email] FROM [Login]");
            foreach (var item in usuarios)
            {
                Console.WriteLine($"Usuario: {item.Usuario} - Email: {item.Email}");
            }
        }
        static void InserirUsuario(SqlConnection connection)
        {
            var usuario = new Login();
            usuario.Usuario = "andryadornelles";
            usuario.Email = "andryacds@gmail.com";
            usuario.Senha = "123456";

            var insertSql = "INSERT INTO [Login] ([Usuario], [Email], [Senha]) VALUES (@Usuario, @Email, @Senha)";

            var rows = connection.Execute(insertSql, usuario);
            Console.WriteLine($"Linhas afetadas: {rows}");
        }
        static void DeletarUsuario(SqlConnection connection)
        {
            var deleteSql = "DELETE FROM [Login] WHERE [Usuario] = @Usuario";

            var rows = connection.Execute(deleteSql, new { Usuario = "andryadornelles" });
            Console.WriteLine($"Usuários Deletados: {rows}");
        }
    }
}