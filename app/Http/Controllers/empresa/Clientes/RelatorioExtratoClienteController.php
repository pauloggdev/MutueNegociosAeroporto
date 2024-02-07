<?php

namespace App\Http\Controllers\empresa\Clientes;

use App\Application\UseCase\Empresa\Clientes\GetClientes;
use App\Http\Controllers\empresa\ReportShowController;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Models\empresa\TipoDocumento;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class RelatorioExtratoClienteController extends Component
{

    public $clientes;
    public $extrato;
    public $todoPeriodo = false;
    public $tipoDocumentos;

    protected $listeners = ['selectedItem'];

    public function selectedItem($item)
    {
        $this->extrato[$item['atributo']] = $item['valor'];
    }

    public function hydrate()
    {
        $this->emit('select2');
    }

    public function mount()
    {
        $getClientes = new GetClientes(new DatabaseRepositoryFactory());
        $this->clientes = $getClientes->execute();
        $this->tipoDocumentos = TipoDocumento::whereIn('id', [2, 3, 6, 1])
            ->get();
    }

    public function render()
    {
        return view('empresa.clientes.extratoIndex');
    }

    public function imprimirExtratoCliente()
    {


        $dataInicioFormat = $this->data_inicio;
        $dataFinalFormat = $this->data_fim;
        $venda_online = $this->venda_online;
        $request = $this->data_inicio;
        $rules = [
            'extrato.clienteId' => ["required"],
            'extrato.dataInicio' => [function ($attr, $dataInicio, $fail) {
                if(!$this->todoPeriodo){
                    $fail("campo obrigatório");
                }
            }],
            'extrato.dataFinal' => [function ($attr, $dataInicio, $fail) {
                if(!$this->todoPeriodo){
                    $fail("campo obrigatório");
                }
            }]
        ];
        $messages = [
            'extrato.clienteId' => 'campo obrigatório',
            'extrato.dataInicio' => 'campo obrigatório',
            'extrato.dataFinal' => 'campo obrigatório'
        ];

        $this->validate($rules, $messages);

        $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;
        $filename = "extratoCliente";
        $reportController = new ReportShowController();
        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    'empresa_id' => auth()->user()->empresa_id,
                    'logotipo' => $logotipo,
                    'centroCustoId' => $this->centroCustoId,
                    'data_inicio' => $this->data_inicio,
                    'data_fim' => $this->data_fim,
                    'dataInicioFormat' => $dataInicioFormat,
                    'dataFinalFormat' => $dataFinalFormat,
                    'venda_online' => isset($venda_online) ? $venda_online : null
                ]
            ]
        );
        $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        unlink($report['filename']);
        flush();
    }
}
