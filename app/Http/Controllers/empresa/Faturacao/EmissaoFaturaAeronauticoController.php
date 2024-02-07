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
use App\Application\UseCase\Empresa\Produtos\GetProdutoPeloCentroCustoId;
use App\Application\UseCase\Empresa\Produtos\GetProdutoPeloTipoServico;
use App\Application\UseCase\Empresa\Produtos\GetProdutos;
use App\Application\UseCase\Empresa\TiposServicos\GetTiposServicos;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaAeronautico;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaCarga;
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
    ];
    public $fatura = [
        'clienteId' => null,
        'nomeCliente' => null,
        'telefoneCliente' => null,
        'nifCliente' => null,
        'emailCliente' => null,
        'enderecoCliente' => null,
        'tipoDeAeronave' => 'BOING 737-800',
        'pesoMaximoDescolagem' => 77,
        'dataDeAterragem' => '2024-01-30',
        'dataDeDescolagem' => '2024-01-30',
        'horaDeAterragem' => '11:40', //11h40 UTC
        'horaDeDescolagem' => '13:57', //13h57 UTC
        'tipoDocumento' => 3, //Fatura Proforma
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
        $posicao = $this->isCart(json_decode($item['produto']));
        unset($this->fatura['items'][$posicao]);
    }

    public function addCart()
    {
        $rules = [
            'fatura.tipoDeAeronave' => 'required',
            'fatura.pesoMaximoDescolagem' => 'required',
            'fatura.dataDeAterragem' => 'required',
            'fatura.dataDeDescolagem' => 'required',
            'fatura.horaDeAterragem' => 'required',
        ];
        $messages = [
            'fatura.tipoDeAeronave.required' => 'campo obrigatório',
            'fatura.pesoMaximoDescolagem.required' => 'campo obrigatório',
            'fatura.dataDeAterragem.required' => 'campo obrigatório',
            'fatura.dataDeDescolagem.required' => 'campo obrigatório',
            'fatura.horaDeAterragem.required' => 'campo obrigatório',
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
            'tipoDocumento' => $output->getTipoDocumento(), //Fatura recibo
            'taxaIva' => $output->getTaxaIva(),
            'cambioDia' => $output->getCambioDia(),
            'contraValor' => $output->getContraValor(),
            'valorIliquido' => $output->getValorIliquido(),
            'valorImposto' => $output->getValorImposto(),
            'total' => $output->getTotal(),
            'items' => []
        ];
        foreach ($output->getItems() as $item) {
            array_push($fatura['items'], [
                'produtoId' => $item->getProdutoId(),
                'nomeProduto' => $item->getNomeProduto(),
                'pmd' => $item->getPMD(),
                'horaEstacionamento' => $item->getHoraEstacionamento(),
                'cambioDia' => $item->getCambioDia(),
                'valorImposto' => $item->getImposto(),
                'total' => $item->getTotal(),
            ]);
        }
        return $fatura;
    }
    public function emitirDocumento(){

        $rules = [
            'fatura.tipoDeAeronave' => 'required',
            'fatura.pesoMaximoDescolagem' => 'required',
            'fatura.dataDeAterragem' => 'required',
            'fatura.dataDeDescolagem' => 'required',
            'fatura.horaDeAterragem' => 'required',
        ];
        $messages = [
            'fatura.tipoDeAeronave.required' => 'campo obrigatório',
            'fatura.pesoMaximoDescolagem.required' => 'campo obrigatório',
            'fatura.dataDeAterragem.required' => 'campo obrigatório',
            'fatura.dataDeDescolagem.required' => 'campo obrigatório',
            'fatura.horaDeAterragem.required' => 'campo obrigatório',
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

        $emitirDocumento = new EmitirDocumentoAeroportoAeronave(new DatabaseRepositoryFactory());
        $emitirDocumento->execute(new Request($this->fatura));

        dd($this->fatura);
    }

}
