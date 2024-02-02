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
use App\Application\UseCase\Empresa\Produtos\GetProdutoPeloCentroCustoId;
use App\Application\UseCase\Empresa\Produtos\GetProdutos;
use App\Application\UseCase\Empresa\TiposServicos\GetTiposServicos;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaCarga;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;

class EmissaoFaturaController extends Component
{
    use LivewireAlert;

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
        'cartaDePorte' => 'CVK-0001-3304',
        'tipoDocumento' => 1, //Fatura recibo
        'peso' => 220,
        'dataEntrada' => '2024-01-03',
        'dataSaida' => '2024-02-01',
        'nDias' => 29,
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

        $getProdutos = new GetProdutoPeloCentroCustoId(new DatabaseRepositoryFactory());
        $this->servicos = $getProdutos->execute(session('centroCustoId'));

        $getPaises = new GetPaises(new DatabaseRepositoryFactory());
        $this->paises = $getPaises->execute();

        $getTiposDocumentos = new GetTipoDocumentoByFaturacao(new DatabaseRepositoryFactory());
        $this->tiposDocumentos = $getTiposDocumentos->execute();
    }

    public function render()
    {
        $this->especificaoMercadorias = DB::table('especificacao_mercadorias')->get();
        return view("empresa.facturacao.createAeroporto");
    }

    public function removeCart($item)
    {
        $posicao = $this->isCart(json_decode($item['produto']));
        unset($this->fatura['items'][$posicao]);
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
        $produto = json_decode($this->item['produto']);
        $this->item['nomeProduto'] = $produto->designacao;
        $this->item['produtoId'] = $produto->id;
        $this->item['produto'] = $this->item['produto'];
        $this->fatura['items'][] = (array)$this->item;

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
    public function emitirDocumento(){

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
        if(count($this->fatura['items']) <= 0){
            $this->confirm('Adiciona os serviços', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'warning'
            ]);
            return;
        }

        $emitirDocumento = new EmitirDocumentoAeroportoCarga(new DatabaseRepositoryFactory());
        $emitirDocumento->execute(new Request($this->fatura));

        dd($this->fatura);
    }

}
