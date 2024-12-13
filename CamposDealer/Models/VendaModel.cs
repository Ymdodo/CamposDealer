using CamposDealer.Models;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CamposDealer.Models
{
    public class VendaModel
    {
        [Key]
        public int IdVenda { get; set; }


        [ForeignKey("Cliente")]
        public int IdCliente { get; set; }
        public required ClienteModel Cliente { get; set; } 

        
        [ForeignKey("Produto")]
        public int IdProduto { get; set; }
        public required ProdutoModel Produto { get; set; } 

        [Required]
        public int Qtd { get; set; }

        [NotMapped]
        [Column(TypeName = "float")]
        public required float ValorUnitario { get; set; } 

        [Required]
        public DateTime DtVenda { get; set; } 

        [NotMapped]
        public float VlrTotalVenda => Qtd * ValorUnitario;

    }
}
