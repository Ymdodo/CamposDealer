using CamposDealer.Data;
using CamposDealer.Models;
using CamposDealer.Repositorio;
using Microsoft.EntityFrameworkCore;

namespace CamposDealer.Repositorio
{
    public class VendaRepositorio : IVendaRepositorio
    {
        private readonly BancoContext _context;

        public VendaRepositorio(BancoContext context)
        {
            _context = context;
        }

        public List<VendaModel> Select()
        {
            var query = from venda in _context.Vendas
                        join produto in _context.Produtos on venda.IdProduto equals produto.IdProduto
                        select new VendaModel
                        {
                            IdVenda = venda.IdVenda,
                            IdCliente = venda.IdCliente,
                            IdProduto = venda.IdProduto,
                            Produto = null,
                            Cliente = null,
                            Qtd = venda.Qtd,
                            ValorUnitario = produto.ValorUnitario, 
                            DtVenda = venda.DtVenda
                        };
            return query.ToList();

        }
        public VendaModel Adicionar(VendaModel Venda)
        {
            _context.Vendas.Add(Venda);
            _context.SaveChanges();
            return Venda;
        }

        public VendaModel Id(int id)
        {
            return _context.Vendas.FirstOrDefault(c => c.IdVenda == id);
        }

        public VendaModel Atualizar(VendaModel Venda)
        {
            VendaModel vendaDb = Id(Venda.IdVenda);

            if (vendaDb == null) throw new Exception("Erro ao atualizar venda");

            vendaDb.IdProduto = Venda.IdProduto;
            vendaDb.IdCliente = Venda.IdCliente;
            vendaDb.Qtd = Venda.Qtd;
            vendaDb.ValorUnitario = Venda.ValorUnitario;
            vendaDb.DtVenda = Venda.DtVenda;

            _context.Vendas.Update(vendaDb);
            _context.SaveChanges();

            return vendaDb;
        }
        public bool Apagar(int id)
        {
            VendaModel vendaDb = Id(id);

            if (vendaDb == null) throw new Exception("Erro ao apagar venda");

            _context.Vendas.Remove(vendaDb);
            _context.SaveChanges();

            return true;
        }

    }
}


