using CamposDealer.Models;

namespace CamposDealer.Repositorio
{
    public interface IProdutoRepositorio
    {
        ProdutoModel Id(int id);
        List<ProdutoModel> Select();
        ProdutoModel Adicionar(ProdutoModel Produto);
        ProdutoModel Atualizar(ProdutoModel Model);
        bool Apagar(int id);
    }
}
