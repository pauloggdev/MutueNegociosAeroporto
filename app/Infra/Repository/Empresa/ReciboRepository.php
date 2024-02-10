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
    public function emitirRecibo($data){
        return ReciboDatabase::create([
            'numeracaoRecibo' => $data['numeracaoRecibo'],
            'clienteId' => $data['clienteId'],
            'anulado' => $data['anulado'],
            'totalEntregue' => $data['totalEntregue'],
            'userId' => auth()->user()->id,
            'empresaId' => auth()->user()->empresa_id,
            'facturaId' => $data['facturaId'],
            'totalFatura' => $data['totalFatura'],
            'totalImposto' => $data['totalImposto'],
            'totalDebitar' => $data['totalDebitar'],
            'formaPagamentoId' => $data['formaPagamentoId'],
            'numeroOperacaoBancaria' => $data['numeroOperacaoBancaria'],
            'dataOperacao' => $data['dataOperacao'],
            'comprovativoBancario' => $data['comprovativoBancario'],
            'observacao' => $data['observacao'],
            'numSequenciaRecibo' => $data['numSequenciaRecibo'],
            'nomeCliente' => $data['nomeCliente'],
            'telefoneCliente' =>  $data['telefoneCliente'],
            'nifCliente' => $data['nifCliente'],
            'emailCliente' => $data['emailCliente'],
            'enderecoCliente' => $data['enderecoCliente']
        ]);
    }
}
