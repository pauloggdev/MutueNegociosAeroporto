<?php

namespace App\Http\Controllers\empresa\Produtos;

use App\Application\UseCase\Empresa\Categorias\GetCategorias;
use App\Application\UseCase\Empresa\Categorias\GetCategoriaSubCategoriaPeloId;
use App\Application\UseCase\Empresa\Categorias\GetSubCategorias;
use App\Application\UseCase\Empresa\CentrosDeCusto\GetCentrosCustoSemPaginacao;
use App\Application\UseCase\Empresa\Fabricantes\GetFabricantes;
use App\Application\UseCase\Empresa\MotivosIsencao\GetMotivosIsencao;
use App\Application\UseCase\Empresa\Parametros\GetParametroPeloLabelNoParametro;
use App\Application\UseCase\Empresa\Produtos\AtualizarProduto;
use App\Application\UseCase\Empresa\Produtos\GetCaracteristicasProduto;
use App\Application\UseCase\Empresa\Produtos\GetProdutoUuid;
use App\Application\UseCase\Empresa\Produtos\TraitUploadFileProduto;
use App\Application\UseCase\Empresa\TaxasIva\GetTaxasIvaDaEmpresaRegimeExclusaoESimplificado;
use App\Application\UseCase\Empresa\TaxasIva\GetTaxasIvaDaEmpresaRegimeGeral;
use App\Application\UseCase\Empresa\UnidadesMedida\GetUnidadesMedida;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use PharIo\Version\Exception;

class ProdutoUpdateController extends Component
{

    use WithFileUploads;
    use LivewireAlert;
    use WithPagination;
    use TraitUploadFileProduto;


    public $codigoBarra;
    public $codigoProduto;
    public $produto;
    public $URL;
    public $uuid;
    public $imagem;
    public $margemLucro;
    public $ivaIncluido = false;
    public $armazens = [];
    public $categorias = [];
    public $fabricantes = [];
    public $taxasIva = [];
    public $motivosIsencao = [];
    public $unidadesMedida = [];
    public $carateristicasProduto = [];
    protected $listeners = ['refresh-me' => '$refresh', 'selectedItem','eliminarImage'];


    public function mount($uuid)
    {
        $getParametroPVP = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $parametroPvp = $getParametroPVP->execute('incluir_iva');
        $this->ivaIncluido = $parametroPvp['valor'] == 'sim' ? true : false;

        $getParametroPeloLabel = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $codigoProdutoData = $getParametroPeloLabel->execute('codigo_produto');
        $codigoBarra = $getParametroPeloLabel->execute('codigo_barra');
        $this->codigoBarra = $codigoBarra['valor'] == 'sim' ? true : false;
        $this->codigoProduto = $codigoProdutoData['valor'] == 'sim' ? true : false;

        $this->URL =  env('APP_URL');
        $this->uuid = $uuid;
        $produto = new GetProdutoUuid(new DatabaseRepositoryFactory());
        $produto = $produto->execute($uuid);

        if (!$produto) {
            return redirect()->back();
        }

        $this->produto['id'] = $produto['id'];
        $this->produto['designacao'] = $produto['designacao'];
        $this->produto['preco_compra'] = $produto['preco_compra'];
        $this->produto['preco_venda'] = $produto['preco_venda'];
        $this->produto['pvp'] = $produto['pvp'];
        $this->produto['status_id'] = $produto['status_id'];
        $this->produto['quantidade_minima'] = $produto['quantidade_minima'];
        $this->produto['quantidade_critica'] = $produto['quantidade_critica'];
        $this->produto['stocavel'] = $produto['stocavel'];
        $this->produto['unidade_medida_id'] = $produto['unidade_medida_id'];
        $this->produto['fabricante_id'] = $produto['fabricante_id'];
        $this->produto['codigo_taxa'] = $produto['codigo_taxa'];
        $this->produto['venda_online'] = $produto['venda_online'] == 'Y' ? true : false;
        $this->produto['cartaGarantia'] = $produto['cartaGarantia'] == 'Y' ? true : false;
        $this->produto['tempoGarantiaProduto'] = $produto['tempoGarantiaProduto'];
        $this->produto['tipoGarantia'] = $produto['tipoGarantia'];
        $this->produto['motivo_isencao_id'] = $produto['motivo_isencao_id'];
        $this->produto['imagem_produto'] = null;
        $this->produto['imagens'] = null;
        $this->produto['antImagemProduto'] = $produto['imagem_produto'];
        $this->produto['AntProdutoImagens'] = $produto['produtoImagens'];
        $this->produto['codigo_barra'] = $produto['codigo_barra'];
        $this->produto['referencia'] = $produto['referencia'];
        $this->produto['categoria_id'] = $produto['orderCategoria1']??$produto['categoria_id'];
        $this->produto['subCategoria1'] =  $produto['orderCategoria2'];
        $this->produto['subCategoria2'] =  $produto['orderCategoria3'];


        $getCentrosCusto = new GetCentrosCustoSemPaginacao(new DatabaseRepositoryFactory());
        $this->centrosCusto = $getCentrosCusto->execute();
        $this->produto['centroCustoId'] = $produto['centroCustoId'];


        $getCaracteristicasProduto = new GetCaracteristicasProduto(new DatabaseRepositoryFactory());
        $this->carateristicasProduto = $getCaracteristicasProduto->execute();

        $getCategorias = new GetCategorias(new DatabaseRepositoryFactory());
        $this->categorias = $getCategorias->execute();


        $getFabricantes = new GetFabricantes(new DatabaseRepositoryFactory());
        $this->fabricantes = $getFabricantes->execute();

        $REGIME_GERAL = 1;
        if (auth()->user()->empresa->tiporegime->id == $REGIME_GERAL) {
            $getTaxasIva = new GetTaxasIvaDaEmpresaRegimeGeral(new DatabaseRepositoryFactory());
        } else {
            $getTaxasIva = new GetTaxasIvaDaEmpresaRegimeExclusaoESimplificado(new DatabaseRepositoryFactory());
        }

        $this->taxasIva = $getTaxasIva->execute();
        $getUnidadesMedida = new GetUnidadesMedida(new DatabaseRepositoryFactory());
        $this->unidadesMedida = $getUnidadesMedida->execute();
    }

