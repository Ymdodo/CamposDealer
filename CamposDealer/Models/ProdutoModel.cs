using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CamposDealer.Models
{
    public class ProdutoModel
    {
        [Key]
        [Required] 
        public required int IdProduto { get; set; }

        [Required]
        [MaxLength(100)] 
        public required string DescricaoProduto { get; set; }

        [Required]
        [Column(TypeName = "float")] 
        public required float ValorUnitario { get; set; }
    }
}