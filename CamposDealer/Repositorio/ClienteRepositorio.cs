using CamposDealer.Data;
using CamposDealer.Models;

namespace CamposDealer.Repositorio
{
    public class ClienteRepositorio : IClienteRepositorio
    {
        private readonly BancoContext _context;

        public ClienteRepositorio(BancoContext context)
        {
            _context = context;
        }
        public List<ClienteModel> Select()
        {
            return _context.Clientes.ToList();
        }
        public ClienteModel Adicionar(ClienteModel Cliente)
        {
            _context.Clientes.Add(Cliente);
            _context.SaveChanges();
            return Cliente;
        }

        public ClienteModel Id(int id)
        {
            return _context.Clientes.FirstOrDefault(c => c.IdCliente == id);
        }

        public ClienteModel Atualizar(ClienteModel Cliente)
        {

            ClienteModel clienteDb = Id(Cliente.IdCliente);

            if (clienteDb == null) throw new Exception("Erro ao atualizar cliente");

            clienteDb.NomeCliente = Cliente.NomeCliente;
            clienteDb.Cidade = Cliente.Cidade;

            _context.Clientes.Update(clienteDb);
            _context.SaveChanges();

            return clienteDb;

        }

        public bool Apagar(int id)
        {
            ClienteModel clienteDb = Id(id);

            if (clienteDb == null) throw new Exception("Erro ao apagar cliente");

            _context.Clientes.Remove(clienteDb);
            _context.SaveChanges();

            return true;
        }
    }
}
