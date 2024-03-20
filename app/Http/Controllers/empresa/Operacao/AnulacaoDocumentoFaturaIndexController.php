<?php

namespace App\Http\Controllers\empresa\Operacao;

use App\Http\Controllers\empresa\ReportShowController;
use App\Models\empresa\NotaCredito;
use Livewire\Component;

class AnulacaoDocumentoFaturaIndexController extends Component
{
    use TraitPrintAnulacaoFatura;
    public function render(){

        $data['facturas'] = NotaCredito::with(['factura', 'user'])->where('facturaId', '!=', NULL)
            ->where('empresaId', auth()->user()->empresa_id)
            ->paginate();
        return view('empresa.operacao.documentosAnuladosFaturaIndex', $data);
    }
    public function printNotaCredito($notaCreditoId){
        $this->printAnulacaoFatura($notaCreditoId);
    }

}
