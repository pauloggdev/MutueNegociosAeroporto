<?php

namespace App\Http\Controllers\empresa\Produtos;

use App\Application\UseCase\Empresa\Armazens\GetArmazens;
use App\Application\UseCase\Empresa\Categorias\GetCategorias;
use App\Application\UseCase\Empresa\Categorias\GetSubCategorias;
use App\Application\UseCase\Empresa\CentrosDeCusto\GetCentrosCusto;
use App\Application\UseCase\Empresa\CentrosDeCusto\GetCentrosCustoSemPaginacao;
use App\Application\UseCase\Empresa\Fabricantes\GetFabricantes;
use App\Application\UseCase\Empresa\MotivosIsencao\GetMotivosIsencao;
use App\Application\UseCase\Empresa\Parametros\GetParametroPeloLabelNoParametro;
use App\Application\UseCase\Empresa\Produtos\CadastrarProduto;
use App\Application\UseCase\Empresa\Produtos\GetCaracteristicasProduto;
use App\Application\UseCase\Empresa\TaxasIva\GetTaxasIva;
use App\Application\UseCase\Empresa\TaxasIva\GetTaxasIvaDaEmpresaRegimeExclusaoESimplificado;
use App\Application\UseCase\Empresa\TaxasIva\GetTaxasIvaDaEmpresaRegimeGeral;
use App\Application\UseCase\Empresa\UnidadesMedida\GetUnidadesMedida;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Models\empresa\CentroCusto;
use App\Models\empresa\User;
use App\Models\empresa\UserPerfil;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Livewire\Component;
use Livewire\WithFileUploads;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;

class ProdutoCreateController extends Component
{
    use WithFileUploads;
    use LivewireAlert;
    use WithPagination;

    protected $paginationTheme = 'bootstrap';
    public $codigoBarra;
    public $codigoProduto;
    public $produto;
    public $margemLucro;
    public $centrosCusto = [];
    public $centroCustoData = [];
    public $armazens = [];
    public $categorias = [];
    public $fabricantes = [];
    public $taxasIva = [];
    public $ivaIncluido = false;
    public $motivosIsencao = [];
    public $unidadesMedida = [];
    public $carateristicasProduto = [];
    protected $listeners = ['refresh-me' => '$refresh', 'selectedItem','selectedFuncaoItem'];


    public function mount()
    {
        $this->setarValor();

        $getParametroPVP = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $parametroPvp = $getParametroPVP->execute('incluir_iva');
        $this->ivaIncluido = $parametroPvp['valor'] == 'sim' ? true : false;

        $getParametroPeloLabel = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $margeLucroData = $getParametroPeloLabel->execute('margem_lucro');
        $codigoProdutoData = $getParametroPeloLabel->execute('codigo_produto');
        $codigoBarra = $getParametroPeloLabel->execute('codigo_barra');
        $this->margemLucro = $margeLucroData['valor'];
        $this->codigoBarra = $codigoBarra['valor'] == 'sim' ? true : false;
        $this->codigoProduto = $codigoProdutoData['valor'] == 'sim' ? true : false;

        $getCaracteristicasProduto = new GetCaracteristicasProduto(new DatabaseRepositoryFactory());
        $this->carateristicasProduto = $getCaracteristicasProduto->execute();

        $getArmazens = new GetArmazens(new DatabaseRepositoryFactory());
        $this->armazens = $getArmazens->execute();
        $this->produto['armazem_id'] = $this->armazens[0]['id'];

        $userAdmin = UserPerfil::where('user_id', auth()->user()->id)
            ->where('perfil_id', 1)->first();
        if($userAdmin){
            $centroCustos = CentroCusto::where('empresa_id', auth()->user()->empresa_id)->get();
            $this->centrosCusto = $centroCustos;
        }else{
            $user = User::with(['centrosCusto', 'perfis'])->find(auth()->user()->id);
            $this->centrosCusto = $user->centrosCusto;
        }
        $centroCustoId = session()->get('centroCustoId');

        array_push($this->centroCustoData, $centroCustoId);

        $getCategorias = new GetCategorias(new DatabaseRepositoryFactory());
        $this->categorias = $getCategorias->execute();
        $this->produto['categoria_id'] = $this->categorias[0]['id'];
        $this->produto['subCategoria1'] = null;
        $this->produto['subCategoria2'] = null;

        $getFabricantes = new GetFabricantes(new DatabaseRepositoryFactory());
        $this->fabricantes = $getFabricantes->execute();
        $this->produto['fabricante_id'] = $this->fabricantes[0]['id'];

        $REGIME_GERAL = 1;
        if (auth()->user()->empresa->tiporegime->id == $REGIME_GERAL) {
            $getTaxasIva = new GetTaxasIvaDaEmpresaRegimeGeral(new DatabaseRepositoryFactory());
        } else {
            $getTaxasIva = new GetTaxasIvaDaEmpresaRegimeExclusaoESimplificado(new DatabaseRepositoryFactory());
        }
        $this->taxasIva = $getTaxasIva->execute();
        $this->produto['codigo_taxa'] = $this->taxasIva[0]['codigo'];

        $getUnidadesMedida = new GetUnidadesMedida(new DatabaseRepositoryFactory());
        $this->unidadesMedida = $getUnidadesMedida->execute();
        $this->produto['unidade_medida_id'] = $this->unidadesMedida[0]['id'];
    }

