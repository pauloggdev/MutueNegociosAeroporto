@php use Illuminate\Support\Str; @endphp
@section('title','Emissão de faturas')
<div class="row">
    <div id="main-container">
        <div class="main-content">
            <div class="main-content-inner">


                <div class="page-content">
                    <div class="ace-settings-container" id="ace-settings-container">
                        <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                            <i class="ace-icon fa fa-cog bigger-130"></i>
                        </div>

                        <div class="ace-settings-box clearfix" id="ace-settings-box">
                            <div class="pull-left width-50">
                                <div class="ace-settings-item">
                                    <div class="pull-left">
                                        <select id="skin-colorpicker" class="hide">
                                            <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                        </select>
                                    </div>
                                    <span>&nbsp; Choose Skin</span>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                           id="ace-settings-navbar" autocomplete="off"/>
                                    <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                           id="ace-settings-sidebar" autocomplete="off"/>
                                    <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                           id="ace-settings-breadcrumbs" autocomplete="off"/>
                                    <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"
                                           autocomplete="off"/>
                                    <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                           id="ace-settings-add-container" autocomplete="off"/>
                                    <label class="lbl" for="ace-settings-add-container">
                                        Inside
                                        <b>.container</b>
                                    </label>
                                </div>
                            </div><!-- /.pull-left -->

                            <div class="pull-left width-50">
                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"
                                           autocomplete="off"/>
                                    <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"
                                           autocomplete="off"/>
                                    <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"
                                           autocomplete="off"/>
                                    <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                                </div>
                            </div><!-- /.pull-left -->
                        </div><!-- /.ace-settings-box -->
                    </div><!-- /.ace-settings-container -->

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="space-6"></div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="widget-box transparent">
                                        <div class="widget-header widget-header-large">
                                            <h3 class="widget-title grey lighter">
                                                <i class="ace-icon fa fa-leaf green"></i>
                                                Customer Invoice
                                            </h3>

                                            <div class="widget-toolbar no-border invoice-info">
                                                <span class="invoice-info-label">Invoice:</span>
                                                <span class="red">#121212</span>

                                                <br/>
                                                <span class="invoice-info-label">Date:</span>
                                                <span class="blue">04/04/2014</span>
                                            </div>

                                            <div class="widget-toolbar hidden-480">
                                                <a href="#">
                                                    <i class="ace-icon fa fa-print"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main padding-24">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="row">
                                                            <div
                                                                class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
                                                                <b>Company Info</b>
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <ul class="list-unstyled spaced">
                                                                <li>
                                                                    <i class="ace-icon fa fa-caret-right blue"></i>Street,
                                                                    City
                                                                </li>

                                                                <li>
                                                                    <i class="ace-icon fa fa-caret-right blue"></i>Zip
                                                                    Code
                                                                </li>

                                                                <li>
                                                                    <i class="ace-icon fa fa-caret-right blue"></i>State,
                                                                    Country
                                                                </li>

                                                                <li>
                                                                    <i class="ace-icon fa fa-caret-right blue"></i>
                                                                    Phone:
                                                                    <b class="red">111-111-111</b>
                                                                </li>

                                                                <li class="divider"></li>

                                                                <li>
                                                                    <i class="ace-icon fa fa-caret-right blue"></i>
                                                                    Paymant Info
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div><!-- /.col -->

                                                    <div class="col-sm-6">
                                                        <div class="row">
                                                            <div
                                                                class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                                                <b>Customer Info</b>
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
                                                                <div class="widget-main">
                                                                    <form class="form-inline">
                                                                        <label>Carta de Porte(AWB)</label>
                                                                        <input type="text" style="width: 150px" class="input-small" placeholder="AWB" />
                                                                        <label>Peso(Kg)</label>
                                                                        <input type="text" class="input-small" placeholder="Peso" />
                                                                        <label>Data de Entrada</label>
                                                                        <input type="date" class="input-small" style="width: 150px"/>
                                                                        <label>Data de Saída</label>
                                                                        <input type="date" class="input-small" style="width: 150px"/>
                                                                        <label>Nº Dias</label>
                                                                        <input type="text" disabled class="input-small" style="width: 50px"/>
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
                                                                    <th style="width: 400px; text-align: center">
                                                                        Produto
                                                                    </th>
                                                                    <th style="text-align: center">Taxa</th>
                                                                    <th style="text-align: center">Descontos</th>
                                                                    <th style="text-align: center">Imposto</th>
                                                                    <th style="text-align: right">Total</th>
                                                                    <th style="text-align: center"></th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                    @foreach($fatura['items'] as $key=> $faturaItem)
                                                                        <tr>
                                                                            <td>{{++$key}}</td>
                                                                            <td class="center">{{ $faturaItem['nomeProduto'] }}</td>
                                                                            <td style="text-align: center">0.08</td>
                                                                            <td style="text-align: center">100%</td>
                                                                            <td style="text-align: center">T</td>
                                                                            <td style="text-align: right">14586,46</td>
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
                                                                    <th>Produto</th>
                                                                    <th style="width: 130px">Tipo/Mercadorias</th>
                                                                    <th>Sujeito a despacho aduaneiro</th>
                                                                    <th>Especificação da mercadoria</th>
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
                                                                    <td class="center">
                                                                        <select style="width: 100%"
                                                                                wire:model="item.tipoMercadoriaId"
                                                                                name="ship" rowid="6"
                                                                                size="1"
                                                                                class="editable inline-edit-cell ui-widget-content ui-corner-all">
                                                                            @foreach($tipoMercadorias as $mercadoria)
                                                                                <option
                                                                                    value="{{$mercadoria->id}}">{{ Str::title($mercadoria->designacao) }}</option>
                                                                            @endforeach
                                                                        </select>
                                                                    </td>
                                                                    <td class="center">
                                                                        <select style="width: 100%"
                                                                                wire:model="item.sujeitoDespachoId"
                                                                                name="ship" rowid="6"
                                                                                size="1"
                                                                                class="editable inline-edit-cell ui-widget-content ui-corner-all">
                                                                            <option role="option" value="1">Sim</option>
                                                                            <option role="option" value="2">Não</option>

                                                                        </select>
                                                                    </td>
                                                                    <td class="center">
                                                                        <select style="width: 100%"
                                                                                wire:model="item.especificacaoMercadoriaId"
                                                                                name="ship" rowid="6"
                                                                                size="1"
                                                                                class="editable inline-edit-cell ui-widget-content ui-corner-all">
                                                                            @foreach($especificaoMercadorias as $especificacao)
                                                                                <option
                                                                                    value="{{$especificacao->id}}">{{ Str::limit($especificacao->designacao, 40) }}</option>
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

                                                <div class="row">
                                                    <div class="col-sm-5 pull-right">
                                                        <h4 class="pull-right">
                                                            Total amount :
                                                            <span class="red">$395</span>
                                                        </h4>

                                                    </div>
                                                    <div class="col-sm-7 pull-left"> Extra Information</div>
                                                </div>

                                                <div class="space-6"></div>
                                                <div class="well">
                                                    Thank you for choosing Ace Company products.
                                                    We believe you will be satisfied by our services.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- PAGE CONTENT ENDS -->
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
