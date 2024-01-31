<?php

namespace App\Http\Controllers\empresa\Faturacao;

use App\Application\UseCase\Empresa\Clientes\GetClientes;
use App\Application\UseCase\Empresa\Faturacao\GetTipoDocumentoByFaturacao;
use App\Application\UseCase\Empresa\Pais\GetPaises;
use App\Application\UseCase\Empresa\Produtos\GetProdutoPeloCentroCustoId;
use App\Application\UseCase\Empresa\Produtos\GetProdutos;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use Livewire\Component;

class EmissaoFaturaController extends Component
{
    public $clientes;
    public $produtos;
    public $paises;
    public $tiposDocumentos;
    public $fatura;

    public function mount(){
        $getClientes = new GetClientes(new DatabaseRepositoryFactory());
        $this->clientes = $getClientes->execute();

        $getProdutos = new GetProdutoPeloCentroCustoId(new DatabaseRepositoryFactory());
        $this->produtos = $getProdutos->execute(session('centroCustoId'));

        $getPaises = new GetPaises(new DatabaseRepositoryFactory());
        $this->paises = $getPaises->execute();

        $getTiposDocumentos = new GetTipoDocumentoByFaturacao(new DatabaseRepositoryFactory());
        $this->tiposDocumentos = $getTiposDocumentos->execute();
    }

    public function render(){
        return view("empresa.facturacao.createAeroporto");
    }

}