    public function hydrate()
    {
        $this->emit('select2');
    }
    public function selectedFuncaoItem($item)
    {
        $this->centroCustoData =$item;
    }



    public function selectedItem($item)
    {
        $this->produto[$item['atributo']] = $item['valor'];
    }


    public function render()
    {
        $this->produto['quantidade'] = $this->produto['stocavel'] == 'Sim' ? $this->produto['quantidade'] : 0;
        $getMotivosIsencao = new GetMotivosIsencao(new DatabaseRepositoryFactory());

        $TAXA_IVA_ZERO = 1;
        if ($this->produto['codigo_taxa'] != $TAXA_IVA_ZERO) {
            $this->motivosIsencao = [];
            $this->produto['motivo_isencao_id'] = null;
        } else {
            $this->motivosIsencao = $getMotivosIsencao->execute();
        }
        $categoriaMaeId = $this->produto['categoria_id'];
        $subCategoria1 = $this->produto['subCategoria1'];

        $getSubCategoria = new GetSubCategorias(new DatabaseRepositoryFactory());
        $data['subCategorias1'] = $getSubCategoria->execute($categoriaMaeId);

        $this->calcularPVP();

        if (count($data['subCategorias1']) <= 0 || !is_numeric($subCategoria1)) {
            $this->produto['subCategoria2'] = null;
            $this->produto['subCategoria1'] = null;
            $subCategoria1 = null;
        }
        $data['subCategorias2'] = $getSubCategoria->execute($subCategoria1);
        return view('empresa.produtos.create', $data);
    }
    public function selecionarGarantia($tipoGarantia){
        $this->produto['tipoGarantia'] = $tipoGarantia;
    }

    public function store()
    {

        if(!$this->centroCustoData){
            $this->confirm('Informe pelo menos um centro de Custo', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'warning'
            ]);
            return;
        }

