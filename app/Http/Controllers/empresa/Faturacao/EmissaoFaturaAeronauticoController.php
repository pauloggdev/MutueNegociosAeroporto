<?php

namespace App\Http\Controllers\empresa\Faturacao;

use App\Application\UseCase\Empresa\Bancos\GetBancos;
use App\Application\UseCase\Empresa\Clientes\GetClientes;
use App\Application\UseCase\Empresa\Faturacao\EmitirDocumentoAeroporto;
use App\Application\UseCase\Empresa\Faturacao\EmitirDocumentoAeroportoAeronave;
use App\Application\UseCase\Empresa\Faturacao\EmitirDocumentoAeroportoCarga;
use App\Application\UseCase\Empresa\Faturacao\GetTipoDocumentoByFaturacao;
use App\Application\UseCase\Empresa\Faturacao\SimuladorFaturaAeronauticoAeroporto;
use App\Application\UseCase\Empresa\Faturacao\SimuladorFaturaCargaAeroporto;
use App\Application\UseCase\Empresa\mercadorias\GetTiposMercadorias;
use App\Application\UseCase\Empresa\Pais\GetPaises;
use App\Application\UseCase\Empresa\Parametros\GetParametroPeloLabelNoParametro;
use App\Application\UseCase\Empresa\Produtos\GetProdutoPeloCentroCustoId;
use App\Application\UseCase\Empresa\Produtos\GetProdutoPeloTipoServico;
use App\Application\UseCase\Empresa\Produtos\GetProdutos;
use App\Application\UseCase\Empresa\TiposServicos\GetTiposServicos;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaAeronautico;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaCarga;
use App\Http\Controllers\empresa\ReportShowController;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;

class EmissaoFaturaAeronauticoController extends Component
{
    use LivewireAlert;

    public $clientes;
    public $bancos;
    public $empresa;
    public $item = [
        'produto' => null,
        'sujeitoDespachoId' => 1,
    ];
    public $fatura = [
        'moeda' => null,
        'tipoDocumento' => 3, //Fatura proforma
        'isencaoIVA' => false,
        'retencao' => false,
        'taxaRetencao' => 0,
        'valorRetencao' => 0,
        'nomeProprietario' => null,
        'clienteId' => null,
        'nomeCliente' => null,
        'telefoneCliente' => null,
        'nifCliente' => null,
        'emailCliente' => null,
        'enderecoCliente' => null,
        'tipoDeAeronave' => null,
        'pesoMaximoDescolagem' => null,
        'dataDeAterragem' => null,
        'dataDeDescolagem' => null,
        'horaDeAterragem' => null, //11h40 UTC
        'horaDeDescolagem' => null, //13h57 UTC
        'peso' => null,
        'horaExtra' => null,
        'taxaIva' => 0,
        'cambioDia' => 0,
        'contraValor' => 0,
        'valorIliquido' => 0,
        'valorImposto' => 0,
        'total' => 0,
        'items' => []
    ];
    public $tipoServicos;
    public $tipoMercadorias;
    public $servicos;
    public $paises;
    public $tiposDocumentos;
    public $especificaoMercadorias;

    protected $listeners = ['selectedItem'];


    public function selectedItem($item)
    {
        if ($item['atributo'] == 'clienteId') {
            $this->updatedFaturaClienteId($item['valor']);
        }
        $this->fatura[$item['atributo']] = $item['valor'];
    }

    public function hydrate()
    {
        $this->emit('select2');
    }

    public function updatedFaturaIsencaoIVA()
    {
        $this->fatura['taxaRetencao'] = 0;
        $this->fatura['valorRetencao'] = 0;
        $this->fatura['taxaIva'] = 0;
        $this->fatura['cambioDia'] = 0;
        $this->fatura['contraValor'] = 0;
        $this->fatura['valorIliquido'] = 0;
        $this->fatura['valorImposto'] = 0;
        $this->fatura['moeda'] = null;
        $this->fatura['total'] = 0;
        $this->fatura['items'] = [];
    }

