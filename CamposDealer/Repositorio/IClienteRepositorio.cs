using CamposDealer.Models;

namespace CamposDealer.Repositorio
{
    public interface IClienteRepositorio
    {
        ClienteModel Id(int id);
        List<ClienteModel> Select();
        ClienteModel Adicionar(ClienteModel Cliente);
        ClienteModel Atualizar(ClienteModel Model);
        bool Apagar(int id);
    }
}
