<?php

namespace App\Http\Controllers\empresa\Faturacao;

use App\Application\UseCase\Empresa\TiposServicos\GetTiposServicos;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use Livewire\Component;

class FaturacaoCreateAeroportoController extends Component
{
    public $tipoServicos;
    public function mount(){

        $getTiposServicos = new GetTiposServicos(new DatabaseRepositoryFactory());
        $this->tipoServicos = $getTiposServicos->execute();
    }
    public function render(){

        return view('empresa.facturacao.createAeroporto')->layout('layouts.appFaturacao');
    }

}