    public function updatedFaturaRetencao()
    {

        $this->fatura['taxaRetencao'] = 0;
        $this->fatura['valorRetencao'] = 0;
        $this->fatura['taxaIva'] = 0;
        $this->fatura['cambioDia'] = 0;
        $this->fatura['contraValor'] = 0;
        $this->fatura['valorIliquido'] = 0;
        $this->fatura['valorImposto'] = 0;
        $this->fatura['moeda'] = null;
        $this->fatura['total'] = 0;
        $this->fatura['items'] = [];
    }

    public function updatedFaturaClienteId($clienteId)
    {
        $cliente = DB::table('clientes')->where('id', $clienteId)
            ->where('empresa_id', auth()->user()->empresa_id)->first();
        $this->fatura['clienteId'] = $cliente->id;
        $this->fatura['nomeCliente'] = $cliente->nome;
        $this->fatura['telefoneCliente'] = $cliente->telefone_cliente;
        $this->fatura['nifCliente'] = $cliente->nif;
        $this->fatura['emailCliente'] = $cliente->email;
        $this->fatura['enderecoCliente'] = $cliente->endereco;

    }

    public function mount()
    {
        $moedaEstrageiraUsado = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $this->fatura['moeda'] = $moedaEstrageiraUsado->execute('moeda_estrageira_usada')->valor;

        $getClientes = new GetClientes(new DatabaseRepositoryFactory());
        $this->clientes = $getClientes->execute();

        $this->empresa = auth()->user()->empresa;

        $getBancos = new GetBancos(new DatabaseRepositoryFactory());
        $this->bancos = $getBancos->execute();


        $getProdutos = new GetProdutoPeloTipoServico(new DatabaseRepositoryFactory());
        $this->servicos = $getProdutos->execute(2);

        $getPaises = new GetPaises(new DatabaseRepositoryFactory());
        $this->paises = $getPaises->execute();

        $getTiposDocumentos = new GetTipoDocumentoByFaturacao(new DatabaseRepositoryFactory());
        $this->tiposDocumentos = $getTiposDocumentos->execute();
    }

    public function render()
    {
        $this->especificaoMercadorias = DB::table('especificacao_mercadorias')->get();
        return view("empresa.facturacao.createAeroportoAeronautico");
    }

    public function removeCart($item)
    {
        foreach ($this->fatura['items'] as $key => $itemCart) {
            if ($itemCart['produtoId'] == $item['produtoId']) {
                unset($this->fatura['items'][$key]);
            }
        }
        $this->calculadoraTotal();
    }

    public function addCart()
    {

        if (!$this->item['produto']) {
            $this->confirm('Seleciona o serviço', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'warning'
            ]);
            return;
        }

        $produtoData = json_decode($this->item['produto']);
        $rules = [
            'fatura.tipoDeAeronave' => 'required',
            'fatura.pesoMaximoDescolagem' => 'required',
            'fatura.dataDeAterragem' => 'required',
            'fatura.dataDeDescolagem' => 'required',
            'fatura.horaDeAterragem' => 'required',
            'fatura.horaDeDescolagem' => 'required',
            'fatura.peso' => [function ($attr, $peso, $fail) use ($produtoData) {
                if ($produtoData->id == 7 && !$peso) {
                    $fail("campo obrigatório");
                }
            }],
            'fatura.horaExtra' => [function ($attr, $horaExtra, $fail) use ($produtoData) {
                if (($produtoData->id == 8 || $produtoData->id == 10) && !$horaExtra) {
                    $fail("campo obrigatório");
                }
            }],
        ];
        $messages = [
            'fatura.tipoDeAeronave.required' => 'campo obrigatório',
            'fatura.pesoMaximoDescolagem.required' => 'campo obrigatório',
            'fatura.dataDeAterragem.required' => 'campo obrigatório',
            'fatura.dataDeDescolagem.required' => 'campo obrigatório',
            'fatura.horaDeAterragem.required' => 'campo obrigatório',
            'fatura.horaDeDescolagem.required' => 'campo obrigatório',
        ];
        $this->validate($rules, $messages);



