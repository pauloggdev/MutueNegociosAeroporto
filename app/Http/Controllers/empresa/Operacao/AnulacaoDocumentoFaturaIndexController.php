<?php

namespace App\Http\Controllers\empresa\Operacao;

use App\Models\empresa\NotaCredito;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class AnulacaoDocumentoFaturaIndexController extends Component
{
    public function render(){

        $data['facturas'] = NotaCredito::with(['factura', 'user'])->where('facturaId', '!=', NULL)
            ->where('empresaId', auth()->user()->empresa_id)
            ->paginate();
        return view('empresa.operacao.documentosAnuladosFaturaIndex', $data);
    }
    public function printNotaCredito(){

    }

}
