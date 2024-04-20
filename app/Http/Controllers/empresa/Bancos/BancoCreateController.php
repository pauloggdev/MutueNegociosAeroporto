<?php

namespace App\Http\Controllers\empresa\Bancos;

use App\Http\Controllers\TraitLogAcesso;
use App\Repositories\Empresa\BancoRepository;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class BancoCreateController extends Component
{

    use LivewireAlert;
    use TraitLogAcesso;

    public $banco;
    private $bancoRepository;


    public function __construct()
    {
        $this->setarValorPadrao();
    }

    public function boot(BancoRepository $bancoRepository)
    {
        $this->bancoRepository = $bancoRepository;
    }

    public function render()
    {
        return view('empresa.bancos.create');
    }
    public function salvarBanco()
    {
        $rules = [
            'banco.designacao' => ["required"],
            'banco.sigla' => "required",
            'banco.iban' => "required",
            'banco.status_id' => "required",
        ];
        $messages = [
            'banco.designacao.required' => 'Informe o nome do banco',
            'banco.sigla.required' => 'Informe a sigla',
            'banco.iban.required' => 'Informe o iban',
            'banco.status_id.required' => 'Informe o status',
        ];

        $this->validate($rules, $messages);
        $this->bancoRepository->store($this->banco);
        $this->setarValorPadrao();
        $this->logAcesso();
        $this->confirm('Operação realizada com sucesso', [
            'showConfirmButton' => false,
            'showCancelButton' => false,
            'icon' => 'success'
        ]);
    }

    public function setarValorPadrao()
    {
        $this->banco['designacao'] = NULL;
        $this->banco['sigla'] = NULL;
        $this->banco['num_conta'] = NULL;
        $this->banco['iban'] = NULL;
        $this->banco['swift'] = NULL;
        $this->banco['canal_id'] = 2;
        $this->banco['status_id'] = 1;
        $this->banco['tipo_user_id'] = 2;
    }
}
