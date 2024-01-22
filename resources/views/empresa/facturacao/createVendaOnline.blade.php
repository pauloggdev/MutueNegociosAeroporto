@php use Illuminate\Support\Str; @endphp
@section('title','Emitir documentos vendas')
<div class="facturaRegibo">
    <div class="row">
        <div class="modal fade" id="modalAdicionarQuantidade" wire:ignore.self>
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close red bolder" data-dismiss="modal">×</button>
                        <h4 class="smaller">
                            ATUALIZAR O ITEM
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="left: 0%; position: relative;">
                            <div class="col-md-12">
                                <form class="filter-form form-horizontal validation-form">
                                    @if ($errors->any())
                                        <div class="alert alert-danger">
                                            <span>{{ $errors->all()[0] }}</span>
                                        </div>
                                    @endif
                                    <div class="second-row">
                                        <div class="tabbable">
                                            <div class="tab-content profile-edit-tab-content">
                                                <div id="dados_motivo" class="tab-pane in active">
                                                    <div class="form-group has-info">
                                                        <div class="col-md-12">
                                                            <label class="control-label bold label-select2"
                                                                   for="cliente">ARMAZÉM</label>
                                                            <div>
                                                                <input type="text"
                                                                       wire:model="produtoItemModal.armazemNome"
                                                                       disabled id="cliente"
                                                                       class="col-md-12 col-xs-12 col-sm-4"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label bold label-select2"
                                                                   for="cliente">PRODUTO</label>
                                                            <div>
                                                                <input type="text"
                                                                       wire:model="produtoItemModal.nomeProduto"
                                                                       disabled id="cliente"
                                                                       class="col-md-12 col-xs-12 col-sm-4"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group has-info">
                                                        <div class="col-md-6">
                                                            <label class="control-label bold label-select2"
                                                                   for="numeroCartao">QUANTIDADE</label>
                                                            <div>
                                                                <input type="text"
                                                                       wire:model="produtoItemModal.quantidade"
                                                                       id="quantidadeItem"
                                                                       class="col-md-12 col-xs-12 col-sm-4"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label bold label-select2"
                                                                   for="descontoItem">DESCONTO</label>
                                                            <div>
                                                                <input type="text"
                                                                       wire:model="produtoItemModal.desconto"
                                                                       id="descontoItem"
                                                                       class="col-md-12 col-xs-12 col-sm-4"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalCartaoCliente" wire:ignore>
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close red bolder" data-dismiss="modal">×</button>
                        <h4 class="smaller">
                            PAGAR COM CARTÃO CLIENTE
                        </h4>

                    </div>

                    <div class="modal-body">
                        <div class="row" style="left: 0%; position: relative;">

                            <div class="col-md-12">
                                <form class="filter-form form-horizontal validation-form">
                                    @if ($errors->any())
                                        <div class="alert alert-danger">
                                            <span>{{ $errors->all()[0] }}</span>
                                        </div>
                                    @endif
                                    <div class="second-row">
                                        <div class="tabbable">
                                            <div class="tab-content profile-edit-tab-content">
                                                <div id="dados_motivo" class="tab-pane in active">
                                                    <div class="form-group has-info">
                                                        <div class="col-md-12">
                                                            <label class="control-label bold label-select2"
                                                                   for="cliente">NÚMERO DO CARTÃO CLIENTE/OU TELEFONE</label>
                                                            <div>
                                                                <input type="text"
                                                                       wire:model.debounce.1000ms="fatura.numeroCartaoCliente"
                                                                       id="cliente"
                                                                       class="col-md-12 col-xs-12 col-sm-4"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group has-info">
                                                        <div class="col-md-6">
                                                            <label class="control-label bold label-select2"
                                                                   for="numeroCartao">CLIENTE</label>
                                                            <div>
                                                                <input type="text" disabled
                                                                       wire:model="cartaoNomeCliente"
                                                                       id="cliente"
                                                                       class="col-md-12 col-xs-12 col-sm-4"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label bold label-select2"
                                                                   for="descontoItem">SALDO DISPONÍVEL</label>
                                                            <div>
                                                                <input type="text" disabled
                                                                       wire:model="fatura.saldoClienteAux"
                                                                       id="cliente"
                                                                       class="col-md-12 col-xs-12 col-sm-4"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix form-actions">
                                                <div class="col-md-9">
                                                    <button class="search-btn" style="border-radius: 10px"
                                                            wire:click.prevent="aplicarCartaoCliente">
                                                    <span wire:loading.remove wire:target="aplicarCartaoCliente">
                                                        APLICAR
                                                    </span>
                                                        <span wire:loading wire:target="aplicarCartaoCliente">
                                                        <span class="loading"></span>
                                                        Aguarde...</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <a wire:click="imprimirRelatorioDiario" title="Relatório de venda do dia" target="_blanck"
               class="btn btn-primary widget-box widget-color-blue" id="botoes">
                <span wire:loading wire:target="imprimirRelatorioDiario" class="loading"></span>
                <i class="fa fa-print text-default"></i> Relatório do dia

            </a>
            <div class="search-form-text" id="headerTitle">
                <a href="/empresa/home" style="color:white">
                    <div class="search-text">
                        <i class="menu-icon glyphicon glyphicon-step-backward"></i>
                        VOLTAR PÁGINA INICIAL
                    </div>
                </a>

                <div class="search-text" id="valorPgt">
                    Total {{ number_format($fatura['totalPagar'], 2, ',','.') }}
                    <i class="menu-icon fa fa-opencart"><span
                            id="quantProdutoCarrinho">{{ count($fatura['items']) }}</span>
                    </i>
                </div>
            </div>
        </div>
    </div>
    <div class="row" id="content-facturacao">
        <div class="col-md-9">
            <div class="row">

                <div class="col-md-6">
                    <div id="info-total">
                        <div>
                            <div class="total-item"> TOTAL DA FATURA
                                <span>{{ number_format($fatura['totalPrecoFactura'], 2, ',', '.') }}</span>
                            </div>

                            <div class="total-item">DESCONTO
                                <span>{{ number_format($fatura['totalDesconto'], 2, ',', '.') }}</span></div>

                            <div class="total-item"> TOTAL IVA
                                <span>{{ number_format($fatura['totalIva'], 2, ',', '.') }}</span></div>
                            <div class="total-item">
                                TOTAL RETENÇÃO
                                <span>{{ number_format($fatura['totalRetencao'], 2, ',', '.')}}</span>
                            </div>
                            <div class="total-item">
                                TOTAL DESCONTO CARTÃO
                                <span>{{ number_format($fatura['valorDescontarSaldo']??0, 2, ',', '.')}}</span>
                            </div>
                            <div class="total-item">
                                TOTAL A PAGAR<span>{{ number_format($fatura['totalPagar'], 2, ',', '.') }}</span>
                            </div>
                            <div class="total-item">TROCO<span>{{ number_format($fatura['totalTroco'], 2, ',', '.') }}</span>
                            </div>
                            <div class="total-item">
                                VALOR EXTENSO
                                <span style="color: red">{{ $fatura['totalExtenso'] }}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12" style="margin-bottom: 20px;">
                            <label class="control-label bold label-select2" for="armazemId">LOJA/ARMAZÉM</label>
                            <select wire:model="fatura.armazemId" data="armazemId" class="col-md-12 select2"
                                    id="armazemId">
                                @foreach($armazens as $armazem)
                                    <option
                                        value="{{ $armazem->id }}">{{ Str::upper($armazem->designacao) }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-12" style="z-index: 1">
                            <label class="control-label bold label-select2"
                                   for="proodutoId">PRODUTOS/SERVIÇOS</label>
                            <select  data="produtoSelecionado"
                                    class="col-md-12 select2">
                                <option>SELECIONA O PRODUTO</option>
                                @foreach($produtos as $produto)
                                    <option value="{{ json_encode($produto) }}" <?= $produtoSelecionadoId == $produto['produtoId']?'selected':''?>>{{ Str::upper($produto['nomeProduto']) }}
                                        - {{isset($produto['codigoProduto'])?$produto['codigoProduto']:null}} / {{ isset($produto['codigoBarraProduto'])?$produto['codigoBarraProduto']:null }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-12" style="margin-top: 10px; display: flex;justify-content: right">
                            <div class="col-md-3">
                                <input type="number" disabled wire:model="quantidadeStock" autofocus class="form-control textFormPag" style="border-radius: 5px !important;"/>
                            </div>
                            <div class="col-md-3">
                                <input type="number" wire:model="quantidade" autofocus class="form-control textFormPag" style="border-radius: 5px !important;"/>
                            </div>
                            <div style="float: right;">
                                <a wire:click="adicionarItemCarrinho"class="btn btn-app btn-primary btn-xs" style="width: 100px !important;">
                                    <span wire:loading wire:target="adicionarItemCarrinho" class="loading"></span>
                                    <i class="ace-icon fa fa-plus bigger-160"></i>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="table-header">PRODUTOS E SERVIÇOS</div>

                    <table class="table table-striped table-hover">
                        <thead style="display: table; width: 100%; table-layout: fixed">
                        @if(count($fatura['items']) > 0)
                            <tr>
                                <th style="width: 10%">CÓDIGO</th>
                                <th style="width: 45%">DESCRIÇÃO</th>
                                <th style="width: 5%">QTD.</th>
                                <th style="width: 5%;text-align:right;">IVA(%)</th>
                                <th style="text-align:right; width: 15%">PREÇO UNIT.S/IVA</th>
                                <th style="text-align:right; width: 15%">PREÇO UNIT.C/IVA</th>
                                <th style="width: 5%"></th>
                            </tr>
                        @endif
                        </thead>
                        <tbody style="display: block; height: 430px; overflow: auto">
                        @if(count($fatura['items']) <= 0)
                            <div id="semProduto">
                                <div class="semProdutoDescription">
                                    <div>
                                        <i class="glyphicon glyphicon-list"></i>
                                    </div>
                                    <div>
                                        <div class="text">NÃO EXISTE PRODUTOS/SERVIÇOS NA LISTA</div>
                                    </div>
                                </div>
                            </div>
                        @endif
                        @foreach($fatura['items'] as $produto)
                            <tr style="display: table; width: 100%; table-layout: fixed"
                                wire:click="showModalItemProduto({{ json_encode($produto) }})" data-toggle="modal"
                                data-target="#modalAdicionarQuantidade">
                                <td style="width: 10%"> {{ $produto['codigoProduto'] }}</td>
                                <td style="width: 45%"> {{ str::limit(Str::upper($produto['nomeProduto']), 50) }} </td>
                                <td style="width: 5%">{{ number_format($produto['quantidade'],1, ',', '.') }}</td>
                                <td style="text-align: right; width: 5%">
                                    <span>{{ number_format($produto['taxaIva'], 1, ',', '.') }}</span>
                                </td>
                                <td style="text-align: right; width: 15%">
                                    <span>{{ number_format($produto['precoVendaProduto'], 2, ',', '.') }}</span>
                                </td>
                                <td style="text-align: right; width: 15%">
                                    <span>{{ number_format($produto['pvp'], 2, ',', '.') }}</span>
                                </td>
                                <td style="width: 5%;">
                                    <div class="hidden-sm hidden-xs action-buttons"
                                         wire:click.stop="showModalRemoverItem({{ json_encode($produto) }})">
                                        <a class="red">
                                            <i class="ace-icon glyphicon glyphicon-remove bigger-130"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                        <tfoot>

                        <td colspan="1">
                            <button type="button" wire:click="showModalLimparTodoCarrinho"
                                    class="btn btn-white btn-danger btn-sm mt-4">
                                <i class="ace-icon glyphicon glyphicon-remove" aria-hidden="true"></i>
                                Limpar
                            </button>
                        </td>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-3" style="padding-right:0px;">
            <div class="row">
                <label class="control-label bold" for="preco_compra">SELECIONAR CLIENTE

                    @if($fatura['aplicadoCartaoCliente'])
                        <a href="#modalCartaoCliente" wire:click="showModalCartaoCliente" title="ativo pagar com saldo"
                           data-toggle="modal"
                           style="background:green; padding: 5px;border-radius: 5px;color: white; cursor: pointer;">PAGAR
                            COM SALDO</a>
                        <i wire:click="showCancelarPagarComSaldoCliente"
                           style="color: red;font-size: 40px;align-items: center;top: 3px;background: green;padding: 4px;cursor:pointer;border-radius: 2px"
                           class="ace-icon glyphicon glyphicon-remove bigger-130"></i>
                    @else
                        <a href="#modalCartaoCliente" wire:click="showModalCartaoCliente" data-toggle="modal"
                           title="desativo pagar com saldo"
                           style="background:red; padding: 5px;border-radius: 5px;color: white; cursor: pointer;">PAGAR
                            COM SALDO</a>
                    @endif
                </label>
                <select wire:model="fatura.clienteId" data="clienteId" class="col-md-12 select2"
                        id="clienteId" <?= $fatura['aplicadoCartaoCliente'] ? 'disabled' : '' ?>>
                    @foreach($clientes as $cliente)
                        <option value="{{ $cliente->id }}">{{ Str::upper($cliente->nome) }}</option>
                    @endforeach
                </select>
            </div>
            <div class="row">
                <div class="col-md-12" style="padding:0px">
                    <div class="tabbable">
                        <ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
                            <li class="active">
                                <a data-toggle="tab" href="#dropdown14">PAGAMENTO</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#dropdown16">DESCONTO/RETENÇÃO</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="dropdown14" class="tab-pane active">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="inputFormPag">
                                            <label class="control-label bold" for="preco_compra">
                                                FORMA PAGAMENTO
                                                <span class="tooltip-target" data-toggle="tooltip" data-placement="top">
                                                <i class="fa fa-question-circle bold text-danger"></i>
                                            </span>
                                            </label>
                                            <select style="margin-bottom: 10px;" wire:model="fatura.formaPagamentoId"
                                                    <?= $fatura['aplicadoCartaoCliente'] ? 'disabled' : '' ?>
                                                    data="formaPagamentoId" class="col-md-12 select2 textFormPag"
                                                    id="formaPagamentoId">
                                                @foreach($formasPagamento as $formaPagamento)
                                                    <option
                                                        value="{{ $formaPagamento->id }}" {{ $formaPagamento->id == 5?'disabled':'' }} >{{ Str::upper($formaPagamento->descricao) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        @if(!$selectedVendaCredito)
                                            @if(!$selectedMulticaixa)
                                                <div class="inputFormPag">
                                                    <label class="control-label bold" for="preco_compra">
                                                        VALOR ENTREGUE
                                                    </label>
                                                    <input type="number"
                                                           wire:model.debounce.500ms="fatura.totalEntregue"
                                                           id="disabled-valor_pagar" class="form-control textFormPag"/>
                                                </div>
                                            @endif
                                            <div class="inputFormPag">
                                                <label class="control-label bold" for="preco_compra">VALOR
                                                    MULTICAIXA</label>



                                                <input type="{{ $selectedMulticaixa?'text':'number' }}" step="any"
                                                       {{ $selectedMulticaixa ? 'disabled':'' }} wire:model.500ms="fatura.totalMulticaixa"
                                                       id="valorMulticaixa"
                                                       class="form-control textFormPag"/>
                                            </div>
                                        @endif
                                            {{--                                            <div class="inputFormPag">--}}
                                            {{--                                                <label class="control-label bold" for="preco_compra">VALOR--}}
                                            {{--                                                    CASH</label>--}}
                                            {{--                                                <input type="number" wire:model="fatura.totalCash" id="valorCash" class="form-control textFormPag"/>--}}
                                            {{--                                            </div>--}}
                                    </div>
                                </div>
                            </div>
                            <div id="dropdown16" class="tab-pane">
                                <div class="row">
                                    <div class="col-md-12 inputFormPag">
                                        <div class="inputFormPag">
                                            <label class="control-label bold" for="preco_compra">
                                                DESCONTO
                                            </label>
                                            <input type="number" wire:model="fatura.desconto" max="100" :min="1"
                                                   class="form-control textFormPag"/>
                                        </div>
                                        <div class="checkbox">
                                            <label class="block">
                                                <input name="form-field-checkbox" wire:model="fatura.isRetencao"
                                                       type="checkbox"
                                                       class="ace input-sm textFormPag"/>
                                                <span class="lbl bigger-100">APLICAR RETENÇÃO NA FONTE</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="padding: 0px">
                                    <div class="tabbable">
                                        <ul class="nav nav-tabs padding-12 tab-color-blue background-blue " id="myTab4">
                                            <li class="active">
                                                <a data-toggle="tab" href="#dropdown17">TIPO DOCUMENTO</a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#dropdown18">FORMATO DOCUMENTO</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div id="dropdown17" class="tab-pane in active">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" id="radio1"
                                                               wire:model="fatura.tipoDocumento" wire:click="selecionarTipoDocumento(1)" value="1"
                                                               class="ace input-sm"/>
                                                        <span class="lbl bigger-100">FT.RECIBO</span>
                                                    </label>
                                                    <label>
                                                        <input type="radio" wire:model="fatura.tipoDocumento" <?= $fatura['aplicadoCartaoCliente']?'disabled':''?>
                                                               id="radio2" value="2" class="ace input-sm" wire:click="selecionarTipoDocumento(2)" />
                                                        <span class="lbl bigger-100">FATURA</span>
                                                    </label>

                                                    <label>
                                                        <input type="radio" wire:model="fatura.tipoDocumento" <?= $fatura['aplicadoCartaoCliente']?'disabled':''?>
                                                               id="radio3" value="3" class="ace input-sm" wire:click="selecionarTipoDocumento(3)"/>
                                                        <span class="lbl bigger-100">PROFORMA</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div id="dropdown18" class="tab-pane">
                                                <div class="row">
                                                    <div class="col-md-12 FormatoImpressao">
                                                        <div class="form-group">
                                                            <div class="form-check" style="float: left">
                                                                <div class="radio" style="display: flex">
                                                                    <label class="form-check-label" style="margin-right: 15px">
                                                                        <input type="radio" wire:model="fatura.tipoFolha"
                                                                               id="radio4" value="A4" class="ace input-sm"/>
                                                                        <span class="lbl bigger-100">A4</span>
                                                                    </label>
                                                                    <label class="form-check-label">
                                                                        <input type="radio" wire:model="fatura.tipoFolha"
                                                                               id="radio5" value="TICKET" class="ace input-sm"/>
                                                                        <span class="lbl bigger-100">TICKET</span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="padding: 0px">
                                    <div class="tabbable">
                                        <ul class=" nav nav-tabs padding-12 tab-color-blue background-blue "
                                            id="myTab4">
                                            <li class="active">
                                                <a data-toggle="tab" href="#clienteDiverso1">DADOS CLIENTE</a>
                                            </li>

                                            <li>
                                                <a data-toggle="tab" href="#clienteDiverso2">DADOS CLIENTE</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div id="clienteDiverso1" class="tab-pane in active">
                                                <div class="row inputCliente">
                                                    <div class="col-md-12 inputFormPag">
                                                        <label class="control-label bold" for="preco_compra">
                                                            NOME
                                                            <span class="tooltip-target" data-toggle="tooltip"
                                                                  data-placement="top">
                                                                        <i class="fa fa-question-circle bold text-danger"></i>
                                                                    </span>
                                                        </label>
                                                        <input autocomplete="true" wire:model="fatura.nomeCliente" <?= $fatura['aplicadoCartaoCliente']?'disabled':''?>
                                                               type="text" class="form-control textFormPag"/>
                                                    </div>
                                                    <div class="col-md-12 inputFormPag">
                                                        <label class="control-label bold" for="preco_compra">
                                                            NIF
                                                            <span class="tooltip-target" data-toggle="tooltip"
                                                                  data-placement="top">
                                                                        <i class="fa fa-question-circle bold text-danger"></i>
                                                            </span>
                                                        </label>
                                                        <input type="text" wire:model="fatura.nifCliente" <?= $fatura['aplicadoCartaoCliente']?'disabled':''?>
                                                               class="form-control textFormPag"/>
                                                    </div>
                                                    <div class="col-md-12 inputFormPag">
                                                        <label class="control-label bold" for="telefoneCliente">
                                                            TELEFONE
                                                            <span class="tooltip-target" data-toggle="tooltip"
                                                                  data-placement="top">
                                                                        <i class="fa fa-question-circle bold text-danger"></i>
                                                                    </span>
                                                        </label>
                                                        <input type="text" wire:model="fatura.telefoneCliente" <?= $fatura['aplicadoCartaoCliente']?'disabled':''?>
                                                               class="form-control textFormPag"/>
                                                    </div>

                                                    <div class="col-md-12 inputFormPag">
                                                        <label class="control-label bold" for="enderecoCliente">
                                                            ENDEREÇO
                                                            <span class="tooltip-target" data-toggle="tooltip"
                                                                  data-placement="top">
                                                                        <i class="fa fa-question-circle bold text-danger"></i>
                                                                    </span>
                                                        </label>
                                                        <input type="text" wire:model="fatura.enderecoCliente" <?= $fatura['aplicadoCartaoCliente']?'disabled':''?>
                                                               class="form-control textFormPag"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="clienteDiverso2" class="tab-pane">
                                                <div class="row inputCliente">
                                                    <div class="col-md-12 inputFormPag">
                                                        <label class="control-label bold" for="conta_corrente">
                                                            CONTA CORRENTE
                                                        </label>
                                                        <input autocomplete="true"
                                                               wire:model="fatura.contaCorrenteCliente" disabled
                                                               type="text"
                                                               class="form-control textFormPag"/>
                                                    </div>
                                                    <div class="col-md-12 inputFormPag">
                                                        <label class="control-label bold" for="preco_compra">
                                                            EMAIL
                                                        </label>
                                                        <input type="text" wire:model="fatura.emailCliente" <?= $fatura['aplicadoCartaoCliente']?'disabled':''?>
                                                               class="form-control textFormPag"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="" style="float: right;">
            <a wire:click="emitirDocumento"class="btn btn-app btn-primary btn-xs" style="width: 100px !important;">
                <span wire:loading wire:target="emitirDocumento" class="loading"></span>
                <i class="ace-icon fa fa-print bigger-160"></i>FATURAR

            </a>
        </div>
    </div>
</div>
