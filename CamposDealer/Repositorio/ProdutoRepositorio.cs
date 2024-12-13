using CamposDealer.Data;
using CamposDealer.Models;

namespace CamposDealer.Repositorio
{
    public class ProdutoRepositorio : IProdutoRepositorio
    {
        private readonly BancoContext _context;

        public ProdutoRepositorio(BancoContext context)
        {
            _context = context;
        }
        public List<ProdutoModel> Select()
        {
            return _context.Produtos.ToList();
        }
        public ProdutoModel Adicionar(ProdutoModel Produto)
        {
            _context.Produtos.Add(Produto);
            _context.SaveChanges();
            return Produto;
        }

        public ProdutoModel Id(int id)
        {
            return _context.Produtos.FirstOrDefault(c => c.IdProduto == id);
        }

        public ProdutoModel Atualizar(ProdutoModel Produto)
        {
            ProdutoModel produtoeDb = Id(Produto.IdProduto);

            if (produtoeDb == null) throw new Exception("Erro ao atualizar produto");

            produtoeDb.DescricaoProduto = Produto.DescricaoProduto;
            produtoeDb.ValorUnitario = Produto.ValorUnitario;

            _context.Produtos.Update(produtoeDb);
            _context.SaveChanges();

            return produtoeDb;
        }

        public bool Apagar(int id)
        {
            ProdutoModel produtoeDb = Id(id);

            if (produtoeDb == null) throw new Exception("Erro ao apagar produto");

            _context.Produtos.Remove(produtoeDb);
            _context.SaveChanges();

            return true;
        }
    }
}
