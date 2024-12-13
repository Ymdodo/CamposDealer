using CamposDealer.Models;
using Microsoft.EntityFrameworkCore;


namespace CamposDealer.Data
{
    public class BancoContext : DbContext
    {
        public BancoContext(DbContextOptions<BancoContext> options) : base(options)
        {

        }

        public DbSet<ProdutoModel> Produtos { get; set; }

        public DbSet<ClienteModel> Clientes { get; set; }

        public DbSet<VendaModel> Vendas { get; set; }
    }
}
