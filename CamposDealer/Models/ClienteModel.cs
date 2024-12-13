using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CamposDealer.Models
{
    public class ClienteModel
    {
       
        [Key]
        [Required]
        public required int IdCliente { get; set; }

        [Required]
        [MaxLength(100)]
        public required string NomeCliente { get; set; }

        [Required]
        [MaxLength(100)]
        public required string Cidade { get; set; }
    }
}