<?php

namespace App\Http\Controllers\empresa\Recibos;

use App\Application\UseCase\Empresa\Parametros\GetParametroPeloLabelNoParametro;
use App\Http\Controllers\empresa\ReportShowController;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Repositories\Empresa\ReciboRepository;
use App\Traits\Empresa\TraitEmpresaAutenticada;
use App\Traits\VerificaSeEmpresaTipoAdmin;
use App\Traits\VerificaSeUsuarioAlterouSenha;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;



class ReciboIndexController extends Component
{

    use VerificaSeEmpresaTipoAdmin;
    use VerificaSeUsuarioAlterouSenha;
    use TraitEmpresaAutenticada;
    use WithFileUploads;
    use WithPagination;


    public $recibo;
    public $search;
    public $comprovativoBancario;

    private $reciboRepository;

    public function boot(ReciboRepository $reciboRepository)
    {
        $this->reciboRepository = $reciboRepository;
    }

    public function render()
    {
        $infoNotificacao = $this->alertarActivacaoLicenca();
        $data['alertaAtivacaoLicenca'] = $infoNotificacao;

        if ($infoNotificacao['diasRestantes'] === 0) {
            return redirect("empresa/home");
        }
        if ($this->isAdmin()) {
            return view('admin.dashboard');
        }
        $data['recibos'] = $this->reciboRepository->listarRecibos($this->search);
        return view('empresa.recibos.index', $data);
    }
    public function printRecibo($reciboId)
    {
        $recibo = $this->reciboRepository->listarRecibo($reciboId);

        $logotipo = public_path() . '/upload/AtoNegativo1.png';
        $caminho = public_path() . '/upload/documentos/empresa/relatorios/';

        $getParametro = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $parametro = $getParametro->execute('tipoImpreensao');

        $filename = "recibos";
        if($parametro->valor == 'A5'){
            $filename = "recibos_A5";
        }
        if ($recibo['anulado'] == 2) { //Tipo anulado
            $filename = 'recibosAnulados';
        }

        $reportController = new ReportShowController();

        $report = $reportController->show([
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    'viaImpressao' => 2,
                    'empresa_id' => auth()->user()->empresa_id,
                    'recibo_id' => $recibo['id'],
                    'factura_id' => $recibo['facturaId'],
                    'logotipo' => $logotipo
                ]
        ]
        );

        $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        unlink($report['filename']);
        flush();

    }
    public function visualizarComprovativo($recibo){

        $comprovativo = env('APP_URL')."upload/" . $recibo['comprovativoBancario'];
        // dd($comprovativo);
        $this->comprovativoBancario = $comprovativo;
    }

}
