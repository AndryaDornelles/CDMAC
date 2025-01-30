namespace CDMAC
{
    public class Paciente
    {
        public Guid Id { get; set; }
        public string Nome { get; set; }
        public string Telefone { get; set; }
        public string Convenio { get; set; }
        public Guid MedicoId { get; set; }
    }
}