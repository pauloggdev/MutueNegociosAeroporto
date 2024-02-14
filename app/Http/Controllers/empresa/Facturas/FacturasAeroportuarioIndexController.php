<?php

namespace App\Http\Controllers\empresa\Facturas;


use App\Application\UseCase\Empresa\CartaGarantia\GetHabilitadoCartaGarantia;
use App\Application\UseCase\Empresa\Licencas\VerificarUserLogadoLicencaGratis;
use App\Application\UseCase\Empresa\Parametros\GetParametroPeloLabelNoParametro;
use App\Http\Controllers\empresa\Faturacao\PrintFaturaAeroportuario;
use App\Http\Controllers\empresa\Faturacao\PrintFaturaCarga;
use App\Http\Controllers\empresa\ReportShowController;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Models\empresa\Factura;
use App\Repositories\Empresa\FacturaRepository;
use App\Repositories\Empresa\ParametroRepository;
use App\Traits\Empresa\TraitEmpresaAutenticada;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Response;
use PHPJasper\PHPJasper;
use function Carbon\Carbon;


class FacturasAeroportuarioIndexController extends Component
{
    use TraitEmpresaAutenticada;
    use WithPagination;
    use PrintFaturaAeroportuario;
    protected $paginationTheme = 'bootstrap';
    public $search;
    private $facturaRepository;
    private $parametroRepository;
    public $filter = [
        'tipoDocumentoId' => null,
        'centroCustoId' => null,
        'orderBy' => 'DESC',
        'dataInicial' => null,
        'dataFinal' => null,
        'search' => null
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
        $this->resetPage();
        $this->filter[$item['atributo']] = $item['valor'];
    }
    public function boot(FacturaRepository $facturaRepository, ParametroRepository $parametroRepository)
    {
        $this->facturaRepository = $facturaRepository;
        $this->parametroRepository = $parametroRepository;
    }

    public function render()
    {
        $centrosCusto = auth()->user()->centrosCusto;
        if (!$centrosCusto) return redirect()->back();
        $data['centrosCusto'] = $centrosCusto;
        $data['facturas'] = Factura::where('tipoFatura', 2)
            ->where('empresa_id', auth()->user()->id)->paginate();

        $this->dispatchBrowserEvent('reloadTableJquery');
        return view('empresa.facturas.facturasAeroportuarioIndex', $data);
    }


    public function imprimirFactura($facturaId)
    {
        $this->printFaturaAeroportuario($facturaId);

    }

}
