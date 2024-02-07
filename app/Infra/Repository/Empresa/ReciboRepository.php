<?php

namespace App\Infra\Repository\Empresa;

use App\Domain\Entity\Empresa\Recibos\Recibo;
use App\Domain\Entity\Empresa\SequenciaDocumento;
use App\Models\empresa\Recibos as ReciboDatabase;
use Carbon\Carbon;

class ReciboRepository
{
    public function existeEstaSequencia(SequenciaDocumento $sequenciaDocumento)
    {
        $yearNow = Carbon::parse(Carbon::now())->format('Y');
        return ReciboDatabase::where('empresa_id', auth()->user()->empresa_id)
            ->where('created_at', 'like', '%' . $yearNow . '%')
            ->where('numeracao_recibo', 'like', '%' . $sequenciaDocumento->getSerieDocumento() . '%')
            ->where('numSequenciaRecibo', $sequenciaDocumento->getSequencia())
            ->first();
    }
    public function sequenciaMenorExistentes(SequenciaDocumento $sequenciaDocumento){
        $yearNow = Carbon::parse(Carbon::now())->format('Y');
        return ReciboDatabase::where('empresa_id', auth()->user()->empresa_id)
            ->where('created_at', 'like', '%' . $yearNow . '%')
            ->where('numeracao_recibo', 'like', '%' . $sequenciaDocumento->getSerieDocumento() . '%')
            ->where('numSequenciaRecibo', '>',$sequenciaDocumento->getSequencia())
            ->first();
    }
    public function lastDocument(){
        $yearNow = Carbon::parse(Carbon::now())->format('Y');
        return ReciboDatabase::orderby('id', 'desc')
            ->where('created_at', 'like', '%' . $yearNow . '%')
            ->where('empresaId', auth()->user()->empresa_id)
            ->first();
    }
    public function getTotalDebitadoFatura($faturaId){
        return ReciboDatabase::where('empresaId', auth()->user()->empresa_id)
            ->where('facturaId', $faturaId)->sum('totalEntregue');
    }
    public function emitirRecibo(Recibo $recibo){

        return ReciboDatabase::create([
            'numeracaoRecibo' => $recibo->getNumeracaoRecibo(),
            'clienteId' => $recibo->getClienteId(),
            'anulado' => $recibo->getAnulado(),
            'totalEntregue' => $recibo->getTotalEntregue(),
            'userId' => auth()->user()->id,
            'empresaId' => auth()->user()->empresa_id,
            'facturaId' => $recibo->getFacturaId(),
            'totalFatura' => $recibo->getTotalFatura(),
            'totalImposto' => $recibo->getTotalImposto(),
            'totalDebitar' => $recibo->getTotalDebitar(),
            'formaPagamentoId' => $recibo->getFormaPagamentoId(),
            'numeroOperacaoBancaria' => $recibo->getNumeroOperacaoBancaria(),
            'dataOperacao' => $recibo->getDataOperacao(),
            'comprovativoBancario' => $recibo->getComprovativoBancario(),
            'observacao' => $recibo->getObservacao(),
            'numSequenciaRecibo' => $recibo->getNumSequenciaRecibo(),
            'nomeCliente' => $recibo->getNomeCliente(),
            'telefoneCliente' => $recibo->getTelefoneCliente(),
            'nifCliente' => $recibo->getNifCliente(),
            'emailCliente' => $recibo->getEmailCliente(),
            'enderecoCliente' => $recibo->getEnderecoCliente()
        ]);
    }
}