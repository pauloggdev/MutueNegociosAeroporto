<?php

namespace App\Domain\Factory\Empresa;
use App\Infra\Repository\CarrinhoRepository;
use App\Infra\Repository\CouponDescontoRepository;
use App\Infra\Repository\Empresa\ArmazemRepository;
use App\Infra\Repository\Empresa\AtualizacaoStockRepository;
use App\Infra\Repository\Empresa\AtualizarEstoqueRepository;
use App\Infra\Repository\Empresa\CarateristicaProdutoRepository;
use App\Infra\Repository\Empresa\CartaoClienteRepository;
use App\Infra\Repository\Empresa\CategoriaRepository;
use App\Infra\Repository\Empresa\CentroCustoRepository;
use App\Infra\Repository\Empresa\ClienteRepository;
use App\Infra\Repository\Empresa\EmpresaRepository;
use App\Infra\Repository\Empresa\EntradaProdutoRepository;
use App\Infra\Repository\Empresa\ExistenciaStockRepository;
use App\Infra\Repository\Empresa\ExtratoCartaoClienteRepository;
use App\Infra\Repository\Empresa\FabricanteRepository;
use App\Infra\Repository\Empresa\FaturaProformaRepository;
use App\Infra\Repository\Empresa\FaturaReciboRepository;
use App\Infra\Repository\Empresa\FaturaRepository;
use App\Infra\Repository\Empresa\FormasPagamentoRepository;
use App\Infra\Repository\Empresa\FornecedorRepository;
use App\Infra\Repository\Empresa\InventarioRepository;
use App\Infra\Repository\Empresa\MotivosIsencaoRepository;
use App\Infra\Repository\Empresa\NotaCreditoFaturaRepository;
use App\Infra\Repository\Empresa\NotaCreditoReciboRepository;
use App\Infra\Repository\Empresa\NotaEntregaRepository;
use App\Infra\Repository\Empresa\OrderByProdutoRepository;
use App\Infra\Repository\Empresa\ParametroRepository;
use App\Infra\Repository\Empresa\ProdutoRepository;
use App\Infra\Repository\Empresa\ProvinciaRepository;
use App\Infra\Repository\Empresa\ReciboRepository;
use App\Infra\Repository\Empresa\Relatorios\RelatorioCartaoClienteJasper;
use App\Infra\Repository\Empresa\SequenciaDocumentoRepository;
use App\Infra\Repository\Empresa\SequenciaFaturaRepository;
use App\Infra\Repository\Empresa\TaxaIvaRepository;
use App\Infra\Repository\Empresa\UnidadesMedidaRepository;
use App\Infra\Repository\FaturaVendaOnlineRepository;
use App\Infra\Repository\PagamentoVendaOnlineRepository;
use App\Infra\Repository\UserRepository;
use App\Infra\Repository\Empresa\UserRepository as UserRepositoryEmpresa;

interface RepositoryFactory
{
    public function createPagamentoVendaOnlineRepository():PagamentoVendaOnlineRepository;
    public function createUserRepository():UserRepository;
    public function createFaturaPagamentoVendaOnlineRepository():FaturaVendaOnlineRepository;
    public function createCouponDescontoRepository():CouponDescontoRepository;
    public function createCarrinhoRepository():CarrinhoRepository;
    public function createSequenciaDocumentoRepository():SequenciaDocumentoRepository;
    public function createFaturaReciboRepository():FaturaReciboRepository;
    public function createFaturaProformaRepository():FaturaProformaRepository;
    public function createFaturaRepository():FaturaRepository;
    public function createCartaoClienteRepository():CartaoClienteRepository;
    public function createClienteRepository():ClienteRepository;
    public function createExistenciaStockRepository():ExistenciaStockRepository;
    public function createAtualizacaoStockRepository():AtualizacaoStockRepository;
    public function createEntradaProdutoRepository():EntradaProdutoRepository;
    public function createReciboRepository():ReciboRepository;
    public function createProdutoRepository():ProdutoRepository;
    public function createOrderByProdutoRepository():OrderByProdutoRepository;
    public function createArmazemRepository():ArmazemRepository;
    public function createCategoriaRepository():CategoriaRepository;
    public function createCentroCustoRepository():CentroCustoRepository;
    public function createFabricanteRepository():FabricanteRepository;
    public function createTaxaIvaRepository():TaxaIvaRepository;
    public function createCarateristicaRepository():CarateristicaProdutoRepository;
    public function createUnidadesMedidaRepository():UnidadesMedidaRepository;
    public function createMotivoIsencaoRepository():MotivosIsencaoRepository;
    public function createFornecedorRepository():FornecedorRepository;
    public function createProvinciaRepository():ProvinciaRepository;
    public function createSequenciaFaturaRepository():SequenciaFaturaRepository;
    public function createFormasPagamentoRepository():FormasPagamentoRepository;
    public function createNotaCreditoFaturaRepository():NotaCreditoFaturaRepository;
    public function createNotaCreditoReciboRepository():NotaCreditoReciboRepository;
    public function createAtualizarEstoqueRepository():AtualizarEstoqueRepository;
    public function createParametroRepository():ParametroRepository;
    public function createExtratoCartaoClienteRepository():ExtratoCartaoClienteRepository;
    public function createUserRepositoryEmpresa():UserRepositoryEmpresa;
    public function createInventarioRepository():InventarioRepository;
    public function createNotaEntregaRepository():NotaEntregaRepository;
    public function createEmpresaRepository():EmpresaRepository;
}
