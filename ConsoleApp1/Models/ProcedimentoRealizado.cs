namespace CDMAC
{
    public class ProcedimentoRealizado
    {
        public int Id { get; set; }
        public int ProcedimentoId { get; set; }
        public DateTime Data { get; set; }
        public int PacienteId { get; set; }
        public int MedicoId { get; set; }
    }
}