        $this->produto['centrosCustos'] = $this->centroCustoData;
        $rules = [
            'produto.designacao' => ['required'],
            'produto.codigo_barra' => [function ($attr, $codigoBarra, $fail) {
                if ($this->codigoBarra && !$codigoBarra) {
                    $fail("Informe o código de barra");
                }
            }],
            'produto.referencia' => [function ($attr, $referencia, $fail) {
             if ($this->codigoProduto && !$referencia) {
                    $fail("Informe o código do produto");
                }
            }],
            'produto.categoria_id' => ['required'],
            'produto.imagens' => [function ($attr, $imagens, $fail) {
                if ($imagens) {
                    foreach ($imagens as $imagem) {
                        if (!in_array($imagem->extension(), array("jpeg", "png", "jpg"))) {
                            $fail("Formato imagens suportado(jpeg,png,jpg)");
                        }
                    }
                }
            }],
            'produto.preco_compra' => [function ($atr, $precoCompra, $fail) {
                if (!is_numeric($precoCompra) && $precoCompra) {
                    $fail('Informe o preço de compra');
                }
            }],
            'produto.preco_venda' => ['required', function ($atr, $precoVenda, $fail) {
                if (!is_numeric($precoVenda)) {
                    $fail('Informe o preço de venda');
                }
                if ($precoVenda < 0) {
                    $fail('O preço de venda não pode ser negativo');
                }
            }],
            'produto.status_id' => ['required'],
            'produto.codigo_taxa' => ['required'],
            'produto.fabricante_id' => ['required'],
            'produto.imagem_produto' => [function ($attr, $imagem_produto, $fail) {
                if ($imagem_produto) {
                    if (!in_array($imagem_produto->extension(), array("jpeg", "png", "jpg"))) {
                        $fail("Formato imagens suportado(jpeg,png,jpg)");
                    }
                }
                if (auth()->user()->empresa->venda_online == 'Y' && $this->produto['venda_online'] && !$imagem_produto) {
                    $fail("Informe a imagem");
                }
            }]
        ];
        $messages = [
            'produto.designacao.required' => 'É obrigatório o nome',
            'produto.imagem_produto.mimes' => 'Formato imagens suportado(jpeg,png,jpg)',
            'produto.categoria_id.required' => 'É obrigatório a categoria',
            'produto.fabricante_id.required' => 'É obrigatório o fabricante',
            'produto.preco_venda.required' => 'É obrigatório o preço de venda',
            'produto.status_id.required' => 'É obrigatório o status',
            'produto.centroCustoId.required' => 'Informe o centro de custo',
            'produto.unidade_medida_id' => ''
        ];
        $this->validate($rules, $messages);
        try {
            DB::beginTransaction();
            $cadastrarProduto = new CadastrarProduto(new DatabaseRepositoryFactory());
            $cadastrarProduto->execute(new Request($this->produto));
            DB::commit();
            $this->confirm('Operação realizada com sucesso', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'success'
            ]);
            $this->setarValor();

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }
    public function preventEnter()
    {
        $this->dispatchBrowserEvent('preventEnter');
    }

    public function setarValor()
    {

        $getFabricantes = new GetFabricantes(new DatabaseRepositoryFactory());
        $this->fabricantes = $getFabricantes->execute();
        $this->produto['fabricante_id'] = $this->fabricantes[0]['id'];

        $getArmazens = new GetArmazens(new DatabaseRepositoryFactory());
        $this->armazens = $getArmazens->execute();
        $this->produto['armazem_id'] = $this->armazens[0]['id'];

        $this->produto['designacao'] = NULL;
        $this->produto['preco_venda'] = NULL;
        $this->produto['pvp'] = NULL;
        $this->produto['preco_compra'] = NULL;
        $this->produto['venda_online'] = false;
        $this->produto['tempoGarantiaProduto'] = null;
        $this->produto['tipoGarantia'] = null;
        $this->produto['imagens'] = [];
        $this->produto['marca_id'] = NULL;
        $this->produto['classe_id'] = NULL;
        $this->produto['canal_id'] = 2;
        $this->produto['quantidade_minima'] = 0;
        $this->produto['quantidade_critica'] = 0;
        $this->produto['categoria_id'] = 1;
        $this->produto['status_id'] = 1;
        $this->produto['stocavel'] = "Sim";
        $this->produto['quantidade'] = 0;
        $this->produto['unidade_medida_id'] = 1;
        $this->produto['codigo_taxa'] = 1;
        $this->produto['motivo_isencao_id'] = 8;
        $this->produto['imagem_produto'] = null;
        $this->produto['margemLucro'] = 0;
        $this->produto['codigo_barra'] = null;
        $this->produto['referencia'] = null;
        $this->margemLucro = 0;
        $centrosCusto = auth()->user()->centrosCusto;
        $this->centrosCusto = $centrosCusto;
    }

    public function calcularPVP()
    {
        if(!is_numeric($this->produto['preco_venda']) || !isset($this->produto['preco_venda'])){
            $this->produto['pvp'] = 0;
            return;
        }
        $valorIva = $this->ivaIncluido ? $this->getValorIva($this->produto['codigo_taxa']) : 0;
        $precoVenda = !isset($this->produto['preco_venda']) ? 0 : $this->produto['preco_venda'];
        $this->produto['pvp'] = $precoVenda + ($precoVenda * $valorIva) / 100;
    }

    public function updatedProdutoPrecoVenda()
    {
        $preco_compra = (int)$this->produto['preco_compra'] ?? 0;
        $margemLucro = (int)$this->margemLucro ?? 0;
        $precoVenda = is_numeric($this->produto['preco_venda'])?$this->produto['preco_venda']: null;
        if($precoVenda && $margemLucro > 0){
            $this->produto['preco_venda'] = $precoVenda + $preco_compra + (($preco_compra * $margemLucro) / 100);
        }
        $this->calcularPVP();

    }

    public function getValorIva($codigoId)
    {
        return DB::connection('mysql2')->table('tipotaxa')
            ->where('codigo', $codigoId)->first()->taxa;
    }

    public function updatedProdutoPrecoCompra()
    {
        $preco_compra = (int)$this->produto['preco_compra'] ?? 0;
        $margemLucro = (int)$this->margemLucro ?? 0;
        if ($margemLucro > 0) {
            $this->produto['preco_venda'] = $preco_compra + (($preco_compra * $margemLucro) / 100);
            $this->calcularPVP();
        }
    }
    public function updatedMargemLucro()
    {
        $preco_compra = (int)$this->produto['preco_compra'] ?? 0;
        $margemLucro = (int)$this->margemLucro ?? 0;
        if ($preco_compra > 0 && $margemLucro > 0) {
            $this->produto['preco_venda'] = $preco_compra + (($preco_compra * $margemLucro) / 100);
            $this->calcularPVP();
        }
    }
}
