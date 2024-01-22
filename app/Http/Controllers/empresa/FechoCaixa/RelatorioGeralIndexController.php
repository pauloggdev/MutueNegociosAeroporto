<?php

namespace App\Http\Controllers\empresa\FechoCaixa;

use App\Http\Controllers\empresa\ReportShowController;
use App\Models\empresa\CentroCusto;
use Illuminate\Support\Facades\DB;
use Livewire\Component;



class RelatorioGeralIndexController extends Component
{
  public $centroCustoId;
  public $data_inicio;
  public $data_fim;
  public $venda_online;
  public $venda;

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
        $centroCusto = CentroCusto::where('empresa_id',auth()->user()->empresa_id)->get();
        return view('empresa.relatorios.relatoriosGeral', compact('centroCusto'));
    }

    public function imprimirRelatorioGeral()
    {

        $dataInicioFormat = $this->data_inicio;
        $dataFinalFormat =  $this->data_fim;
        $venda_online= $this->venda_online;
        $request =  $this->data_inicio;
        $rules = [
            'data_inicio' => ["required", function ($attribute, $value, $fail) use ($request) {
                if ($request['data_inicio'] > $request['data_fim']) {
                    $fail('data inicial é maior que a final');
                    return;
                }
            }],
            'data_fim' => 'required',
            'data_inicio' => 'required',
            'centroCustoId'=>'required',

        ];
        $messages = [
            'data_inicio.required' => 'Informe a data Inicial',
            'data_fim.required' => 'Informe a data Final',
            'centroCustoId.required' =>'Informe o Centro de Custo',
        ];

        $this->validate($rules, $messages);

        $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;
        $filename = "relatoriosGerais";
        $reportController = new ReportShowController();
        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    'empresa_id' => auth()->user()->empresa_id,
                    'logotipo'=>$logotipo,
                    'centroCustoId'=>$this->centroCustoId,
                    'data_inicio'=>$this->data_inicio,
                    'data_fim'=>$this->data_fim,
                    'dataInicioFormat'=> $dataInicioFormat,
                    'dataFinalFormat'=> $dataFinalFormat,
                    'venda_online' => isset($venda_online) ? $venda_online : null
                ]
            ]
        );
        $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        unlink($report['filename']);
        flush();
    }


}
