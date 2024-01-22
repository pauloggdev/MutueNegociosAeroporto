<?php

namespace App\Http\Controllers\empresa\FechoCaixa;

use App\Http\Controllers\empresa\ReportShowController;
use Illuminate\Support\Facades\DB;
use Livewire\Component;



class FechoCaixaIndexController extends Component
{

    public $data;

    public function render()
    {
        return view('empresa.fechoCaixa.index');
    }
    public function imprimirFechoCaixa()
    {

        $dataInicio = $this->data . " 06:00";
        $dataFim = $this->data . " 23:59";
        $formatoPeriodo = date_format(date_create($this->data),"d/m/Y"). " 06:00 à 23:59";
        $rules = [
            'data' => ["required", function ($attr, $value, $fail) use ($dataInicio, $dataFim) {
                $countFactura =  DB::table('facturas')->where('empresa_id', auth()->user()->empresa_id)
                    ->whereDate('created_at', '=', $this->data)
                    ->get();
                if (count($countFactura) <= 0) {
                    $fail("Não existe vendas neste data");
                }
            }],
        ];
        $messages = [
            'data.required' => 'Informe a data'
        ];

        $this->validate($rules, $messages);

        $filename = 'fechoCaixaPorDataDefinidasTodosOperadores';

        $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;

        $DIR = public_path() . '/upload/documentos/empresa/relatorios/';

        // dd(auth()->user()->empresa_id);

        // empresaId = 158
        // data inicio = 2022-02-21 08:00
        // data fim = 2022-02-23 21:00
        // logotipo = C:\laragon\www\mutue-negocios\public/upload//utilizadores/cliente/laAJKtYOSjaLBTSjPlhDFfwmincv6pGBxAtuCThh.png
        // formatoPeriodo = 22-02-2022 08:00 as 21:00
        // DIR = C:\laragon\www\mutue-negocios\public/upload/documentos/empresa/relatorios//


        //MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA
        //Rua Nossa senhora da Muxima, nº 10 - 8º andar
        //922969192
        //5000977381
        //148
        //638
        //2023-12-09 01:30
        //2023-12-09 23:59
        //C:\laragon\www\api-mutue-negocio\public/upload//utilizadores/cliente/IrcsAYqRR5UnHJ0TkABvqkw5QK1OZQNImO6Acn8U.png
        //09/12/2023 06:00 à 23:59
        //C:\laragon\www\api-mutue-negocio\public/upload/documentos/empresa/relatorios/
        $reportController = new ReportShowController();
        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    'nomeEmpresa' => auth()->user()->empresa->nome,
                    'enderecoEmpresa' => auth()->user()->empresa->endereco,
                    'telefoneEmpresa' => auth()->user()->empresa->pessoal_Contacto,
                    'nifEmpresa' => auth()->user()->empresa->nif,
                    'empresa_id' => auth()->user()->empresa_id,
                    'userId' => auth()->user()->id,
                    'data_inicio' => $dataInicio,
                    'data_fim' => $dataFim,
                    'logotipo' => $logotipo,
                    'formatoPeriodo' => $formatoPeriodo,
                    'DIR' => $DIR
                ]
            ]
        );
        $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        unlink($report['filename']);
        flush();
    }
}
