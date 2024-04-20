<?php

namespace App\Http\Controllers\empresa\FechoCaixa;

use App\Http\Controllers\empresa\ReportShowController;
use App\Models\empresa\CentroCusto;
use App\Models\empresa\Cliente;
use App\Models\empresa\FormaPagamentoGeral;
use App\Models\empresa\FormaPagamentos;
use App\Models\empresa\Moeda;
use App\Models\empresa\TipoDocumento;
use App\Models\empresa\Tipodocumentosequencia;
use App\Models\empresa\TipoMercadoria;
use App\Models\empresa\TipoServico;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Livewire\Component;


class RelatorioGeraisTodosController extends Component
{
    public $relatorio = [
        'dataInicio' => null,
        'dataFim' => null,
        'tipoDocumentoId' => null,
        'tipoServicoId' => null,
    ];


    protected $listeners = [
        'selectedItem'
    ];

    public function hydrate()
    {
        $this->emit('select2');
    }

    public function selectedItem($item)
    {

        $this->relatorio[$item['atributo']] = $item['valor'];
    }

    public function render()
    {
        $data['tiposDocumentos'] = TipoDocumento::whereIn('id', [1, 2, 3])->get();
        $data['tiposServicos'] = TipoServico::whereIn('id', [1, 2])->get();
        return view('empresa.relatorios.relatoriosGeral', $data);
    }

    public function imprimirRelatorioGeral()
    {

        $dataInicio = date_format(date_create($this->relatorio['dataInicio']), "d/m/Y") . " 00:00:00";
        $dataFinal = date_format(date_create($this->relatorio['dataFim']), "d/m/Y") . " 23:59:59";

        $formatoData = "TODO PERIODO";
        $setarData = false;
        if ($this->relatorio['dataInicio'] && $this->relatorio['dataFim']) {
            $formatoData = $dataInicio . " à " . $dataFinal;
            $setarData = true;
        }else{
            $dataInicio = null;
            $dataFinal = null;
        }

        $rules = [
            'relatorio.dataInicio' => [function ($attribute, $dataInicio, $fail) {
                if ($dataInicio > $this->relatorio['dataFim']) {
                    $fail('data inicial é maior que a final');
                }
            }]
        ];
        $messages = [
            'relatorio.dataInicio' => 'campo obrigatório',
            'relatorio.dataFim' => 'campo obrigatório',
        ];


        $this->validate($rules, $messages);
        $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;
        $filename = "relatoriosDeVendasGerais";
        $reportController = new ReportShowController();
//        dd($dataInicio);

        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    'empresa_id' => auth()->user()->empresa_id,
                    'logotipo' => $logotipo,
                    'tipoDocumentoId' => $this->relatorio['tipoDocumentoId'],
                    'tipoServicoId' => $this->relatorio['tipoServicoId'],
                    'data_inicio' => $dataInicio,
                    'data_fim' => $dataFinal,
                    'formatoData' => $formatoData,
                    'setarData' => $setarData
                ]
            ]
        );

        $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        unlink($report['filename']);
        flush();
    }


    public function imprimirExcelRelatorioGeral()
    {
        $dataInicio = date_format(date_create($this->relatorio['dataInicio']), "d/m/Y H:m:s");
        $dataFinal = date_format(date_create($this->relatorio['dataFim']), "d/m/Y H:m:s");

        $formatoData = "TODO PERIODO";
        $setarData = false;
        if ($this->relatorio['dataInicio']) {
            $formatoData = $dataInicio . " à " . $dataFinal;
            $setarData = true;
        }

        $rules = [
            'relatorio.dataInicio' => [function ($attribute, $dataInicio, $fail) {
                if ($dataInicio > $this->relatorio['dataFim']) {
                    $fail('data inicial é maior que a final');
                }
            }]
        ];
        $messages = [
            'relatorio.dataInicio' => 'campo obrigatório',
            'relatorio.dataFim' => 'campo obrigatório',
        ];

        $this->validate($rules, $messages);
        $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;
        $filename = "relatoriosDeVendasGerais";
        $reportController = new ReportShowController('xls');

        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    'empresa_id' => auth()->user()->empresa_id,
                    'logotipo' => $logotipo,
                    'tipoDocumentoId' => $this->relatorio['tipoDocumentoId'],
                    'tipoServicoId' => $this->relatorio['tipoServicoId'],
                    'data_inicio' => $this->relatorio['dataInicio'],
                    'data_fim' => $this->relatorio['dataFim'],
                    'formatoData' => $formatoData,
                    'setarData' => $setarData
                ]
            ]
        );


        $headers = array(
            'Content-Type: application/xls',
        );
        return \Illuminate\Support\Facades\Response::download($report['filename'], 'relatorioGeral' . Str::uuid() . '.xls', $headers);


    }

}
