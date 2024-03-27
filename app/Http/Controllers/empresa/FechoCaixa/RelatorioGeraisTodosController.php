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
use Livewire\Component;


class RelatorioGeraisTodosController extends Component
{
    public $clienteId;
    public $data_inicio;
    public $data_fim;
    public $venda;
    public $tipoServicoId;
    public $formapagamentoId;
    public $tipoMoedaId;
    public $tipoDocumetoId;


    protected $listeners = [
        'selectedItem'
    ];

    public function hydrate()
    {
        $this->emit('select2');
    }

    public function selectedItem($item)
    {

        $this->{$item['atributo']} = $item['valor'];
    }

    public function render()
    {
        $data['clientes'] = Cliente::where('empresa_id', auth()->user()->empresa_id)->get();
        $data['tiposServicos'] = TipoServico::get();
//        $tipoDocumeto= TipoDocumento::get();
//        $tipoMoeda=Moeda::get();
//        $formapagamento=FormaPagamentoGeral::get();

        return view('empresa.relatorios.relatoriosGeral', $data);

    }

    public function imprimirRelatorioGeral()
    {
        $data_inicio = $this->data_inicio . ' 00:00:00';
        $data_fim = $this->data_fim . ' 23:59:59';
        $dataInicioFormat = date_format(date_create($data_inicio), "d/m/Y");
        $dataFinalFormat = date_format(date_create($data_fim), "d/m/Y");
        $request = $this->data_inicio;
        $rules = [
            'data_inicio' => ["required", function ($attribute, $value, $fail) use ($request) {
                if ($request['data_inicio'] > $request['data_fim']) {
                    $fail('data inicial é maior que a final');
                }
            }],
            'data_fim' => 'required',
            'data_inicio' => 'required',
//            'clienteId' => 'required',
//            'tipoMercadoriaId' => 'required',
        ];
        $messages = [
            'data_inicio.required' => 'Informe a data Inicial',
            'data_fim.required' => 'Informe a data Final',
//            'clienteId.required' => 'Informe a data Final',
//            'tipoMercadoriaId.required' => 'Informe a data Final',
        ];

        $this->validate($rules, $messages);
        $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;
        $filename = "relatorioGeralTodos";
        $reportController = new ReportShowController();

        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    'empresa_id' => auth()->user()->empresa_id,
                    'logotipo' => $logotipo,
                    'data_inicio' => $data_inicio,
                    'data_fim' => $data_fim,
                    'dataInicioFormat' => $dataInicioFormat,
                    'dataFinalFormat' => $dataFinalFormat,
                    'clienteId' => $this->clienteId,
                    'tipoServicoId' => $this->tipoServicoId,
                    'tipoDocumetoId'=>$this->tipoDocumetoId,
                    'tipoMoedaId'=>$this->tipoMoedaId,
                    'formapagamentoId'=>$this->formapagamentoId
                ]
            ]
        );



        $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        unlink($report['filename']);
        flush();
    }


    public function imprimirExcelMapaFaturacao()
    {

        $data_inicio = $this->data_inicio . ' 06:59:00';
        $data_fim = $this->data_fim . ' 23:59:00';
        $dataInicioFormat = date_format(date_create($data_inicio), "d/m/Y");
        $dataFinalFormat = date_format(date_create($data_fim), "d/m/Y");
        $request = $this->data_inicio;
        $rules = [
            'data_inicio' => ["required", function ($attribute, $value, $fail) use ($request) {
                if ($request['data_inicio'] > $request['data_fim']) {
                    $fail('data inicial é maior que a final');
                    return;
                }
            }],
            'data_fim' => 'required',
            'data_inicio' => 'required',
        ];
        $messages = [
            'data_inicio.required' => 'Informe a data Inicial',
            'data_fim.required' => 'Informe a data Final',
        ];
        $this->validate($rules, $messages);
        $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;
        $filename = "relatorioGeralTodos";
        $reportController = new ReportShowController('xls');
        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    'empresa_id' => auth()->user()->empresa_id,
                    'logotipo' => $logotipo,
                    'data_inicio' => $data_inicio,
                    'data_fim' => $data_fim,
                    'dataInicioFormat' => $dataInicioFormat,
                    'dataFinalFormat' => $dataFinalFormat,
                ]
            ]
        );


        $headers = array(
            'Content-Type: application/xls',
        );
        return \Illuminate\Support\Facades\Response::download($report['filename'], 'Mapa de Faturação.xls', $headers);


    }

}
