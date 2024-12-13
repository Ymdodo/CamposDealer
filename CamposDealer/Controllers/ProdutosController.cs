using CamposDealer.Models;
using CamposDealer.Repositorio;
using Microsoft.AspNetCore.Mvc;

namespace CamposDealer.Controllers
{
    public class ProdutosController : Controller
    {
        private readonly IProdutoRepositorio _produtoRepositorio;
        public ProdutosController(IProdutoRepositorio produtoRepositorio)
        {
            _produtoRepositorio = produtoRepositorio;
        }
        public IActionResult Index()
        {

            List<ProdutoModel> produtos = _produtoRepositorio.Select();

            var viewModel = new ProdutosViewModel
            {
                ListaProdutos = produtos,
                NovoProduto = new ProdutoModel
                {
                    IdProduto = 0,
                    DescricaoProduto = "",
                    ValorUnitario = 0.0f
                }

            };

            return View("Produtos", viewModel);
        }

 
        [HttpPost]
        public IActionResult Criar(ProdutoModel Produto)
        {
            _produtoRepositorio.Adicionar(Produto);
            return Redirect("Index");
        }

        public IActionResult Editar(int id)
        {
            var produto = _produtoRepositorio.Id(id);
            if (produto == null)
            {
                return NotFound();
            }
            return Json(produto);
        }

        [HttpPost]
        public IActionResult Alterar(ProdutoModel Produto)
        {
            _produtoRepositorio.Atualizar(Produto);
            return Redirect("Index");
        }

        [HttpPost]
        public IActionResult Deletar(int id)
        {
            _produtoRepositorio.Apagar(id);
            return RedirectToAction("Index");
        }

    }
}
