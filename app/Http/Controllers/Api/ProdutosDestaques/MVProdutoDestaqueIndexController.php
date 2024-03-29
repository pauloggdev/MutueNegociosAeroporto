<?php

namespace App\Http\Controllers\Api\ProdutosDestaques;
use App\Http\Controllers\Controller;
use App\Repositories\Empresa\ProdutoDestaqueRepository;
use Illuminate\Http\Request;

class MVProdutoDestaqueIndexController extends Controller
{
    private $produtoDestaqueRepository;

    public function __construct(ProdutoDestaqueRepository $produtoDestaqueRepository)
    {
        $this->produtoDestaqueRepository = $produtoDestaqueRepository;
    }
    public function mv_listarProdutosDestaque(Request $request, $search = null)
    {
        return $this->produtoDestaqueRepository->getProdutos($request, $search);
    }
}
