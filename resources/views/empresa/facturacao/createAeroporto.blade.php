@section('title','Emissão de faturas')
<div class="row">
    <div class="space-6"></div>
    <div class="page-header" style="left: 0.5%; position: relative">
        <h1>
            EMISSÃO DE FATURAS
        </h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <form class="filter-form form-horizontal validation-form" id="validation-form">
                <div class="second-row">
                    <div class="tabbable">
                        <div class="tab-content profile-edit-tab-content">
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="cliente">Cliente<b
                                            class="red fa fa-question-circle"></b></label>
                                    <select wire:model="fatura.clienteId" data="clienteId" class="col-md-12 select2"
                                            id="clienteId">
                                        @foreach($clientes as $cliente)
                                            <option value="{{ $cliente->id }}">{{ Str::upper($cliente->nome) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="paisOrigem">País de origem<b
                                            class="red fa fa-question-circle"></b></label>
                                    <select wire:model="fatura.paisOrigemId" data="paisOrigemId" class="col-md-12 select2"
                                            id="paisOrigemId">
                                        @foreach($paises as $pais)
                                            <option value="{{ $pais->id }}">{{ Str::upper($pais->designacao) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="tipo_documento">Tipo Documento</label>
                                    <select wire:model="fatura.tipo_documento" data="tipo_documento" class="col-md-12 select2"
                                            id="tipo_documento">
                                        @foreach($tiposDocumentos as $tipo)
                                            <option value="{{ $tipo->id }}">{{ Str::upper($tipo->designacao) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-6">
                                    <label class="control-label bold label-select2" for="produto">Serviço |
                                        Produto</label>
                                    <select wire:model="fatura.produtoId" data="produtoId" class="col-md-12 select2"
                                            id="clienteId">
                                        @foreach($produtos as $existencia)
                                            <option
                                                value="{{ $existencia->produto_id }}">{{ Str::upper($existencia->produto->designacao) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-1">
                                    <label class="control-label bold label-select2" for="nome">QTD</label>
                                    <div class="input-group">
                                        <input type="number" wire:model="centroCusto.endereco" class="form-control"
                                               id="endereco" autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('centroCusto.endereco') ? 'border-color: #ff9292;' : '' ?>"/>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label bold label-select2" for="nome">DESC(%)</label>
                                    <div class="input-group">
                                        <input type="number" wire:model="centroCusto.endereco" class="form-control"
                                               id="endereco" autofocus
                                               style="height: 35px; font-size: 10pt;<?= $errors->has('centroCusto.endereco') ? 'border-color: #ff9292;' : '' ?>"/>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="telefone">ADD<b
                                            class="red fa fa-question-circle"></b></label>
                                    <div class="input-group">
                                        <button class="search-btn" type="submit" style="border-radius: 10px; height: 35px !important;"
                                                wire:click.prevent="store">
                                <span wire:loading.remove wire:target="store">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    Adicionar
                                </span>
                                            <span wire:loading wire:target="store">
                                    <span class="loading"></span>
                                    Aguarde...</span>
                                        </button>
                                    </div>
                                    @if ($errors->has('centroCusto.telefone'))
                                        <span class="help-block" style="color: red; font-weight: bold">
                                        <strong>{{ $errors->first('centroCusto.telefone') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-12">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Serviço | Produto</th>
                                            <th>QTD</th>
                                            <th style="text-align:right">DESC(%)</th>
                                            <th style="text-align:right">Valor</th>
                                            <th style="text-align:right">Total</th>
                                            <th style="text-align:center">Ação</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="search-btn" type="submit" style="border-radius: 10px"
                                    wire:click.prevent="store">
                                <span wire:loading.remove wire:target="store">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    Finalizar
                                </span>
                                <span wire:loading wire:target="store">
                                    <span class="loading"></span>
                                    Aguarde...</span>
                            </button>
                            <a href="{{ route('centroCusto.index') }}" class="btn btn-danger" type="reset"
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
