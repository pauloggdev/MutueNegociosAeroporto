@php use Illuminate\Support\Str; @endphp
@section('title','Editar produto')
<div class="row">
    <div class="space-6"></div>
    <div class="page-header" style="left: 0.5%; position: relative">
        <h1>
            EDITAR PRODUTO
        </h1>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="alert alert-warning hidden-sm hidden-xs">
                <button type="button" class="close" data-dismiss="alert">
                    <i class="ace-icon fa fa-times"></i>
                </button>
                Os campos marcados com
                <span class="tooltip-target" data-toggle="tooltip" data-placement="top"><i
                        class="fa fa-question-circle bold text-danger"></i></span>
                são de preenchimento obrigatório.
            </div>
        </div>
    </div>
    @if (Session::has('success'))
        <div class="alert alert-success alert-success col-xs-12" style="left: 0%;">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h5><i class="icon fa fa-check-square-o bigger-150"></i>{{ Session::get('success') }}</h5>
        </div>
    @endif
    <div class="row">
        <div class="col-md-12">
            <form class="filter-form form-horizontal validation-form" id="validation-form">
                <div class="second-row">
                    <div class="tabbable">
                        <div class="tab-content profile-edit-tab-content">
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="nomeCliente">Nome<b
                                            class="red fa fa-question-circle"></b></label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.designacao" class="form-control"
                                               id="nomeProduto" autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.designacao') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.designacao'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.designacao') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label bold label-select2" for="referencia">Código
                                        produto
                                        @if($codigoProduto)
                                            <b class="red fa fa-question-circle"></b>
                                        @endif
                                    </label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.referencia" class="form-control"
                                               id="referencia"
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.referencia') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-barcode bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.referencia'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.referencia') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label bold label-select2" for="codigoBarra">Código
                                        barra
                                        @if($codigoBarra)
                                            <b class="red fa fa-question-circle"></b>
                                        @endif
                                    </label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.codigo_barra" class="form-control"
                                               id="codigoBarra"
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.codigo_barra') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-barcode bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.codigo_barra'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.codigo_barra') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label bold label-select2" for="status_id">Status</label>
                                    <select wire:model="produto.status_id" data="status_id" class="col-md-12 select2"
                                            id="status_id"
                                            style="height:35px;<?= $errors->has('produto.status_id') ? 'border-color: #ff9292;' : '' ?>">
                                        <option value="1" <?= $produto['status_id'] == 1 ? 'selected' : '' ?>>Activo
                                        </option>
                                        <option value="2" <?= $produto['status_id'] == 2 ? 'selected' : '' ?>>
                                            Inativo
                                        </option>
                                    </select>
                                    @if ($errors->has('produto.status_id'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.status_id') }}</strong>
                                    </span>
                                    @endif
                                </div>                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="precoCompra">Preço de
                                        Compra</label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.preco_compra" class="form-control"
                                               id="precoCompra" autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.preco_compra') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.preco_compra'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.preco_compra') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="margemLucro">Margem de
                                        lucro(%)</label>
                                    <div class="input-group">
                                        <input type="number" wire:model="margemLucro" class="form-control"
                                               id="margemLucro" autofocus style="height: 35px; font-size: 10pt;"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="preco_venda">Preço de Venda<b
                                            class="red fa fa-question-circle"></b></label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.preco_venda" class="form-control"
                                               id="preco_venda" autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.preco_venda') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.preco_venda'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.preco_venda') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="preco_venda">PVP</label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.pvp" disabled class="form-control"
                                               id="preco_venda" autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.preco_venda') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>


                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="categoria_id">Categoria
                                        mãe</label>
                                    <select wire:model="produto.categoria_id" data="categoria_id"
                                            class="col-md-12 select2" id="categoria_id"
                                            style="height:35px;<?= $errors->has('produto.categoria_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($categorias as $categoria)
                                            <option
                                                value="{{$categoria->id}}" <?= $produto['categoria_id'] == $categoria->id ? 'selected' : '' ?>>{{ Str::upper($categoria->designacao) }}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.categoria_id'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.categoria_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="subCategoria1">1ª
                                        subcategoria</label>
                                    <select wire:model="produto.subCategoria1" data="subCategoria1"
                                            class="col-md-12 select2" id="subCategoria1"
                                            style="height:35px;<?= $errors->has('produto.subCategoria1') ? 'border-color: #ff9292;' : '' ?>">
                                        <option value="">Nenhum</option>

                                        @foreach($subCategorias1 as $subcategoria1)
                                            <option
                                                value="{{$subcategoria1->id}}" <?= $produto['subCategoria1'] == $subcategoria1->id ? 'selected' : '' ?>>{{ Str::upper($subcategoria1->designacao) }}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.subCategoria1'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.subCategoria1') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="subCategoria2">2ª
                                        subcategoria</label>
                                    <select wire:model="produto.subCategoria2" data="subCategoria2"
                                            class="col-md-12 select2" id="subCategoria2"
                                            style="height:35px;<?= $errors->has('produto.subCategoria2') ? 'border-color: #ff9292;' : '' ?>">
                                        <option value="">Nenhum</option>
                                        @foreach($subCategorias2 as $subcategoria2)
                                            <option
                                                value="{{$subcategoria2->id}}" <?= $produto['subCategoria2'] == $subcategoria2->id ? 'selected' : '' ?>>{{ Str::upper($subcategoria2->designacao) }}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.subCategoria2'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.subCategoria2') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2"
                                           for="unidade_medida_id">Unidade</label>
                                    <select wire:model="produto.unidade_medida_id" data="unidade_medida_id"
                                            class="col-md-12 select2" id="unidade_medida_id"
                                            style="height:35px;<?= $errors->has('produto.unidade_medida_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($unidadesMedida as $unidade)
                                            <option
                                                value="{{$unidade->id}}" <?= $produto['unidade_medida_id'] == $unidade->id ? 'selected' : '' ?>>{{Str::upper($unidade->designacao)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.unidade_medida_id'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.unidade_medida_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="quantidade_minima">Qtd.
                                        Mínima</label>
                                    <div class="input-group">
                                        <input type="number" wire:model="produto.quantidade_minima" class="form-control"
                                               id="quantidade_minima" autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.quantidade_minima') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.quantidade_minima'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.quantidade_minima') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="quantidade_critica">Qtd.
                                        Crítica</label>
                                    <div class="input-group">
                                        <input type="number" wire:model="produto.quantidade_critica"
                                               class="form-control" id="produto.quantidade_critica"
                                               style="height: 35px; font-size: 10pt;"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="stocavel">Controlar
                                        Stock</label>
                                    <select wire:model="produto.stocavel" data="stocavel" class="col-md-12 select2"
                                            id="stocavel"
                                            style="height:35px;<?= $errors->has('produto.stocavel') ? 'border-color: #ff9292;' : '' ?>">
                                        <option value="Sim" <?= $produto['stocavel'] == "Sim" ? 'selected' : '' ?>>Sim</option>
                                        <option value="Não" <?= $produto['stocavel'] == "Não" ? 'selected' : '' ?>>Não</option>
                                    </select>
                                    @if ($errors->has('produto.stocavel'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.stocavel') }}</strong>
                                    </span>
                                    @endif
                                </div>


                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">

                                <div class="col-md-3">
                                    <label class="control-label bold label-select2"
                                           for="fabricante_id">Fabricante</label>
                                    <select wire:model="produto.fabricante_id" data="fabricante_id"
                                            class="col-md-12 select2" id="fabricante_id"
                                            style="height:35px;<?= $errors->has('produto.fabricante_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($fabricantes as $fabricante)
                                            <option
                                                value="{{$fabricante->id}}" <?= $produto['fabricante_id'] == $fabricante->id ? 'selected' : '' ?>>{{Str::upper($fabricante->designacao)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.fabricante_id'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.fabricante_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2"
                                           for="codigo_taxa">Imposto(IVA)</label>
                                    <select wire:model="produto.codigo_taxa" data="codigo_taxa"
                                            class="col-md-12 select2" id="codigo_taxa"
                                            style="height:35px;<?= $errors->has('produto.codigo_taxa') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($taxasIva as $taxa)
                                            <option value="{{$taxa->codigo}}" <?= $produto['codigo_taxa'] == $taxa->codigo ? 'selected' : '' ?>>{{Str::upper($taxa->descricao)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.codigo_taxa'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.codigo_taxa') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="motivo_isencao_id">Motivo de
                                        Isenção</label>
                                    <select wire:model="produto.motivo_isencao_id" data="motivo_isencao_id"
                                            class="col-md-12 select2" id="motivo_isencao_id"
                                            style="height:35px;<?= $errors->has('produto.motivo_isencao_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($motivosIsencao as $motivo)
                                            <option value="{{$motivo->codigo}}" <?= $produto['motivo_isencao_id'] == $motivo->codigo ? 'selected' : '' ?>>{{$motivo->descricao}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.codigo_taxa'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.codigo_taxa') }}</strong>
                                    </span>
                                    @endif
                                </div>

                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="centroCustoId">Centros de
                                        custo</label>
                                    <select wire:model="produto.centroCustoId" data="centroCustoId" disabled
                                            class="col-md-12 select2"
                                            id="centroCustoId"
                                            style="height:35px;<?= $errors->has('produto.centroCustoId') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($centrosCusto as $centroCusto)
                                            <option value="{{$centroCusto->id}}" <?= $centroCusto->id == $produto['centroCustoId'] ? 'selected' : '' ?>>{{$centroCusto->nome}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.centroCustoId'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.centroCustoId') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            @if(auth()->user()->empresa->venda_online == 'Y')
                                <div class="form-group has-info bold" style="left: 0%; position: relative">
                                    <div class="col-md-6">
                                        <label class="control-label bold label-select2" for="venda_online">Deseja que o
                                            produto seja vendido no mutue vendas online?</label>
                                        <div style="margin-bottom: 15px;">
                                            <input type="checkbox" wire:model="produto.venda_online"
                                                   class="form-control" id="venda_online"
                                                   data-target="form_supply_price"
                                                   style="position: absolute;left: 5px; width:40px;cursor: pointer;"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">

                                        <label class="control-label bold label-select2" for="cartaGarantia">Deseja
                                            emitir carta de garantia para este produto?</label>
                                        <div style="margin-bottom: 15px;"class="row">
                                            <div class="col-md-2">
                                                <label class="control-label bold label-select2" for="cartaGarantia">Nenhuma</label>
                                                <input type="radio" wire:click="selecionarGarantia()" wire:model="produto.tempoGarantiaProduto" value="0"
                                                       class="form-control" id="cartaGarantia"
                                                       data-target="form_supply_price"
                                                       style="position: absolute;left: 5px; width:40px;cursor: pointer;"/>
                                            </div>
                                            <div class="col-md-2">
                                                <label class="control-label bold label-select2" for="cartaGarantia">7 dias</label>
                                                <input type="radio" wire:click="selecionarGarantia('dias')" wire:model="produto.tempoGarantiaProduto" value="7"
                                                       class="form-control" id="cartaGarantia"
                                                       data-target="form_supply_price"
                                                       style="position: absolute;left: 5px; width:40px;cursor: pointer;"/>
                                            </div>
                                            <div class="col-md-2">
                                                <label class="control-label bold label-select2" for="cartaGarantia">6 meses</label>
                                                <input type="radio" wire:click="selecionarGarantia('meses')" wire:model="produto.tempoGarantiaProduto" value="6"
                                                       class="form-control" id="cartaGarantia"
                                                       data-target="form_supply_price"
                                                       style="position: absolute;left: 5px; width:40px;cursor: pointer;"/>
                                            </div>
                                            <div class="col-md-2">
                                                <label class="control-label bold label-select2" for="cartaGarantia">1 ano</label>
                                                <input type="radio" wire:click="selecionarGarantia('ano')" wire:model="produto.tempoGarantiaProduto" value="1"
                                                       class="form-control" id="cartaGarantia"
                                                       data-target="form_supply_price"
                                                       style="position: absolute;left: 5px; width:40px;cursor: pointer;"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-6">
                                    @if(auth()->user()->empresa->venda_online == 'Y' && $produto['venda_online'])
                                        <label class="control-label bold label-select2" for="imagem_produto">Imagem
                                            principal(jpeg,png,jpg)<b class="red fa fa-question-circle"></b></label>
                                    @else
                                        <label class="control-label bold label-select2" for="imagem_produto">Imagem
                                            principal</label>
                                    @endif
                                    <div class="input-group">
                                        <input type="file" accept="application/image/*"
                                               wire:model="produto.imagem_produto" class="form-control"
                                               id="imagem_produto" autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.imagem_produto') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.imagem_produto'))
                                        <span class="help-block"
                                              style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.imagem_produto') }}</strong>
                                    </span>
                                    @endif
                                    <br>
                                    <div class="row">
                                        <div class="col-md-3" style="border: 1px solid #e0dcdc;border-radius: 5px;">
                                            @if(isset($produto['antImagemProduto']))
                                                <img style="height: 127px;"
                                                     src="<?= $URL. $produto['antImagemProduto'] ?>" alt="">
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="newImagens">Imagem
                                        adicionais(jpeg,png,jpg)</label>
                                    <div class="input-group">
                                        <input type="file" multiple accept="application/image/*"
                                               wire:model="produto.imagens" class="form-control" id="newImagens"
                                               autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('produto.imagens') ? 'border-color: #ff9292;' : '' ?>"/>
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info"
                                               data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    <br>
                                    <div class="row">
                                        @if(count($produto['AntProdutoImagens'])> 0)
                                            @foreach($produto['AntProdutoImagens'] as $imagem)
                                                <div class="col-md-3"
                                                     style="border: 1px solid #e0dcdc;border-radius: 5px; margin-right: 30px">
                                                    @if(isset($imagem['url']))
                                                        <img style="height: 127px;" src="<?= $URL.$imagem['url'] ?>" alt="">
                                                        <div wire:click="modalDelImagem({{json_encode($imagem)}})"
                                                             style="background-color: #D15B47;width: 25px;height: 25px; border-radius: 12px; display: flex;justify-content: center;align-items: center;position: absolute;top: -3px;cursor: pointer;left: 159px;">
                                                            X
                                                        </div>
                                                    @endif
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <a class="search-btn" type="submit" style="border-radius: 10px"
                                    wire:click.prevent="update">
                                <span wire:loading.remove wire:target="update">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    Salvar
                                </span>
                                <span wire:loading wire:target="update">
                                    <span class="loading"></span>
                                    Aguarde...</span>
                            </a>
                            &nbsp; &nbsp;
                            <a href="{{ route('produtos.index') }}" class="btn btn-danger" type="reset"
                               style="border-radius: 10px">
                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                Voltar
                            </a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
