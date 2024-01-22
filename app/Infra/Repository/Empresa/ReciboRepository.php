<?php

namespace App\Infra\Repository\Empresa;

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
}
