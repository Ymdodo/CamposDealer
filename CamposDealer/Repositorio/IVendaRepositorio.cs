using CamposDealer.Models;

namespace CamposDealer.Repositorio
{
    public interface IVendaRepositorio
    {
        VendaModel Id(int id);
        List<VendaModel> Select();
        VendaModel Adicionar(VendaModel Venda);

        VendaModel Atualizar(VendaModel Venda);
        bool Apagar(int id);
    }
}
