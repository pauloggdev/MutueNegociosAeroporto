<?php

namespace App\Http\Controllers\empresa\Operacao;

use App\Application\UseCase\Empresa\Operacao\EmitirAnulacaoFatura;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Models\empresa\Factura as FaturaDatabase;
use Illuminate\Support\Facades\DB;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;

class AnulacaoDocumentoFaturaCreateController extends Component
{
    use LivewireAlert;

    public $numeracaoFactura = null;
    public $temFatura = false;

    public $fatura = [
        'nomeCliente' => null,
        'nifCliente' => null,
        'nomeProprietario' => null,
        'valorIliquido' => 0,
        'taxaIva' => 0,
        'valorImposto' => 0,
        'taxaRetencao' => 0,
        'valorRetencao' => 0,
        'total' => 0,
        'moeda' => null,
        'cambioDia' => 0,
        'contraValor' => 0,
        'descricao' => null
    ];

    public function render()
    {
        return view('empresa.operacao.documentosAnuladosFaturaCreate');
    }

    public function updatedNumeracaoFactura($numeracao)
    {
        $fatura = FaturaDatabase::where(function ($query) use ($numeracao) {
            $query->where('numeracaoFactura', 'LIKE', '%' . $numeracao)
                ->orWhere('codigoBarra', 'LIKE', '%' . $numeracao);
        })->where('empresa_id', auth()->user()->empresa_id)->first();


        if ($fatura && strlen($numeracao) > 4) {
            if ($fatura->anulado == 'Y') {
                $this->confirm('Fatura já foi anulado', [
                    'showConfirmButton' => true,
                    'showCancelButton' => false,
                    'icon' => 'warning'
                ]);
                $this->temFatura = false;

                return;
            } else {
                $this->temFatura = true;
                $fatura = (object)$fatura;
                $this->fatura['id'] = $fatura['id'];
                $this->fatura['facturaId'] = $fatura['id'];
                $this->fatura['nomeCliente'] = $fatura['nome_do_cliente'];
                $this->fatura['tipoFatura'] = $fatura['tipoFatura'];
                $this->fatura['nifCliente'] = $fatura['nif_cliente'];
                $this->fatura['numeracaoFactura'] = $fatura['numeracaoFactura'];
                $this->fatura['nomeProprietario'] = $fatura['nomeProprietario'];
                $this->fatura['valorIliquido'] = $fatura['valorIliquido'];
                $this->fatura['taxaIva'] = $fatura['taxaIva'];
                $this->fatura['valorImposto'] = $fatura['valorImposto'];
                $this->fatura['taxaRetencao'] = $fatura['taxaRetencao'];
                $this->fatura['valorRetencao'] = $fatura['valorRetencao'];
                $this->fatura['total'] = $fatura['total'];
                $this->fatura['moeda'] = $fatura['moeda'];
                $this->fatura['cambioDia'] = $fatura['cambioDia'];
                $this->fatura['contraValor'] = $fatura['contraValor'];
            }
        } else {
            $this->resetField();
        }
    }

    public function anularFatura()
    {
        if ($this->temFatura) {
            $faturaAnulado = FaturaDatabase::where(function ($query) {
                $query->where('numeracaoFactura', 'LIKE', '%' . $this->numeracaoFactura)
                    ->orWhere('codigoBarra', 'LIKE', '%' . $this->numeracaoFactura);
            })->where('empresa_id', auth()->user()->empresa_id)
                ->where('anulado', 'Y')
                ->first();

            if ($faturaAnulado) {
                $this->confirm('Fatura já foi anulado', [
                    'showConfirmButton' => true,
                    'showCancelButton' => false,
                    'icon' => 'warning'
                ]);
                return;
            }


            $recibo = DB::table('recibos')->where('facturaId', $this->fatura['id'])
                ->where('anulado', 'N')->first();
            if ($recibo) {
                $this->confirm('Fatura não pode ser anulado, contém recibo', [
                    'showConfirmButton' => true,
                    'showCancelButton' => false,
                    'icon' => 'warning'
                ]);
                return;
            }
            $emitirAnulacaoFatura = new EmitirAnulacaoFatura(new DatabaseRepositoryFactory());
            $anulacaoDocumento = $emitirAnulacaoFatura->execute($this->fatura);
            if ($anulacaoDocumento) {
                $this->resetField();
                $this->confirm('Operação realizada com sucesso', [
                    'showConfirmButton' => true,
                    'showCancelButton' => false,
                    'icon' => 'success'
                ]);
                return;
            }
        }
    }


    public function resetField()
    {
        $this->temFatura = false;
        $this->fatura = [
            'nomeCliente' => null,
            'nifCliente' => null,
            'numeracaoFactura' => null,
            'nomeProprietario' => null,
            'valorIliquido' => 0,
            'taxaIva' => 0,
            'valorImposto' => 0,
            'taxaRetencao' => 0,
            'valorRetencao' => 0,
            'total' => 0,
            'moeda' => null,
            'cambioDia' => 0,
            'contraValor' => 0,
            'descricao' => null
        ];
    }

}
