@section('title','Anular facturas')
<div class="row">
    <div class="space-6"></div>
    <div class="page-header" style="left: 0.5%; position: relative">
        <h1>
            ANULAR FACTURAS
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
                                <div class="col-md-12">
                                    <label class="control-label bold label-select2" for="cliente">Buscar factura<b class="red fa fa-question-circle"></b></label>
                                    <div class="input-group input-group-sm" style="margin-bottom: 10px;">
                                        <span class="input-group-addon">
                                            <i class="ace-icon fa fa-search"></i>
                                        </span>
                                        <input type="text" onkeyup="this.value = this.value.toUpperCase();" wire:model="facturaSearch" autocomplete="on" autofocus class="form-control search-query" placeholder="Buscar factura pela numeração" style="<?= $errors->has('facturaSearch') ? 'border-color: #ff9292;' : '' ?>" />
                                        <span class="input-group-btn">
                                            <button type="submit" class="btn btn-primary btn-lg upload">
                                                <span class="ace-icon fa fa-search icon-on-right bigger-130"></span>
                                            </button>
                                        </span>
                                    </div>

                                    @if ($errors->has('facturaSearch'))
                                    <span class="help-block" style="color: red; font-weight: bold">
                                        <strong>{{ $errors->first('facturaSearch') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="nomeCliente">Nome do cliente<b class="red fa fa-question-"></b></label>
                                    <div class="input-group">
                                        <input type="text" value="<?= $factura['nome_do_cliente'] ?? '' ?>" disabled class="form-control" style="height: 35px; font-size: 10pt" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="nif">NIF<b class="red fa fa-question-"></b></label>
                                    <div class="input-group">
                                        <input type="text" value="<?= $factura['nif_cliente'] ?? '' ?>" disabled name="factura.nif_cliente" class="form-control" id="nif" data-target="form_supply_price" style="height: 35px; font-size: 10pt" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="contaCorrente">Conta corrente<b class="red fa fa-question-"></b></label>
                                    <div class="input-group">
                                        <input type="text" value="<?= $factura['conta_corrente_cliente'] ?? '' ?>" disabled name="factura.cliente_conta_corrente" class="form-control" id="contaCorrente" data-target="form_supply_price" style="height: 35px; font-size: 10pt" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="saldoCiente">Saldo actual</label>
                                    <div class="input-group">
                                        <input type="text" value="<?= $saldoCliente ?? '0,00' ?>" disabled class="form-control" id="saldoCiente" data-target="form_supply_price" style="height: 35px; font-size: 10pt" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="nomeCliente">Data factura<b class="red fa fa-question-"></b></label>
                                    <div class="input-group">
                                        @if($factura)
                                        <input type="text" value="<?= date_format($factura['created_at'], 'd/m/Y') ?>" disabled class="form-control" style="height: 35px; font-size: 10pt" />
                                        @else
                                        <input type="text" disabled class="form-control" style="height: 35px; font-size: 10pt" />
                                        @endif
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="totalFactura">Total factura<b class="red fa fa-question-"></b></label>
                                    <div class="input-group">
                                        <input type="text" value="<?= number_format($factura['total_preco_factura'] ?? 0, 2, ',', '.') ?? '' ?>" disabled name="recibo.cliente_conta_corrente" class="form-control" id="totalFactura" data-target="form_supply_price" style="height: 35px; font-size: 10pt" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="totalPagar">Total Pago /Total a Pagar<b class="red fa fa-question-"></b></label>
                                    <div class="input-group">
                                        <input type="text" value="<?= number_format($factura['valor_a_pagar'] ?? 0, 2, ',', '.') ?? '' ?>" disabled name="factura.cliente_conta_corrente" class="form-control" id="totalPagar" data-target="form_supply_price" style="height: 35px; font-size: 10pt" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label bold label-select2" for="saldoAtual">Troco</label>
                                    <div class="input-group">
                                        <input type="text" value="<?= number_format($factura['troco'] ?? 0, 2, ',', '.') ?? '' ?>" disabled name="recibo.cliente_saldo" class="form-control" id="saldoAtual" data-target="form_supply_price" style="height: 35px; font-size: 10pt" />
                                        <span class="input-group-addon" id="basic-addon1">
                                            <i class="ace-icon fa fa-info bigger-150 text-info" data-target="form_supply_price_smartprice"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-12">
                                    <label class="control-label bold label-select2" for="saldoAtual">Deseja voltar o produto no estoque?</label>
                                    <div style="margin-bottom: 15px;">
                                        <input type="checkbox" wire:model="retornarStock" class="form-control" id="saldoAtual" data-target="form_supply_price" style="    position: absolute;
    left: 5px; width:40px;cursor: pointer;" />
                                    </div>

                                </div>
                            </div>

                            <div class="form-group has-info bold" style="left: 0%; position: relative">
                                <div class="col-md-12">
                                    <label class="control-label bold label-select2" for="saldoAtual">Observação</label>
                                    <div class="input-group">
                                        <textarea wire:model="notaCredito.descricao" id="" cols="200" rows="2" class="form-control" style="font-size: 16px; z-index: 1;<?= $errors->has('notaCredito.descricao') ? 'border-color: #ff9292;' : '' ?>"></textarea>
                                    </div>
                                    @if ($errors->has('notaCredito.descricao'))
                                    <span class="help-block" style="color: red; font-weight: bold">
                                        <strong>{{ $errors->first('notaCredito.descricao') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="search-btn" type="submit" style="border-radius: 10px" wire:click.prevent="emitirNotaCreditoAnularFactura">
                                <span wire:loading.remove wire:target="emitirNotaCreditoAnularFactura">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    Salvar
                                </span>
                                <span wire:loading wire:target="emitirNotaCreditoAnularFactura">
                                <span class="loading"></span>
                                Aguarde...</span>
                            </button>


                            &nbsp; &nbsp;
                            <a href="{{ route('notaCreditoAnulacaoDoc.index') }}" class="btn btn-danger" type="reset" style="border-radius: 10px">
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