        $key = $this->isCart($produtoData);
        if ($key !== false) {
            $this->confirm('O serviço já foi adicionado', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'warning'
            ]);
            return;
        }
        $produto = json_decode($this->item['produto']);
        $this->item['nomeProduto'] = $produto->designacao;
        $this->item['produtoId'] = $produto->id;
        $this->item['produto'] = $this->item['produto'];
        $this->fatura['items'][] = (array)$this->item;

        $this->calculadoraTotal();


    }

    public function calculadoraTotal()
    {
        $simuladorFaturaAeronautico = new SimuladorFaturaAeronauticoAeroporto(new DatabaseRepositoryFactory());
        $fatura = $simuladorFaturaAeronautico->execute($this->fatura);
        $this->fatura = $this->conversorModelParaArray($fatura);
    }

    private function isCart($item)
    {
        $items = collect($this->fatura['items']);
        $posicao = $items->search(function ($produto) use ($item) {
            return $produto['produtoId'] === $item->id;
        });
        return $posicao;
    }

    private function conversorModelParaArray(FaturaAeronautico $output)
    {
        $fatura = [
            'nomeProprietario' => $output->getProprietario(),
            'clienteId' => $output->getClienteId(),
            'nomeCliente' => $output->getNomeCliente(),
            'telefoneCliente' => $output->getTelefoneCliente(),
            'nifCliente' => $output->getNifCliente(),
            'emailCliente' => $output->getEmailCliente(),
            'enderecoCliente' => $output->getEnderecoCliente(),
            'tipoDeAeronave' => $output->getTipoDeAeronave(),
            'pesoMaximoDescolagem' => $output->getPesoMaximoDescolagem(),
            'dataDeAterragem' => $output->getDataDeAterragem(),
            'dataDeDescolagem' => $output->getDataDeDescolagem(),
            'horaDeAterragem' => $output->getHoraDeAterragem(), //11h40 UTC
            'horaDeDescolagem' => $output->getHoraDeDescolagem(), //13h57 UTC
            'peso' => $output->getPeso(),
            'horaExtra' => $output->getHoraExtra(),
            'tipoDocumento' => $output->getTipoDocumento(), //Fatura recibo
            'isencaoIVA' => $output->getIsencaoIVA(),
            'retencao' => $output->getRetencao(),
            'taxaRetencao' => $output->getTaxaRetencao(),
            'valorRetencao' => $output->getValorRetencao(),
            'taxaIva' => $output->getTaxaIva(),
            'cambioDia' => $output->getCambioDia(),
            'contraValor' => $output->getContraValor(),
            'valorIliquido' => $output->getValorIliquido(),
            'valorImposto' => $output->getValorImposto(),
            'total' => $output->getTotal(),
            'moeda' => $output->getMoeda(),
            'items' => []
        ];
        foreach ($output->getItems() as $item) {
            array_push($fatura['items'], [
                'produtoId' => $item->getProdutoId(),
                'quantidade' => 1,
                'nomeProduto' => $item->getNomeProduto(),
                'pmd' => $item->getPMD(),
                'valorIva' => $item->getValorIva(),
                'taxaIva' => $item->getTaxaIva(),
                'horaEstacionamento' => $item->getHoraEstacionamento(),
                'taxa' => $item->getTaxa(),
                'taxaLuminosa' => $item->getTaxaLuminosa(),
                'taxaAduaneiro' => $item->getTaxaAduaneiro(),
                'sujeitoDespachoId' => $item->getSujeitoDespachoId(),
                'peso' => $item->getPeso(),
                'horaExtra' => $item->getHoraExtra(),
                'taxaAbertoAeroporto' => $item->getTaxaAbertoAeroporto(),
                'cambioDia' => $item->getCambioDia(),
                'valorImposto' => $item->getImposto(),
                'total' => $item->getTotal(),
                'totalIva' => $item->getTotalIva(),
                'horaAberturaAeroporto' => $item->getHoraAberturaAeroporto(),
                'horaFechoAeroporto' => $item->getHoraFechoAeroporto(),
            ]);
        }
        return $fatura;
    }

    public function emitirDocumento()
    {


        $rules = [
            'fatura.clienteId' => 'required',
            'fatura.tipoDeAeronave' => 'required',
            'fatura.nomeProprietario' => 'required',
            'fatura.pesoMaximoDescolagem' => 'required',
            'fatura.dataDeAterragem' => 'required',
            'fatura.dataDeDescolagem' => 'required',
            'fatura.horaDeAterragem' => 'required',
            'fatura.horaDeDescolagem' => 'required',
        ];
        $messages = [
            'fatura.clienteId.required' => 'campo obrigatório',
            'fatura.tipoDeAeronave.required' => 'campo obrigatório',
            'fatura.nomeProprietario.required' => 'campo obrigatório',
            'fatura.pesoMaximoDescolagem.required' => 'campo obrigatório',
            'fatura.dataDeAterragem.required' => 'campo obrigatório',
            'fatura.dataDeDescolagem.required' => 'campo obrigatório',
            'fatura.horaDeAterragem.required' => 'campo obrigatório',
            'fatura.horaDeDescolagem.required' => 'campo obrigatório',
        ];
        $this->validate($rules, $messages);

        if (count($this->fatura['items']) <= 0) {
            $this->confirm('Adiciona os serviços', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'warning'
            ]);
            return;
        }
        if (!$this->fatura['clienteId']) {
            $this->confirm('Seleciona o cliente', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'warning'
            ]);
            return;
        }

        $emitirDocumento = new EmitirDocumentoAeroportoAeronave(new DatabaseRepositoryFactory());
        $faturaId = $emitirDocumento->execute(new Request($this->fatura));
        $this->printFaturaCarga($faturaId);
        $this->resetField();
    }

    public function printFaturaCarga($facturaId)
    {
        $factura = DB::table('facturas')
            ->where('id', $facturaId)->first();

        $getParametro = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $parametro = $getParametro->execute('tipoImpreensao');

        $filename = "Winmarket-Aeronave";
        if ($parametro->valor == 'A5') {
            $filename = "Winmarket_A5";
        }
        if ($factura->tipo_documento == 3) { //proforma
            $logotipo = public_path() . '/upload/_logo_ATO_vertical_com_TAG_color.png';
        } else {
            $logotipo = public_path() . '/upload//' . auth()->user()->empresa->logotipo;
        }
        $DIR_SUBREPORT = "/upload/documentos/empresa/modelosFacturas/a4/";
        $DIR = public_path() . "/upload/documentos/empresa/modelosFacturas/a4/";
        $reportController = new ReportShowController('pdf', $DIR_SUBREPORT);

        $report = $reportController->show(
            [
                'report_file' => $filename,
                'report_jrxml' => $filename . '.jrxml',
                'report_parameters' => [
                    "viaImpressao" => 1,
                    "logotipo" => $logotipo,
                    "empresa_id" => auth()->user()->empresa_id,
                    "facturaId" => $facturaId,
                    "dirSubreportBanco" => $DIR,
                    "dirSubreportTaxa" => $DIR,
                    "tipo_regime" => auth()->user()->empresa->tipo_regime_id,
                    "nVia" => 1,
                    "DIR" => $DIR
                ]
            ], "pdf", $DIR_SUBREPORT
        );


        $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        // $this->dispatchBrowserEvent('printPdf', ['data' => base64_encode($report['response']->getContent())]);
        unlink($report['filename']);
        flush();
    }

    public function resetField()
    {
        $this->fatura = [
            'moeda' => null,
            'tipoDocumento' => 3, //Fatura proforma
            'isencaoIVA' => false,
            'retencao' => false,
            'taxaRetencao' => 0,
            'valorRetencao' => 0,
            'nomeProprietario' => null,
            'clienteId' => null,
            'nomeCliente' => null,
            'telefoneCliente' => null,
            'nifCliente' => null,
            'emailCliente' => null,
            'enderecoCliente' => null,
            'tipoDeAeronave' => null,
            'pesoMaximoDescolagem' => null,
            'dataDeAterragem' => null,
            'dataDeDescolagem' => null,
            'horaDeAterragem' => null, //11h40 UTC
            'horaDeDescolagem' => null, //13h57 UTC
            'peso' => null,
            'horaExtra' => null,
            'taxaIva' => 0,
            'cambioDia' => 0,
            'contraValor' => 0,
            'valorIliquido' => 0,
            'valorImposto' => 0,
            'total' => 0,
            'items' => []
        ];
    }

}
