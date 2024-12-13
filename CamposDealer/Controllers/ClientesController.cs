using CamposDealer.Models;
using CamposDealer.Repositorio;
using Microsoft.AspNetCore.Mvc;

namespace CamposDealer.Controllers
{
    public class ClientesController : Controller
    {
        private readonly IClienteRepositorio _clienteRepositorio;
        public ClientesController(IClienteRepositorio clienteRepositorio)
        {
            _clienteRepositorio = clienteRepositorio;
        }
        public IActionResult Index()
        {

            List<ClienteModel> clientes = _clienteRepositorio.Select();

            var viewModel = new ClientesViewModel
            {
                ListaClientes = clientes,
                NovoCliente = new ClienteModel
                {
                    IdCliente = 0,
                    NomeCliente = "",
                    Cidade = ""
                }

            };

            return View("Clientes", viewModel);
        }

        public IActionResult Apagar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Criar(ClienteModel Cliente)
        {
            _clienteRepositorio.Adicionar(Cliente);
            return Redirect("Index");
        }

        public IActionResult Editar(int id)
        {
            var cliente = _clienteRepositorio.Id(id);
            if (cliente == null)
            {
                return NotFound();
            }
            return Json(cliente);
        }

        [HttpPost]
        public IActionResult Alterar(ClienteModel Cliente)
        {
            _clienteRepositorio.Atualizar(Cliente);
            return Redirect("Index");
        }

        [HttpPost]
        public IActionResult Deletar(int id)
        {
            _clienteRepositorio.Apagar(id);
            return RedirectToAction("Index");
        }
    }
}
