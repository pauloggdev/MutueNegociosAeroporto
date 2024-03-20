@section('title','Faturas anuladas')
<div class="row">
    <div class="page-header" style="left: 0.5%; position: relative">
        <h1>
            FATURAS ANULADAS
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                Listagem
            </small>
        </h1>
    </div>
    <div class="col-md-12">
        <div class>
            <div class="row">
                <form id="adimitirCandidatos" method="POST" action>
                    <input type="hidden" name="_token" value/>

                    <div class="col-xs-12 widget-box widget-color-green" style="left: 0%">
                        <div class="clearfix">
                            <a href="/empresa/anulacao/fatura/novo" title="emitir novo recibo"
                               class="btn btn-success widget-box widget-color-blue" id="botoes">
                                <i class="fa icofont-plus-circle"></i> ANULAR FATURAS
                            </a>

                            <div class="pull-right tableTools-container"></div>
                        </div>
                        <div class="table-header widget-header">
                            Todas faturas anuladas do sistema (Total:{{ count($facturas) }})
                        </div>
                        <div>
                            <table class="tabela1 table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nº Documento</th>
                                    <th>Factura referente</th>
                                    <th>Nome do cliente</th>
                                    <th>Propretário/Companhia Aérea</th>
                                    <th>Operador</th>
                                    <th style="text-align: right">Valor Iliquido</th>
                                    <th style="text-align: right">Valor Imposto</th>
                                    <th style="text-align: right">Contra Valor</th>
                                    <th>Emitido</th>
                                    <th style="text-align: center">Ações</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($facturas as $key=>$ft)
                                    <tr>
                                        <td>{{ ++$key }}</td>
                                        <td>{{ $ft['numDoc'] }}</td>
                                        <td>{{ $ft['factura']['numeracaoFactura'] }}</td>
                                        <td>{{ $ft['factura']['nome_do_cliente'] }}</td>
                                        <td>{{ $ft['factura']['nomeProprietario'] }}</td>
                                        <td>{{ $ft['user']['name'] }}</td>
                                        <td style="text-align: right">{{ number_format($ft['factura']['valorIliquido'], 2, ',', '.') }}</td>
                                        <td style="text-align: right">{{ number_format($ft['factura']['valorImposto'], 2, ',', '.') }}</td>
                                        <td style="text-align: right">{{ number_format($ft['factura']['contraValor'], 2, ',', '.') }}</td>
                                        <td>{{date_format($ft->created_at,'d/m/Y')}}</td>
                                        <td style="text-align: center">
                                            <a class="blue" wire:click="printNotaCredito({{$ft->id}})"
                                               title="Reimprimir nota credito" style="cursor: pointer">
                                                <i class="ace-icon fa fa-print bigger-160"></i>
                                                <span wire:loading wire:target="printNotaCredito({{$ft->id}})"
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
            </div>

        </div>

    </div>
</div>
