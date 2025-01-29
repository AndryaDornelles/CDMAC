namespace CDMAC.Models
{
    class Material
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public int FornecedorId { get; set; }
        public decimal Preco { get; set; }
        public int QuantidadeEstoque { get; set; }
        public int QuantidadeNecessaria { get; set; }

        public Material()
        {
        }
    }


}


