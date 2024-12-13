using CamposDealer.Models;

namespace CamposDealer.Models
{
    public class VendasViewModel
    {
        public List<VendaModel> ListaVendas { get; set; }
        public VendaModel NovaVenda { get; set; }

        public List<ProdutoModel> ListaProdutos { get; set; }

        public List<ClienteModel> ListaClientes { get; set; }
    }
}
