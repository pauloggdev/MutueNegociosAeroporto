<?php

namespace App\Http\Controllers\empresa\Operacao;

use App\Http\Controllers\empresa\ReportShowController;
use App\Models\empresa\NotaCredito;

trait TraitPrintAnulacaoFatura
{

    public function printAnulacaoFatura($notaCreditoId){

        $notaCredito = NotaCredito::with(['factura'])
            ->where('id', $notaCreditoId)
            ->where('empresaId', auth()->user()->empresa_id)
            ->first();
        if($notaCredito['factura']['tipoFatura'] == 1){ // Nota credito Carga
            $filename = "notaCreditoFaturaCarga";
        }else{ // Nota credito Aeroportuario
            $filename = "notaCreditoFaturaAeroportuario";
        }
        if ($notaCredito['factura']['tipo_documento'] == 3) { //proforma
            $logotipo = public_path() . '/upload/_logo_ATO_vertical_com_TAG_color.png';
        } else {
            $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;
        }
        $DIR_SUBREPORT = "/upload/documentos/empresa/modelosFacturas/a4/";
        $DIR = public_path() . "/upload/documentos/empresa/modelosFacturas/a4/";
        $marcaDaAgua = public_path() . "/marca_agua.png";

        $reportController = new ReportShowController('pdf', $DIR_SUBREPORT);

        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    "viaImpressao" => 1,
                    "logotipo" => $logotipo,
                    "empresa_id" => auth()->user()->empresa_id,
                    "notaCreditoId" => $notaCreditoId,
                    "dirSubreportBanco" => $DIR,
                    "dirSubreportTaxa" => $DIR,
                    "tipo_regime" => auth()->user()->empresa->tipo_regime_id,
                    "nVia" => 1,
                    "DIR" => $DIR,
                    "marcaDaAgua"=>$marcaDaAgua
                ]
            ], "pdf", $DIR_SUBREPORT
        );



        $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        // $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        unlink($report['filename']);
        flush();

    }

}
