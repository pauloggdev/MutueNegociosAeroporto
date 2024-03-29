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
                <span class="tooltip-target" data-toggle="tooltip" data-placement="top"><i class="fa fa-question-circle bold text-danger"></i></span>
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
                                    <label class="control-label bold label-select2" for="nomeCliente">Nome<b class="red fa fa-question-circle"></b></label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.designacao" class="form-control" id="nomeProduto" autofocus style="height: 35px; font-size: 10pt;<?= $errors->has('produto.designacao') ? 'border-color: #ff9292;' : '' ?>" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.designacao'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.designacao') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="codigoBarra">Código barra</label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.codigo_barra" disabled class="form-control" id="codigoBarra" style="height: 35px; font-size: 10pt;<?= $errors->has('produto.codigo_barra') ? 'border-color: #ff9292;' : '' ?>" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-barcode bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="categoria_id">Categoria</label>
                                    <select wire:model="produto.categoria_id" data="categoria_id"  class="col-md-12 select2" id="categoria_id" style="height:35px;<?= $errors->has('produto.categoria_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($categorias as $categoria)
                                        <option value="{{$categoria->id}}">{{ \Illuminate\Support\Str::upper($categoria->designacao) }}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.categoria_id'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.categoria_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="precoCompra">Preço de Compra</label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.preco_compra" class="form-control" id="precoCompra" autofocus style="height: 35px; font-size: 10pt;<?= $errors->has('produto.preco_compra') ? 'border-color: #ff9292;' : '' ?>" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.preco_compra'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.preco_compra') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="margemLucro">Margem de lucro(%)</label>
                                    <div class="input-group">
                                        <input type="number" wire:model="margemLucro" class="form-control" id="margemLucro" autofocus style="height: 35px; font-size: 10pt;" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="preco_venda">Preço de Venda<b class="red fa fa-question-circle"></b></label>
                                    <div class="input-group">
                                        <input type="text" wire:model="produto.preco_venda" class="form-control" id="preco_venda" autofocus style="height: 35px; font-size: 10pt;<?= $errors->has('produto.preco_venda') ? 'border-color: #ff9292;' : '' ?>" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.preco_venda'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.preco_venda') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="status_id">Status</label>
                                    <select wire:model="produto.status_id" data="status_id" class="col-md-12 select2" id="status_id" style="height:35px;<?= $errors->has('produto.status_id') ? 'border-color: #ff9292;' : '' ?>">
                                        <option value="1">Activo</option>
                                        <option value="2">Inativo</option>
                                    </select>
                                    @if ($errors->has('produto.status_id'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.status_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="quantidade_minima">Qtd. Mínima</label>
                                    <div class="input-group">
                                        <input type="number" wire:model="produto.quantidade_minima" class="form-control" id="quantidade_minima" autofocus style="height: 35px; font-size: 10pt;<?= $errors->has('produto.quantidade_minima') ? 'border-color: #ff9292;' : '' ?>" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.quantidade_minima'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.quantidade_minima') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="quantidade_critica">Qtd. Crítica</label>
                                    <div class="input-group">
                                        <input type="number" wire:model="produto.quantidade_critica" class="form-control" id="produto.quantidade_critica" style="height: 35px; font-size: 10pt;" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="stocavel">Controlar Stock</label>
                                    <select wire:model="produto.stocavel" data="stocavel" class="col-md-12 select2" id="stocavel" style="height:35px;<?= $errors->has('produto.stocavel') ? 'border-color: #ff9292;' : '' ?>">
                                        <option value="Sim">Sim</option>
                                        <option value="Não">Não</option>
                                    </select>
                                    @if ($errors->has('produto.stocavel'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.stocavel') }}</strong>
                                    </span>
                                    @endif
                                </div>


                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="armazem_id">Armazém</label>
                                    <select wire:model="produto.armazem_id" data="armazem_id" class="col-md-12 select2" id="armazem_id" style="height:35px;<?= $errors->has('produto.armazem_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($armazens as $armazem)
                                        <option value="{{$armazem->id}}">{{\Illuminate\Support\Str::upper($armazem->designacao)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.armazem_id'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.armazem_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-1">
                                    <label class="control-label bold label-select2" for="unidade_medida_id">Unidade</label>
                                    <select wire:model="produto.unidade_medida_id" data="medida_id" class="col-md-12 select" id="unidade_medida_id" style="height:35px;<?= $errors->has('produto.unidade_medida_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($unidades as $unidade)
                                        <option value="{{$unidade->id}}">{{\Illuminate\Support\Str::upper($unidade->designacao)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.unidade_medida_id'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.unidade_medida_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label bold label-select2" for="fabricante_id">Fabricante</label>
                                    <select wire:model="produto.fabricante_id" data="fabricante_id" class="col-md-12 select2" id="fabricante_id" style="height:35px;<?= $errors->has('produto.fabricante_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($fabricantes as $fabricante)
                                        <option value="{{$fabricante->id}}">{{\Illuminate\Support\Str::upper($fabricante->designacao)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.fabricante_id'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.fabricante_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label bold label-select2" for="codigo_taxa">Imposto/Taxas</label>
                                    <select wire:model="produto.codigo_taxa" data="codigo_taxa" class="col-md-12 select2" id="codigo_taxa" style="height:35px;<?= $errors->has('produto.codigo_taxa') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($taxas as $taxa)
                                        <option value="{{$taxa->codigo}}">{{\Illuminate\Support\Str::upper($taxa->descricao)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.codigo_taxa'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.codigo_taxa') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label bold label-select2" for="motivo_isencao_id">Motivo de Isenção</label>
                                    <select wire:model="produto.motivo_isencao_id" data="motivo_isencao_id" class="col-md-12 select2" id="motivo_isencao_id" style="height:35px;<?= $errors->has('produto.motivo_isencao_id') ? 'border-color: #ff9292;' : '' ?>">
                                        @foreach($motivos as $motivo)
                                        <option value="{{$motivo->codigo}}">{{$motivo->descricao}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('produto.codigo_taxa'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.codigo_taxa') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            @if(auth()->user()->empresa->venda_online == 'Y')
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-12">
                                    <label class="control-label bold label-select2" for="venda_online">Deseja que o produto seja vendido no mutue vendas online?</label>
                                    <div style="margin-bottom: 15px;">
                                        <input type="checkbox" wire:model="produto.venda_online" class="form-control" id="venda_online" data-target="form_supply_price" style="position: absolute;left: 5px; width:40px;cursor: pointer;" />
                                    </div>
                                </div>
                            </div>
                            @endif
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-6">
                                    @if(auth()->user()->empresa->venda_online == 'Y' && $produto['venda_online'])
                                        <label class="control-label bold label-select2" for="imagem_produto">Imagem
                                            principal<b class="red fa fa-question-circle"></b></label>
                                    @else
                                        <label class="control-label bold label-select2" for="imagem_produto">Imagem
                                            principal</label>
                                    @endif
                                    <div class="input-group">
                                        <input type="file" accept="application/image/*" wire:model="produto.imagem_produto" class="form-control" id="imagem_produto" autofocus style="height: 35px; font-size: 10pt;<?= $errors->has('produto.imagem_produto') ? 'border-color: #ff9292;' : '' ?>" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    @if ($errors->has('produto.imagem_produto'))
                                    <span class="help-block" style="color: red; font-weight: bold;position:absolute;">
                                        <strong>{{ $errors->first('produto.imagem_produto') }}</strong>
                                    </span>
                                    @endif
                                    <br>
                                    <div class="row">
                                        <div class="col-md-3" style="border: 1px solid #e0dcdc;border-radius: 5px;">
                                            <img style="height: 127px;" src="<?= $produto['imagem_produto'] ?>" alt="">
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="newImagens">Imagem adicionais</label>
                                    <div class="input-group">
                                        <input type="file" multiple accept="application/image/*" wire:model="produto.newImagens" class="form-control" id="newImagens" autofocus style="height: 35px; font-size: 10pt;<?= $errors->has('produto.imagens') ? 'border-color: #ff9292;' : '' ?>" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                    <br>
                                    <div class="row">
                                        @if(count($produto['produto_imagens'])> 0)
                                        @foreach($produto['produto_imagens'] as $imagem)
                                        <div class="col-md-3" style="border: 1px solid #e0dcdc;border-radius: 5px; margin-right: 30px">
                                            <img style="height: 127px;" src="<?= $imagem['url'] ?>" alt="">
                                            <div wire:click="modalDelImagem({{json_encode($imagem)}})" style="background-color: #D15B47;width: 25px;height: 25px; border-radius: 12px; display: flex;justify-content: center;align-items: center;position: absolute;top: -3px;cursor: pointer;left: 159px;">X</div>
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
                            <button class="search-btn" type="submit" style="border-radius: 10px" wire:click.prevent="update">
                                <span wire:loading.remove wire:target="update">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    Salvar
                                </span>
                                <span wire:loading wire:target="update">
                                    <span class="loading"></span>
                                    Aguarde...</span>
                            </button>
                            &nbsp; &nbsp;
                            <a href="{{ route('produtos.index') }}" class="btn btn-danger" type="reset" style="border-radius: 10px">
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
