@section('title', 'Facturas')
<div>
    <div class="row">
        <div class="page-header" style="left: 0.5%; position: relative">
            <h1>
                FACTURAS - AEROPORTUÁRIOS
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    Listagem
                </small>
            </h1>
        </div>
        <div class="col-md-12">
            <div class>
                <form class="form-search" method="get" action>
                    <div class="row">
                        <div class>
                            <div class="input-group input-group-sm" style="margin-bottom: 10px">
                                <span class="input-group-addon">
                                    <i class="ace-icon fa fa-search"></i>
                                </span>
                                <input type="text" wire:model="filter.search" autofocus autocomplete="on"
                                    class="form-control search-query"
                                    placeholder="Buscar pela numeração da factura, nome do cliente" />
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary btn-lg upload">
                                        <span class="ace-icon fa fa-search icon-on-right bigger-130"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class>
                <div class="row">
                    <form id="adimitirCandidatos" method="POST" action>
                        <input type="hidden" name="_token" value />

                        <div class="col-xs-12 widget-box widget-color-green" style="left: 0%">
                            <div class="clearfix" style="display: flex;padding: 5px 5px; align-items: center">

                                <div class="input-group input-group-sm" style="margin-left: 10px; width: 300px" >
                                    <select wire:model="filter.tipoDocumentoId" data="tipoDocumentoId" class="col-md-12 select2">
                                        <option value="">Filtrar tipo documento</option>
                                        <option value="1">FATURA RECIBO</option>
                                        <option value="2">FATURA</option>
                                        <option value="3">FATURA PROFORMA</option>
                                    </select>
                                </div>
                                <div class="input-group input-group-sm" style="margin-left: 10px; width: 300px" >
                                    <input type="date" wire:model="filter.dataInicial" class="col-md-12" style="line-height: 22px"/>
                                </div>
                                <div class="input-group input-group-sm" style="margin-left: 10px; width: 300px" >
                                    <input type="date" wire:model="filter.dataFinal" class="col-md-12" style="line-height: 22px"/>
                                </div>
                                <div class="input-group input-group-sm" style="margin-left: 10px; width: 300px" >
                                    <select wire:model="filter.centroCustoId" data="centroCustoId" class="col-md-12 select2">
                                        <option value="">Filtrar pelo centro de custo</option>
                                        @foreach($centrosCusto as $centroCusto)
                                            <option value="{{ $centroCusto->id }}">{{ Str::title($centroCusto->nome) }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="input-group input-group-sm" style="margin-left: 10px; width: 300px" >
                                    <select wire:model="filter.orderBy" data="orderBy" class="col-md-12 select2">
                                        <option value="ASC" <?= $filter['orderBy'] == 'ASC'?'selected':null?>>ASC</option>
                                        <option value="DESC" <?= $filter['orderBy'] == 'DESC'?'selected':null?>>DESC</option>
                                    </select>
                                </div>
                            </div>
                            <div class="table-header widget-header">
                                Todas as facturas do sistema
                            </div>
                            <div>
                                <table class="tabela1 table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Numeração</th>
                                            <th style="text-align: center">Tipo de aeronave</th>
                                            <th style="text-align: center">PMD(Ton)</th>
                                            <th style="text-align: center">Data de Aterragem</th>
                                            <th style="text-align: center">Data de Descolagem</th>
                                            <th style="text-align: center">Hora de Aterragem</th>
                                            <th style="text-align: center">Hora de Descolagem</th>
                                            <th>Emitido</th>
                                            <th>Cliente</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($facturas as $key=>$factura)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $factura['numeracaoFactura'] }}</td>
                                                <td style="text-align: center">{{ $factura['tipoDeAeronave'] }}</td>
                                                <td style="text-align: center">{{ $factura['pesoMaximoDescolagem'] }}</td>
                                                <td style="text-align: center">{{ $factura['dataDeAterragem'] }}</td>
                                                <td style="text-align: center">{{ $factura['dataDeDescolagem'] }}</td>
                                                <td style="text-align: center">{{ $factura['horaDeAterragem'] }}</td>
                                                <td style="text-align: center">{{ $factura['horaDeDescolagem'] }}</td>
                                                <td>{{ date_format($factura['created_at'], 'd/m/Y') }}</td>
                                                <td>{{ $factura['nome_do_cliente'] }}</td>
                                                <td>
                                                    <a class="blue"
                                                        wire:click="imprimirFactura({{ $factura['id'] }})"
                                                        title="Reimprimir o factura" style="cursor: pointer">
                                                        <i class="ace-icon fa fa-print bigger-160"></i>
                                                        <span wire:loading
                                                            wire:target="imprimirFactura({{ $factura['id'] }})"
                                                            class="loading">
                                                            <i class="ace-icon fa fa-print bigger-160"></i>
                                                        </span>
                                                    </a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </form>
                    {{ $facturas->links() }}
                </div>

            </div>
        </div>
    </div>

</div>
