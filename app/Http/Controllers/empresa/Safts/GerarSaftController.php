<?php

namespace App\Http\Controllers\empresa\Safts;

use App\Application\UseCase\Empresa\Saft\GeradorDoFicheiroSaft;
use App\Http\Controllers\TraitLogAcesso;
use Livewire\Component;


class GerarSaftController extends Component
{
    use TraitLogAcesso;
    public $saft = [
        'dataInicio' => null,
        'dataFinal' => null,
    ];
    public function render()
    {
        return view('empresa.gerarSaft.index');
    }

    public function printSaft()
    {
        $rules = [
            'saft.dataInicio' => 'required',
            'saft.dataFinal' => 'required',
        ];
        $messages = [
            'saft.dataInicio.required' => 'campo obrigatório',
            'saft.dataFinal.required' => 'campo obrigatório',
        ];
        $this->validate($rules, $messages);
        $this->logAcesso();
        $gerarSaft = new GeradorDoFicheiroSaft();
        return ($gerarSaft->execute($this->saft));
    }


}
