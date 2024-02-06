<?php

namespace App\Http\Controllers\empresa\Faturacao;

use App\Application\UseCase\Empresa\Bancos\GetBancos;
use App\Application\UseCase\Empresa\Clientes\GetClientes;
use App\Application\UseCase\Empresa\Faturacao\EmitirDocumentoAeroporto;
use App\Application\UseCase\Empresa\Faturacao\EmitirDocumentoAeroportoCarga;
use App\Application\UseCase\Empresa\Faturacao\GetTipoDocumentoByFaturacao;
use App\Application\UseCase\Empresa\Faturacao\SimuladorFaturaCargaAeroporto;
use App\Application\UseCase\Empresa\mercadorias\GetTiposMercadorias;
use App\Application\UseCase\Empresa\Pais\GetPaises;
use App\Application\UseCase\Empresa\Parametros\GetParametroPeloLabelNoParametro;
use App\Application\UseCase\Empresa\Produtos\GetProdutoPeloCentroCustoId;
use App\Application\UseCase\Empresa\Produtos\GetProdutoPeloTipoServico;
use App\Application\UseCase\Empresa\Produtos\GetProdutos;
use App\Application\UseCase\Empresa\TiposServicos\GetTiposServicos;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaCarga;
use App\Http\Controllers\empresa\ReportShowController;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Repositories\Empresa\FacturaRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;


class EmissaoFaturaCargaController extends Component
{
    use LivewireAlert;
    use PrintFaturaCarga;