    public function hydrate()
    {
        $this->emit('select2');
    }

    public function selectedItem($item)
    {
        $this->produto[$item['atributo']] = $item['valor'];
        if ($item['atributo'] == 'codigo_taxa') $this->calcularPVP();

    }


    public function render()
    {
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


        if (count($data['subCategorias1']) <= 0 || !is_numeric($subCategoria1)) {
            $this->produto['subCategoria2'] = null;
            $this->produto['subCategoria1'] = null;
            $subCategoria1 = null;
        }
        $data['subCategorias2'] = $getSubCategoria->execute($subCategoria1);
        return view('empresa.produtos.edit', $data);
    }
    public function selecionarGarantia($tipoGarantia = null){
        $this->produto['tipoGarantia'] = $tipoGarantia;
    }

    public function update()
    {
        $this->produto['tempoGarantiaProduto'] = $this->produto['tempoGarantiaProduto'] == 0 ? null : $this->produto['tempoGarantiaProduto'];
        $this->produto['cartaGarantia'] = $this->produto['tempoGarantiaProduto'] == 0 ? false : true;
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
            'produto.centroCustoId' => ['required'],
            'produto.imagem_produto' => 'nullable|mimes:jpeg,png,jpg',
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
            'produto.fabricante_id' => ['required']
        ];
        $messages = [
            'produto.designacao.required' => 'É obrigatório o nome',
            'produto.imagem_produto.mimes' => 'Formato imagens suportado(jpeg,png,jpg)',
            'produto.categoria_id.required' => 'É obrigatório a categoria',
            'produto.fabricante_id.required' => 'É obrigatório o fabricante',
            'produto.preco_venda.required' => 'É obrigatório o preço de venda',
            'produto.centroCustoId.required' => 'Informe o centro de custo',
            'produto.status_id.required' => 'É obrigatório o status',
        ];
        $this->validate($rules, $messages);

        try {
            DB::beginTransaction();
            $atualizarProduto = new AtualizarProduto(new DatabaseRepositoryFactory());
            $output = $atualizarProduto->execute(new Request($this->produto), $this->produto['id']);
            DB::commit();
            $this->confirm('Operação realizada com sucesso', [
                'showConfirmButton' => false,
                'showCancelButton' => false,
                'icon' => 'success'
            ]);
            $this->mount($this->uuid);

        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
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
    public function modalDelImagem($imagem)
    {
        $this->imagem = $imagem;
        $this->confirm('Deseja apagar a imagem?', [
            'onConfirmed' => 'eliminarImage',
            'cancelButtonText' => 'Não',
            'confirmButtonText' => 'Sim',
        ]);
    }
    public function eliminarImage($data)
    {
        if ($data['value']) {
            DB::connection('mysql2')->table('produto_imagens')
                ->where('id', $this->imagem['id'])->delete();
            $this->eliminarFileProdutoAdicionais($this->imagem['url']);
            $this->mount($this->uuid);
        }
    }

    public function updatedProdutoPrecoVenda()
    {
        $preco_compra = (int)$this->produto['preco_compra'] ?? 0;
        $margemLucro = (int)$this->margemLucro ?? 0;
        $precoVenda = is_numeric($this->produto['preco_venda'])?$this->produto['preco_venda']: null;
        if($precoVenda && $margemLucro > 0){
            $this->produto['preco_venda'] = $precoVenda + $preco_compra + (($preco_compra * $margemLucro) / 100);
            $this->calcularPVP();
        }
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
