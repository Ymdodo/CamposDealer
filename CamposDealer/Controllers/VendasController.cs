using CamposDealer.Models;
using CamposDealer.Repositorio;
using Microsoft.AspNetCore.Mvc;


namespace CamposDealer.Controllers
{
    public class VendasController : Controller
    {
        private readonly IVendaRepositorio _vendaRepositorio;
        public VendasController(IVendaRepositorio vendaRepositorio)
        {
            _vendaRepositorio = vendaRepositorio;
        }

        public IActionResult Index()
        {

            List<VendaModel> vendas = _vendaRepositorio.Select();

            var viewModel = new VendasViewModel
            {
                ListaVendas = vendas,
                NovaVenda = new VendaModel
                {
                    IdVenda = 0,
                    IdCliente = 0,
                    Cliente = null,
                    IdProduto = 0,
                    Produto = null,
                    Qtd = 0,
                    ValorUnitario = 0,
                    DtVenda = DateTime.Now,
                }

            };

            return View("Vendas", viewModel);
        }

        public IActionResult Apagar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Criar(VendaModel Venda)
        {
            try
            {
                Venda.DtVenda = DateTime.Now;
                _vendaRepositorio.Adicionar(Venda);
                TempData["MensagemSucesso"] = "Venda criada com sucesso!";
            }
            catch (Exception ex)
            {
                TempData["MensagemErro"] = $"Ocorreu um erro ao criar a venda Checar se Produto e Cliente existem: {ex.Message}";
            }
            return RedirectToAction("Index");

        }

        public IActionResult Editar(int id)
        {
            var venda = _vendaRepositorio.Id(id);
            if (venda == null)
            {
                return NotFound();
            }
            return Json(venda);
        }

        [HttpPost]
        public IActionResult Alterar(VendaModel Venda)
        {
            _vendaRepositorio.Atualizar(Venda);
            return Redirect("Index");
        }

        [HttpPost]
        public IActionResult Deletar(int id)
        {
            _vendaRepositorio.Apagar(id);
            return RedirectToAction("Index");
        }
    }
}
