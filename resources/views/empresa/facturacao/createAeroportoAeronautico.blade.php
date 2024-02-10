@php use Illuminate\Support\Str; @endphp
@section('title','Emissão de faturas')
<div class="row">
    <div id="main-container">
        <div class="main-content">
            <div class="main-content-inner">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="space-6"></div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="widget-box transparent">
                                    <div class="widget-header widget-header-large">
                                        <div class="widget-toolbar no-border invoice-info">
                                            <span class="invoice-info-label">Data:</span>
                                            <span class="blue">{{ date('d/m/Y') }}</span>
                                        </div>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main padding-24">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="row">
                                                        <div
                                                            class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
                                                            <b>DADOS DA EMPRESA</b>
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <ul class="list-unstyled spaced">
                                                            <li>
                                                                <h4>{{ $empresa->nome }}</h4>
                                                            </li>

                                                            <li>
                                                                <i class="ace-icon fa fa-caret-right blue"></i>
                                                                <strong>NIF: </strong>{{ $empresa->nif }}
                                                            </li>

                                                            <li>
                                                                <i class="ace-icon fa fa-caret-right blue"></i>
                                                                <strong>Endereço: </strong>{{ $empresa->endereco }}
                                                            </li>

                                                            <li>
                                                                <i class="ace-icon fa fa-caret-right blue"></i>
                                                                <strong>Telefone: </strong>{{ $empresa->pessoal_Contacto }}
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div><!-- /.col -->

                                                <div class="col-sm-6">
                                                    <div class="row">
                                                        <div
                                                            class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                                            <b>DADOS DO CLIENTE</b>
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <ul class="list-unstyled  spaced">
                                                            <li>
                                                                <i class="ace-icon fa fa-caret-right green"></i>Street,
                                                                City
                                                            </li>

                                                            <li>
                                                                <i class="ace-icon fa fa-caret-right green"></i>Zip
                                                                Code
                                                            </li>

                                                            <li>
                                                                <i class="ace-icon fa fa-caret-right green"></i>State,
                                                                Country
                                                            </li>

                                                            <li class="divider"></li>

                                                            <li>
                                                                <i class="ace-icon fa fa-caret-right green"></i>
                                                                Contact Info
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.row -->

                                            <div class="space"></div>


                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                        </div>

                                                        <div class="widget-body">
                                                            <div class="widget-main" style="margin-bottom: 10px">
                                                                <form class="form-inline">
                                                                    <div class="form-group"
                                                                         style="margin-right: 15px">
                                                                        <label>Tipo de Aeronave</label>
                                                                        <div>
                                                                            <input type="text"
                                                                                   wire:model="fatura.tipoDeAeronave"
                                                                                   style="width: 150px;<?= $errors->has('fatura.cartaDePorte') ? 'border-color: #ff9292;' : '' ?>"
                                                                                   class="input-small"
                                                                                   placeholder="BOING 737-800"/>
                                                                            @if ($errors->has('fatura.tipoDeAeronave'))
                                                                                <span class="help-block"
                                                                                      style="color: red; font-weight: bold">
                                                                                    <strong>{{ $errors->first('fatura.tipoDeAeronave') }}</strong>
                                                                                </span>
                                                                            @endif
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group"
                                                                         style="margin-right: 15px">
                                                                        <label>PMD (Ton)</label>
                                                                        <div>
                                                                            <input type="text"
                                                                                   wire:model="fatura.pesoMaximoDescolagem"
                                                                                   class="input-small"
                                                                                   style="width: 150px; <?= $errors->has('fatura.pesoMaximoDescolagem') ? 'border-color: #ff9292;' : '' ?>"
                                                                                   placeholder="PMD"/>
                                                                            @if ($errors->has('fatura.pesoMaximoDescolagem'))
                                                                                <span class="help-block"
                                                                                      style="color: red; font-weight: bold">
                                                                                    <strong>{{ $errors->first('fatura.pesoMaximoDescolagem') }}</strong>
                                                                                </span>
                                                                            @endif
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group"
                                                                         style="margin-right: 15px">
                                                                        <label>Data de Aterragem</label>
                                                                        <div>
                                                                            <input type="date"
                                                                                   wire:model="fatura.dataDeAterragem"
                                                                                   class="input-small"
                                                                                   style="width: 150px; <?= $errors->has('fatura.dataEntrada') ? 'border-color: #ff9292;' : '' ?>"/>
                                                                            @if ($errors->has('fatura.dataDeAterragem'))
                                                                                <span class="help-block"
                                                                                      style="color: red; font-weight: bold">
                                                                                    <strong>{{ $errors->first('fatura.dataDeAterragem') }}</strong>
                                                                                </span>
                                                                            @endif
                                                                        </div>

                                                                    </div>
                                                                    <div class="form-group"
                                                                         style="margin-right: 15px">
                                                                        <label>Data de Descolagem</label>
                                                                        <div>
                                                                            <input type="date"
                                                                                   wire:model="fatura.dataDeDescolagem"
                                                                                   class="input-small"
                                                                                   style="width: 150px; <?= $errors->has('fatura.dataSaida') ? 'border-color: #ff9292;' : '' ?>"/>
                                                                            @if ($errors->has('fatura.dataDeDescolagem'))
                                                                                <span class="help-block"
                                                                                      style="color: red; font-weight: bold">
                                                                                    <strong>{{ $errors->first('fatura.dataDeDescolagem') }}</strong>
                                                                                </span>
                                                                            @endif
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Hora de Aterragem</label>
                                                                        <div>
                                                                            <input type="time"
                                                                                   wire:model="fatura.horaDeAterragem"
                                                                                   class="input-small"
                                                                                   style="width: 150px; <?= $errors->has('fatura.dataSaida') ? 'border-color: #ff9292;' : '' ?>"/>
                                                                            @if ($errors->has('fatura.horaDeAterragem'))
                                                                                <span class="help-block"
                                                                                      style="color: red; font-weight: bold">
                                                                                    <strong>{{ $errors->first('fatura.horaDeAterragem') }}</strong>
                                                                                </span>
                                                                            @endif
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Hora de Descolagem</label>
                                                                        <div>
                                                                            <input type="time"
                                                                                   wire:model="fatura.horaDeDescolagem"
                                                                                   class="input-small"
                                                                                   style="width: 150px; <?= $errors->has('fatura.horaDeDescolagem') ? 'border-color: #ff9292;' : '' ?>"/>
                                                                            @if ($errors->has('fatura.horaDeDescolagem'))
                                                                                <span class="help-block"
                                                                                      style="color: red; font-weight: bold">
                                                                                    <strong>{{ $errors->first('fatura.horaDeDescolagem') }}</strong>
                                                                                </span>
                                                                            @endif
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6"></div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div>

                                                        <table class="table table-striped table-bordered">
                                                            <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th style="width: 400px; text-align: left">
                                                                    Tarifas
                                                                </th>
                                                                <th style="text-align: center">Imposto</th>
                                                                <th style="text-align: right">Total</th>
                                                                <th style="text-align: center"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            @foreach($fatura['items'] as $key=> $faturaItem)
                                                                <tr>
                                                                    <td>{{++$key}}</td>
                                                                    <td style="width: 400px; text-align: left">{{ $faturaItem['nomeProduto'] }}</td>
                                                                    <td style="text-align: center">{{ $faturaItem['valorImposto'] }}</td>
                                                                    <td style="text-align: right">{{ number_format($faturaItem['total'],2,',','.') }}</td>
                                                                    <td style="text-align: center">
                                                                        <div
                                                                            class="hidden-sm hidden-xs btn-group">
                                                                            <button
                                                                                class="btn btn-xs btn-danger"
                                                                                wire:click.prevent="removeCart({{json_encode($faturaItem) }})">
                                                                                <i class="ace-icon fa fa-remove bigger-120"></i>
                                                                            </button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            @endforeach
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div>
                                                        <table class="table table-striped table-bordered">
                                                            <thead>
                                                            <tr>
                                                                <th>Tarifas</th>
                                                                <th></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                            <tr>
                                                                <td class="center">
                                                                    <select style="width: 100%"
                                                                            wire:model="item.produto" name="ship"
                                                                            rowid="6"
                                                                            size="1"
                                                                            class="editable inline-edit-cell ui-widget-content ui-corner-all">
                                                                        <option value="">Nenhum</option>
                                                                        @foreach($servicos as $servico)
                                                                            <option
                                                                                value="{{json_encode($servico->produto)}}">{{ Str::title($servico->produto->designacao) }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </td>
                                                                <td>
                                                                    <div class="hidden-sm hidden-xs btn-group">
                                                                        <button class="btn btn-xs btn-success"
                                                                                wire:click.prevent="addCart">
                                                                            <i class="ace-icon fa fa-plus bigger-120"></i>
                                                                        </button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hr hr8 hr-double hr-dotted"></div>

                                            <div class="row" style="margin-bottom: 5px">
                                                <div class="col-sm-5 pull-right">
                                                    <h8 class="pull-right">
                                                        VALOR ILIQUIDO(AOA) :
                                                        <span>{{ number_format($fatura['valorIliquido'], 2,',','.') }}Kz</span>
                                                    </h8>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-bottom: 5px">
                                                <div class="col-sm-5 pull-right">
                                                    <h8 class="pull-right">
                                                        IVA :
                                                        <span>{{ number_format($fatura['taxaIva'], 2,',','.') }}%</span>
                                                    </h8>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 5px">
                                                <div class="col-sm-5 pull-right">
                                                    <h8 class="pull-right">
                                                        VALOR DO IMPOSTO(AOA) :
                                                        <span>{{ number_format($fatura['valorImposto'], 1,',','.') }}Kz</span>
                                                    </h8>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 5px">
                                                <div class="col-sm-5 pull-right">
                                                    <h8 class="pull-right">
                                                        TOTAL(AOA) :
                                                        <span><strong>{{ number_format($fatura['total'], 2,',','.') }}Kz</strong></span>
                                                    </h8>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 5px">
                                                <div class="col-sm-5 pull-right">
                                                    <h8 class="pull-right">
                                                        TAXA DE CÂMBIO(AOA/USD) :
                                                        <span>{{ number_format($fatura['cambioDia'], 2,',','.') }}</span>
                                                    </h8>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-5 pull-right">
                                                    <h8 class="pull-right">
                                                        CONTRAVALOR(USD) :
                                                        <span><strong>${{ number_format($fatura['contraValor'], 2,',','.') }}</strong></span>
                                                    </h8>
                                                </div>
                                            </div>

                                            <div class="space-6"></div>
                                            <div class="well" style="display: flex;justify-content: space-between;">
                                                <div>
                                                    @foreach($bancos as $banco)
                                                        <span><strong>IBAN AOA:</strong> {{ $banco->iban }}</span><br>
                                                        <span><strong>IBAN USD:</strong> {{ $banco->iban }}</span><br>
                                                    @endforeach
                                                </div>
                                                <div>
                                                    <a href="#" class="btn btn-default btn-app radius-4 btn-primary "
                                                       wire:click.prevent="emitirDocumento"
                                                       wire:keydown.enter="preventEnter"
                                                    >
                                                        <span wire:loading wire:target="emitirDocumento"
                                                              class="loading"></span> Finalizar
                                                        <span wire:loading wire:target="emitirDocumento">
                                                            <span class="loading"></span>
                                                            Aguarde...
                                                        </span>

                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->


</div>