    public $clientes;
    public $bancos;
    public $empresa;
    public $item = [
        'produto' => null,
        'tipoMercadoriaId' => 1,
        'sujeitoDespachoId' => 1,
        'especificacaoMercadoriaId' => 1,
    ];
    public $fatura = [
        'cartaDePorte' => null,
        'tipoDocumento' => 3, //Fatura recibo
        'clienteId' => null,
        'nomeCliente' => null,
        'telefoneCliente' => null,
        'nifCliente' => null,
        'emailCliente' => null,
        'enderecoCliente' => null,
        'peso' => null,
        'dataEntrada' => null,
        'dataSaida' => null,
        'nDias' => null,
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

    public function mount()
    {
        $getClientes = new GetClientes(new DatabaseRepositoryFactory());
        $this->clientes = $getClientes->execute();

        $this->empresa = auth()->user()->empresa;

        $getBancos = new GetBancos(new DatabaseRepositoryFactory());
        $this->bancos = $getBancos->execute();

        $getTipoMercadorias = new GetTiposMercadorias(new DatabaseRepositoryFactory());
        $this->tipoMercadorias = $getTipoMercadorias->execute();

        $getTiposServicos = new GetTiposServicos(new DatabaseRepositoryFactory());
        $this->tipoServicos = $getTiposServicos->execute();


        $getProdutos = new GetProdutoPeloTipoServico(new DatabaseRepositoryFactory());
        $this->servicos = $getProdutos->execute(1);

        $getPaises = new GetPaises(new DatabaseRepositoryFactory());
        $this->paises = $getPaises->execute();

        $getTiposDocumentos = new GetTipoDocumentoByFaturacao(new DatabaseRepositoryFactory());
        $this->tiposDocumentos = $getTiposDocumentos->execute();
    }

    public function resetField()
    {
        $this->fatura = [
            'cartaDePorte' => null,
            'tipoDocumento' => 3, //Fatura Proforma
            'clienteId' => null,
            'nomeCliente' => null,
            'telefoneCliente' => null,
            'nifCliente' => null,
            'emailCliente' => null,
            'enderecoCliente' => null,
            'peso' => null,
            'dataEntrada' => null,
            'dataSaida' => null,
            'nDias' => null,
            'taxaIva' => 0,
            'cambioDia' => 0,
            'contraValor' => 0,
            'valorIliquido' => 0,
            'valorImposto' => 0,
            'total' => 0,
            'items' => []
        ];
    }


    public function render()
    {
        $this->dispatchBrowserEvent('reloadTableJquery');
        $this->especificaoMercadorias = DB::table('especificacao_mercadorias')->get();
        return view("empresa.facturacao.createAeroportoCarga");
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
    public function removeCart($item)
    {
        foreach ($this->fatura['items'] as $key => $itemCart) {
            if ($itemCart['produtoId'] == $item['produtoId']) {
                unset($this->fatura['items'][$key]);
            }
        }
        $this->calculadoraTotal();
    }

    public function dataErrada(){
        $dataEntrada = new \DateTime($this->fatura['dataEntrada']);
        $dataSaida = new \DateTime($this->fatura['dataSaida']);
        return $dataEntrada > $dataSaida;
    }

    public function addCart()
    {
        $rules = [
            'fatura.cartaDePorte' => 'required',
            'fatura.peso' => 'required',
            'fatura.dataEntrada' => 'required',
            'fatura.dataSaida' => 'required',
        ];
        $messages = [
            'fatura.cartaDePorte.required' => 'campo obrigatório',
            'fatura.peso.required' => 'campo obrigatório',
            'fatura.dataEntrada.required' => 'campo obrigatório',
            'fatura.dataSaida.required' => 'campo obrigatório',
        ];
        $this->validate($rules, $messages);

        $key = $this->isCart(json_decode($this->item['produto']));
        if ($key !== false) {
            $this->confirm('O serviço já foi adicionado', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'warning'
            ]);
            return;
        }
        if (!$this->item['produto']) {
            $this->confirm('Seleciona o serviço', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'warning'
            ]);
            return;
        }

        if($this->dataErrada()){
            $this->confirm('A data de entrada não deve ser maior que data de saída', [
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
        $simuladorFaturaCarga = new SimuladorFaturaCargaAeroporto(new DatabaseRepositoryFactory());
        $fatura = $simuladorFaturaCarga->execute($this->fatura);
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

    private function conversorModelParaArray(FaturaCarga $output)
    {
        $fatura = [
            'cartaDePorte' => $output->getCartaDePorte(),
            'tipoDocumento' => $output->getTipoDocumentoId(),
            'clienteId' => $output->getClienteId(),
            'nomeCliente' => $output->getNomeCliente(),
            'telefoneCliente' => $output->getTelefone(),
            'nifCliente' => $output->getNifCliente(),
            'emailCliente' => $output->getEmailCliente(),
            'enderecoCliente' => $output->getEnderecoCliente(),
            'peso' => $output->getPeso(),
            'dataEntrada' => $output->getDataEntrada(),
            'dataSaida' => $output->getDataSaida(),
            'nDias' => $output->getNDias(),
            'taxaIva' => $output->getTaxaIva(),
            'cambioDia' => $output->getCambioDia(),
            'contraValor' => $output->getContraValor(),
            'valorIliquido' => $output->getValorIliquido(),
            'valorImposto' => $output->getValorImposto(),
            'total' => $output->getTotal(),
            "items" => []
        ];
        foreach ($output->getItems() as $item) {

            array_push($fatura['items'], [
                'produtoId' => $item->getProdutoId(),
                'nomeProduto' => $item->getNomeProduto(),
                'taxa' => $item->getTaxa(),
                'valorIva' => $item->getValorIva($output->getTaxaIva()),
                'nDias' => $item->getNDias(),
                'sujeitoDespachoId' => $item->getSujeitoDespachoId(),
                'tipoMercadoriaId' => $item->getTaxaTipoMercadoriaId(),
                'especificacaoMercadoriaId' => $item->getEspecificacaoMercadoriaId(),
                'desconto' => $item->getDesconto(),
                'valorImposto' => $item->getImposto(),
                'total' => $item->getTotal(),
            ]);
        }
        return $fatura;
    }


    public function emitirDocumento()
    {

        $rules = [
            'fatura.cartaDePorte' => 'required',
            'fatura.peso' => 'required',
            'fatura.dataEntrada' => 'required',
            'fatura.dataSaida' => 'required',
        ];
        $messages = [
            'fatura.cartaDePorte.required' => 'campo obrigatório',
            'fatura.peso.required' => 'campo obrigatório',
            'fatura.dataEntrada.required' => 'campo obrigatório',
            'fatura.dataSaida.required' => 'campo obrigatório',
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

        $emitirDocumento = new EmitirDocumentoAeroportoCarga(new DatabaseRepositoryFactory());
        $faturaId = $emitirDocumento->execute(new Request($this->fatura));
        $this->printFaturaCarga($faturaId);
        $this->resetField();

    }

    public function updatedFaturaDataEntrada($dataEntrada)
    {
        if ($this->fatura['dataSaida']) {
            $dataSaida = $this->fatura['dataSaida'];
            $this->fatura['nDias'] = $this->diff($dataEntrada, $dataSaida);
        }
    }

    public function diff($dataEntrada, $dataSaida)
    {
        $data1 = new \DateTime($dataEntrada);
        $data2 = new \DateTime($dataSaida);
        $diferenca = $data1->diff($data2);
        return $diferenca->days <=0 ? 1 : $diferenca->days;
    }

    public function updatedFaturaDataSaida($dataSaida)
    {
        if ($this->fatura['dataEntrada']) {
            $dataEntrada = $this->fatura['dataEntrada'];
            $this->fatura['nDias'] = $this->diff($dataEntrada, $dataSaida);
        }

    }

    public function printFaturaCarga($facturaId)
    {
        $factura = DB::table('facturas')
            ->where('id', $facturaId)->first();

        $getParametro = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $parametro = $getParametro->execute('tipoImpreensao');

        $filename = "Winmarket";
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

}
