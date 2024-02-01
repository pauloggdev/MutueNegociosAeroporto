<?php

namespace App\Http\Controllers\empresa\mercadorias;

use App\Application\UseCase\Empresa\mercadorias\CadastrarTipoMercadoria;
use App\Application\UseCase\Empresa\mercadorias\GetTiposMercadorias;
use App\empresa\EspecificacaoMercadoria;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Models\empresa\TipoMercadoria;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;
use Illuminate\Http\Request;

class EspecificacaoMercadoriaController extends Component
{
    use LivewireAlert;

    public $search = null;
    public $mercadoria_id;
    public $especificacao_id;
    public $mercadoria = [
        'statuId' => 1
    ];
    public $especificacao = [
        'status' => 1
    ];
    public $tiposMercadorias;
    public $especificacaoMercadorias;

    public function mount()
    {
        // $getTiposMercadorias = new GetTiposMercadorias(new DatabaseRepositoryFactory());
        // $this->tiposMercadorias = $getTiposMercadorias->execute();
    }
    public function render()
    {
        
        $this->especificacaoMercadorias = EspecificacaoMercadoria::all();
        // $this->especificacaoMercadorias = $especificacaoMercadorias;
        return view('empresa.mercadorias.EspecificacaoMercadoria', compact($this->especificacaoMercadorias));
    }
    public function store(){
        $rules = [
            'especificacao.descricao' => ['required'],
            'especificacao.desconto' => ['required'],
            'especificacao.status' => ['required']
        ];
        $messages = [
            'especificacao.descricao.required' => 'É obrigatório a descricao',
            'especificacao.desconto.required' => 'É obrigatório o desconto',
            'especificacao.status.required' => 'É obrigatório o status'
        ];
        $this->validate($rules, $messages);

        try {
            DB::beginTransaction();
            // $cadastrarTipoMercadoria = new CadastrarTipoMercadoria(new DatabaseRepositoryFactory());
            // $cadastrarTipoMercadoria->execute(new Request($this->mercadoria));
            EspecificacaoMercadoria::updateOrcreate(
                ["id" => $this->especificacao_id ],
                [
                "descricao" => $this->especificacao['descricao'],
                "desconto" => $this->especificacao['desconto'],
                "status" => $this->especificacao['status']
            ]);
            DB::commit();
            $this->confirm('Operação realizada com sucesso', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'success'
            ]);
            $this->resetField();
            $this->mount();
            $this->dispatchBrowserEvent('reloadTableJquery');
            $this->dispatchBrowserEvent('close-modal');


        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
        return redirect()->back();
    }
    public function resetField(){
        $this->especificacao_id = null;
        $this->especificacao['descricao'] = NULL;
        $this->especificacao['desconto'] = 0;
        $this->especificacao['status'] = 1;
    }

    public function edit($id)
    {
       $especificacao = EspecificacaoMercadoria::find($id);
       $this->especificacao_id  = $especificacao->id;
        $this->especificacao['descricao']  = $especificacao->descricao;
        $this->especificacao['desconto'] = $especificacao->desconto;
        $this->especificacao['status'] = $especificacao->status;
    }


}