<?php

namespace App\Http\Controllers\empresa\Empresa;

use App\Http\Controllers\TraitLogAcesso;
use App\Http\Requests\Admin\UpdateEmpresaRequest;
use App\Repositories\Empresa\EmpresaRepository;
use App\Repositories\Empresa\RegimeRepository;
use App\Repositories\Empresa\TipoClienteRepository;
use Illuminate\Support\Facades\DB;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;
use Livewire\WithFileUploads;


class EmpresaUpdateController extends Component
{
    use WithFileUploads;
    use UpdateEmpresaRequest;
    use LivewireAlert;
    use TraitLogAcesso;


    public $tipoEmpresas;
    public $tipoRegimes;
    public $empresa;
    public $newLogotipo;
    public $newFileAlvara;
    public $newFileNIF;
    private $empresaRepository;
    private $regimeRepository;
    private $tipoClienteRepository;


    protected $listeners = ['refresh-me' => '$refresh', 'selectedItem'];


    public function hydrate()
    {
        $this->emit('select2');
    }

    public function selectedItem($item)
    {

        $this->empresa[$item['atributo']] = $item['valor'];
    }


    public function boot(
        EmpresaRepository $empresaRepository,
        RegimeRepository $regimeRepository,
        TipoClienteRepository $tipoClienteRepository
    ) {
        $this->empresaRepository = $empresaRepository;
        $this->regimeRepository = $regimeRepository;
        $this->tipoClienteRepository = $tipoClienteRepository;
    }

    public function mount()
    {
        $this->tipoEmpresas = $this->tipoClienteRepository->getTiposCliente();
        $this->tipoRegimes = $this->regimeRepository->getRegimes();
        $this->empresa = $this->empresaRepository->getEmpresa();

    }

    public function render()
    {
        return view("empresa.configuracoes.update");
    }
    public function update()
    {
        $this->empresa['newLogotipo'] = $this->newLogotipo;
        $this->empresa['newFileAlvara'] = $this->newFileAlvara;
        $this->empresa['newFileNIF'] = $this->newFileNIF;
        $this->validate($this->rules(), $this->messages());
        $this->empresaRepository->store($this->empresa);
        $this->logAcesso();
        $this->emitSelf('refresh-me');
        $this->confirm('Operação realizada com sucesso', ['showConfirmButton' => false, 'showCancelButton' => false, 'icon' => 'success']);
    }
}
