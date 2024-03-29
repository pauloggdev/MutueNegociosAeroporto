<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Repositories\Empresa\ArmazemRepository;
use App\Repositories\Empresa\BancoRepository;
use App\Repositories\Empresa\ClienteRepository;
use App\Repositories\Empresa\FabricanteRepository;
use App\Repositories\Empresa\FacturaRepository;
use App\Repositories\Empresa\FornecedorRepository;
use App\Repositories\Empresa\ProdutoRepository;
use App\Repositories\Empresa\UserRepository;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;

class HomeController extends Controller
{
    private $userRepository;
    private $clienteRepository;
    private $armazemRepository;
    private $fornecedorRepository;
    private $fabricanteRepository;
    private $bancoRepository;
    private $produtoRepository;
    private $facturaRepository;




    public function __construct(
        UserRepository $userRepository,
        ClienteRepository $clienteRepository,
        ArmazemRepository $armazemRepository,
        FornecedorRepository $fornecedorRepository,
        FabricanteRepository $fabricanteRepository,
        BancoRepository $bancoRepository,
        ProdutoRepository $produtoRepository,
        FacturaRepository $facturaRepository
    )
    {
        $this->userRepository = $userRepository;
        $this->clienteRepository = $clienteRepository;
        $this->armazemRepository = $armazemRepository;
        $this->fornecedorRepository = $fornecedorRepository;
        $this->fabricanteRepository = $fabricanteRepository;
        $this->bancoRepository = $bancoRepository;
        $this->produtoRepository = $produtoRepository;
        $this->facturaRepository = $facturaRepository;
    }

    public function countDashboard(){

        $centroCustoId=$_GET['centroCustoId'];
        return [
            'countUsers'=>$this->userRepository->quantidadeUsers(),
            'countClientes' => $this->clienteRepository->quantidadeClientes(),
            'countArmazens' => $this->armazemRepository->quantidadeArmazens(),
            'countFornecedores' => $this->fornecedorRepository->quantidadeFornecedores(),
            'countFabricantes' => $this->fabricanteRepository->quantidadeFabricantes(),
            'countBancos' => $this->bancoRepository->quantidadeBancos(),
            'countProdutos' => $this->produtoRepository->quantidadeProdutos($centroCustoId),
            'countVendas' => $this->facturaRepository->quantidadesVendas($centroCustoId),
            'totalVendas' => $this->facturaRepository->totalVendas($centroCustoId),
            'facturacaoMensal'=> $this->facturaRepository->listarGraficoVendasMensal($centroCustoId),
            'produtosMaisVendidos'=> $this->produtoRepository->listarSeisProdutosMaisVendidos($centroCustoId),

        ];

    }
}
