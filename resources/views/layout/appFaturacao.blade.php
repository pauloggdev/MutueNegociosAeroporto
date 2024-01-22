<?php

use App\Models\admin\Empresa;
use App\Models\empresa\Empresa_Cliente;
use Illuminate\Support\Facades\Auth;

if (Auth::guard('web')->check()) {
    $referencia = Empresa::where('user_id', Auth::user()->id)->first()->referencia;
    $empresa = Empresa_Cliente::where('referencia', $referencia)->first();
} else {
    $empresa_id = Auth::user()->empresa_id;
    $empresa = Empresa_Cliente::where('id', $empresa_id)->first();
}

?>


    <!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>@yield('title')</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- Estilos VUE.JS-->
    <meta name="csrf-token" content="{{ csrf_token() }}"/>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>

    {{-- FAVICON  --}}
    <link rel="shortcut icon" sizes="57x57" href="{{asset('favicon/apple-icon-57x57.png')}}">
    <link rel="shortcut icon" sizes="60x60" href="{{asset('favicon/apple-icon-60x60.png')}}">
    <link rel="shortcut icon" sizes="72x72" href="{{asset('favicon/apple-icon-72x72.png')}}">
    <link rel="shortcut icon" sizes="76x76" href="{{asset('favicon/apple-icon-76x76.png')}}">
    <link rel="shortcut icon" sizes="114x114" href="{{asset('favicon/apple-icon-114x114.png')}}">
    <link rel="shortcut icon" sizes="120x120" href="{{asset('favicon/apple-icon-120x120.png')}}">
    <link rel="shortcut icon" sizes="144x144" href="{{asset('favicon/apple-icon-144x144.png')}}">
    <link rel="shortcut icon" sizes="152x152" href="{{asset('favicon/apple-icon-152x152.png')}}">
    <link rel="shortcut icon" sizes="180x180" href="{{asset('favicon/apple-icon-180x180.png')}}">
    <link rel="icon" type="image/png" sizes="192x192" href="{{asset('favicon/android-icon-192x192.png')}}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{asset('favicon/favicon-32x32.png')}}">
    <link rel="icon" type="image/png" sizes="96x96" href="{{asset('favicon/favicon-96x96.png')}}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{asset('favicon/favicon-16x16.png')}}">
    <link rel="manifest" href="{{asset('favicon/manifest.json')}}">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="{{asset('favicon/ms-icon-144x144.png')}}">
    <meta name="theme-color" content="#ffffff">
    {{-- FIM FAVICON  --}}

    <link rel="stylesheet" href="{{ asset('css/app.css')}}">

    @yield('css_dashboard')

    <!-- bootstrap & fontawesome sem uso-->
    @yield('css_fontawesome')
    <!--  FIM -->

    <!-- ========================================================================================= -->
    <!-- text fonts sem uso-->
    @yield('css_fonts')
    <!-- --- fim -- -->
    <!-- ========================================================================================= -->

    <!-- Estilos Gerais das pÃ¡ginas -->
    <link rel="stylesheet" href="{{asset('assets/css/ace.min.css')}}" class="ace-main-stylesheet" id="main-ace-style"/>
    <link rel="stylesheet" href="{{asset('assets/css/ace-skins.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('assets/css/ace-rtl.min.css')}}"/>
    <!-- ========================================================================================= -->

    <!-- Css para combobox com caixa de pesquisa, data e hora range, input do tipo number dinÃ¢mico e etc... sem uso-->
    @yield('css_combobox_pesquisa_data_hora')
    <!-- --- fim -- -->

    <!-- Css para collapse-->
    <link rel="stylesheet" href="{{ asset('assets/css/jquery-ui.min.css')}}"/>

    <!-- Css para Galerias de Imagem de Fundo de qualquer registo -->
    @yield('css_colorbox')

    <!-- ========================================================================================= -->

    <!-- ESTILOS CSS DE OUTROS TEMPLATES-->
    <!-- CSS do template Anzenta, para os contornos de alguns formulÃ¡rios-->
    <link rel="stylesheet" href="{{ asset('assets/plugin/css/font-awesome.min.css')}}" type="text/css">
    <link rel="stylesheet" href="{{ asset('assets/plugin/css/style.css')}}" type="text/css">
    <link rel="stylesheet" href="{{ asset('assets/css/select2.min.css')}}" />

    <!-- ========================================================================================= -->

    <!-- Style de faturação-->
    <style>
        .popUp {
            top: -28px;
            left: 0px;
            /* width: 100%; */
            width: 140px;
            /* height: 50px; */
            background: #307ecc;
            color: white;
            border-radius: 5px;
            position: unset;
        }

        .tooltip:hover .tooltiptext {
            visibility: visible;
        }

        .produtoItem:hover {
            background: #bcd4e0;
        }

        .popUp p {
            font-size: 12px;
            margin: 0;
            padding-left: 5px;
        }

        .FormatoImpressao label {
            font-weight: 600;
            font-size: 14px;
            display: flex;
            align-items: center;
            cursor: pointer;
            /* margin-left: -19px; */
            background: #ccc;
            padding: -3px;
            border-radius: 6px;
            padding-right: 11px;
            padding-left: 11px;
            margin-right: 10px;
            color: #333;
        }

        .FormatoImpressao input {
            height: 25px;
        }

        #quantProdutoCarrinho {
            position: absolute;
            font-size: 15px;
            color: white;
            font-weight: 600;
        }

        #btnFechoCaixa {
            margin-top: 10px;
        }

        #btnFechoCaixa a {
            padding: 10px;
            background: #2f8fce;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
        }

        ::-webkit-scrollbar {
            width: 5px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #103d54;
            border-radius: 10px;
        }

        #content-facturacao {
            margin-top: 20px;
        }

        #content-facturacao {
        }

        .alert {
            padding: 8px;
            font-size: 11px;
        }

        .nav-tabs.tab-color-blue > li > a {
            background-color: #307ecc;
        }

        .nav-tabs.tab-color-blue > li.active > a,
        .nav-tabs.tab-color-blue > li.active > a:focus,
        .nav-tabs.tab-color-blue > li.active > a:hover {
            background-color: white;
            color: #333;
        }

        #info-total {
            display: flex;
            flex-direction: column;
            border: 1px solid #ccbfbf;
            background: #0c1b25;
            color: white;
            padding: 10px;
            border-radius: 5px 5px 0px 0;
        }

        .total-item {
            padding: 2px;
            border-bottom: 1px solid #504848;
            display: flex;
            justify-content: space-between;
        }

        .total-item span {
            color: #fff;
        }

        .checkbox label input[type="checkbox"].ace + .lbl {
            margin-left: -19px;
            background: #ccc;
            padding: 10px;
            border-radius: 5px;
            color: #333;
        }

        .radio label input[type="radio"].ace + .lbl {
            margin-left: -19px;

            background: #ccc;
            padding: 4px;
            border-radius: 5px;
            color: #333;
        }

        .tipoFacturar {
            display: flex;
        }

        .inputFormPag {
            margin-bottom: 10px;
        }
        .textFormPag{
            font-size: 20px !important;
            height: 40px !important;
        }

        input {
            height: 35px;
            border-radius: 5px !important;
        }

        .alert-info {
            background: #103d54;
            color: white;
            height: 73px;
        }

        .widget-color-dark > .widget-header {
            background: #333;
        }

        .content-produto {
            border-bottom: 1px solid #e2dbdb;
            padding-bottom: 10px !important;
            padding-top: 10px !important;
        }

        .produto-item:hover {
            cursor: pointer;
        }

        .produto-info {
            height: 85px;
            color: white;
        }

        .grid-facturacao {
            border: 1px solid #e8e8e8;
            height: 100%;
        }

        #content-facturacao {
            height: 688px;
        }

        .search-query {
            border: 1px solid #6fb3e0;
            border-radius: 4px !important;
            padding-left: 24px;
        }

        .search-query:focus {
            border: 1px solid #6fb3e0;
        }

        span.input-form-icon {
            position: relative;
        }

        span.input-form-icon .ace-icon {
            padding: 0 3px;
            z-index: 2;
            position: absolute;
            top: 1px;
            bottom: 1px;
            left: 3px;
            line-height: 30px;
            display: inline-block;
            color: #6fb3e0 !important;
            font-size: 16px;
        }

        #icon-remove {
            left: 236px;
            cursor: pointer;
        }

        table tr,
        th {
            height: 20px;
            font-size: 13px;
            font-family: unset;
            cursor: pointer;
        }

        #semProduto {
            display: flex;
            justify-content: center;
            text-align: center;
            padding-top: 15px;
            border: 1px solid #ccc;
            padding-bottom: 20px;
        }

        #semProduto .text {
            font-size: 13px;
            font-weight: 500;
            /* letter-spacing: 0.2rem; */
        }

        .semProdutoDescription {
            display: flex;
            flex-direction: column;
        }

        #btn-modal-edit-facturacao button {
            margin-top: 20px;
        }

        .modal-header#modalEditFactura {
            background-color: #307ecc;
            color: white;
        }

        .modal-header#modalEditFactura h3.smaller {
            color: white !important;
        }

        .search-form-text #valorPgt {
            display: inline-block;
            font-size: 20px;
            color: #fff;
            text-transform: uppercase;
            background: #333;
            padding: 13px 30px;
            font-weight: 700;
        }

        #headerTitle {
            display: flex;
            justify-content: space-between;
        }

        .scroller {
            width: 100%;
            height: 457px;
            overflow-y: scroll;
            scrollbar-color: rebeccapurple green;
        }

        abbr {
            position: relative;
        }

        abbr:hover::after {
            background: #add8e6;
            border-radius: 4px;
            bottom: 100%;
            content: attr(title);
            display: block;
            left: 100%;
            padding: 1em;
            position: absolute;
            width: 140px;
            z-index: 99999999;
        }
    </style>
    @livewireStyles
</head>

<!-- #0D47A1 !important, #174284 !important  #242424 -->

<body class="skin-1" id="body">
<iframe id="iframe_impressao" src="" style="display:none"></iframe>



<div class="main-container ace-save-state" id="main-container">




            <div class="page-content">
                <div class="content-wrapper">
                    <div id="app">
                    @if(isset($slot))
                       {{$slot}}
                    @else
                    @yield('content')
                    @endif
                    </div>
                </div>

            </div><!-- /.page-content -->

    <div class="footer">
        <div class="footer-inner">
            <div class="footer-content">
                    <span class="bigger-120">
                        <a href="#" class="text-primary">&copy; <?php echo date('Y') ?><span class="bolder" style=""> Mutue negócios. Todos os direitos reservados</span></a>
                    </span>
                &nbsp; &nbsp;
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<script type="text/javascript">
    window.Laravel = {!!json_encode(['user'=>Auth::user()?Auth::user():null,'roles'=>Auth::user()->roles, 'isSuperAdmin' => (Auth::user()->hasRole('Super-Admin') || Auth::user()->hasRole('Admin')),'isFuncionario'=>Auth::user()->hasRole('Funcionario')])!!};
</script>


<!-- Script VUE.JS-->
<script src="{{asset('js/app.js')}}"></script>


<!-- Script do qual dependem todas as funcionalidades do template, como toda a funcionalidade dos menus e o estilo de vÃ¡rios inputs -->
<!-- script principal-->
<script src="{{asset('assets/js/jquery-1.11.3.min.js')}}"></script>
<script src="{{asset('assets/js/bootstrap.min.js')}}"></script>
<script src="{{asset('assets/js/ace-elements.min.js')}}"></script>
<script src="{{asset('assets/js/ace.min.js')}}"></script>


<!-- COLLAPSE BOOTSTRAP -->
<script src="{{ asset('assets/js/jquery-ui.min.js')}}"></script>

<!-- ==================================================================================== -->

<!-- SCRIPT PARA FORMULÃRIOS DE REGISTO, COM TODOS ELEMENTOS NECESSÃRIOS-->
<!-- Scripts diferentes tipos de inputs adicionais para o formulÃ¡rio-->
@yield('js_input_formulario')
<!-- --- FIM -- -->


<!-- script de alterar foto template-->
<script src="{{ asset('assets/js/jquery.maskedinput.min.js')}}"></script>
<script src="{{ asset('assets/js/chosen.jquery.min.js')}}"></script>
<script src="{{ asset('assets/js/bootstrap-timepicker.min.js')}}"></script>
<script src="{{ asset('assets/js/moment.min.js')}}"></script>
<script src="{{ asset('assets/js/daterangepicker.min.js')}}"></script>
<script src="{{ asset('assets/js/bootstrap-datetimepicker.min.js')}}"></script>
<script src="{{ asset('assets/js/bootstrap-colorpicker.min.js')}}"></script>
<script src="{{ asset('assets/js/jquery.knob.min.js')}}"></script>
<script src="{{ asset('assets/js/autosize.min.js')}}"></script>
<script src="{{ asset('assets/js/jquery.inputlimiter.min.js')}}"></script>
<!-- ---- FIM --- -->

<!--Scripts para validaÃ§Ã£o em tempo real do formulÃ¡rio -->
<script src="{{ asset('assets/js/jquery.validate.min.js')}}"></script>
<!-- ========================================================================================= -->


<!-- Script para tabelas Simples & DinÃ¢mica(Para listagem dos dados) -->
@yield('js_tabela_simples_dinamico')
<script src="{{ asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{ asset('assets/js/jquery.dataTables.bootstrap.min.js')}}"></script>
<script src="{{ asset('assets/js/dataTables.buttons.min.js')}}"></script>
<script src="{{ asset('assets/js/select2.min.js')}}"></script>


@yield('js_email_notificacao')

<!-- Css para Galerias de Imagem de Fundo de qualquer registo -->
<script src="{{ asset('assets/js/jquery.colorbox.min.js')}}"></script>

<!-- Script para modelos de licenÃ§a -->
<script src="{{ asset('assets/js/holder.min.js')}}"></script>
<!--INICIO DO SCRIPT PARA MANDAR INFORMAÃ‡Ã•ES NO COMPONENT VUE-->
<script type="text/javascript">
    window.baseUrl = "{{config('app.url', 'http://localhost:8000')}}";
    window.Laravel = {
        json_encode(['csrfToken' => csrf_token(),
                        'roles' => Auth::user()->roles,
                        'user' => [
                'authenticated' => auth()->check(),
                'id' => auth()->check() ? auth()-> user()-> id : null,
                'nome' => auth()->check() ? auth()->user()->name : null,
                'email' => auth()->check() ? auth()->user()->email : null,
            ],
                        'user' =>Auth::user(),
                    ]);
    };
</script>
<!--FIM DO SCRIPT PARA MANDAR INFORMAÃ‡Ã•ES NO COMPONENT VUE-->

<!-- Scripts para grÃ¡ficos estatisticos do dashboard -->
@yield('js_dashboard')



<!-- Script para abrir pÃ¡ginas laterais para facturaÃ§Ã£o -->
@yield('js_modal_facturacao')
<!--Fim do Script para abrir pÃ¡ginas laterais para facturaÃ§Ã£o -->

<!-- Script para solicitaÃ§Ã£o de factura e compra de licenÃ§a -->
@yield('js_solicitacao_factura_licenca')

<!--Fim do Script para solicitaÃ§Ã£o de factura e compra de licenÃ§a -->

<!--INICIO DO SCRIPT PARA GALERIA DE IMAGENS-->
@yield('js_galeria_imagem')
<!-- ---fim-- -->


<!-- WIZARD & VALIDAÃ‡Ã•ES sem uso -->
@yield('js_validacao')
<!-- / fim WIZARD & VALIDAÃ‡Ã•ES -->

<!--ESCONDER E TORNAR VÃSIVEL sem uso -->
@yield('js_esconder_tornar_visivel')
<!--ESCONDER E TORNAR VÃSIVEL) -->


<!-- SCRIPT PARA UPLOAD DE IMAGEM DROP E OUTROS INPUTS DE FORMULÃRIOS-->
<script>
    $(document).ready(function () {
        $('.select2').select2(); // Inicializa o Select2 em todos os elementos com classe "select2
        $(document.body).on("change", ".select2", function (e) {
            const data = {
                'atributo': e.target.getAttribute('data'),
                'valor': e.target.value
            }
            livewire.emit('selectedItem', data)
        });
        window.livewire.on('select2', () => {
            $('.select2').select2(); // Inicializa o Select2 em todos os elementos com classe "select2"

        });
    });
</script>
<script type="text/javascript">
    jQuery(function ($) {
        $('#id-disable-check').on('click', function () {
            var inp = $('#form-input-readonly').get(0);
            if (inp.hasAttribute('disabled')) {
                inp.setAttribute('readonly', 'true');
                inp.removeAttribute('disabled');
                inp.value = "This text field is readonly!";
            } else {
                inp.setAttribute('disabled', 'disabled');
                inp.removeAttribute('readonly');
                inp.value = "This text field is disabled!";
            }
        });


        if (!ace.vars['touch']) {
            $('.chosen-select').chosen({
                allow_single_deselect: true
            });
            //resize the chosen on window resize

            $(window)
                .off('resize.chosen')
                .on('resize.chosen', function () {
                    $('.chosen-select').each(function () {
                        var $this = $(this);
                        $this.next().css({
                            'width': $this.parent().width()
                        });
                    })
                }).trigger('resize.chosen');
            //resize chosen on sidebar collapse/expand
            $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                if (event_name != 'sidebar_collapsed') return;
                $('.chosen-select').each(function () {
                    var $this = $(this);
                    $this.next().css({
                        'width': $this.parent().width()
                    });
                })
            });


            $('#chosen-multiple-style .btn').on('click', function (e) {
                var target = $(this).find('input[type=radio]');
                var which = parseInt(target.val());
                if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
                else $('#form-field-select-4').removeClass('tag-input-style');
            });
        }


        $('[data-rel=tooltip]').tooltip({
            container: 'body'
        });
        $('[data-rel=popover]').popover({
            container: 'body'
        });

        autosize($('textarea[class*=autosize]'));

        $('textarea.limited').inputlimiter({
            remText: '%n character%s remaining...',
            limitText: 'max allowed : %n.'
        });

        $.mask.definitions['~'] = '[+-]';
        $('.input-mask-date').mask('99/99/9999');
        $('.input-mask-phone').mask('999999999');
        $('.input-mask-eyescript').mask('~9.99 ~9.99 999');
        $(".input-mask-product").mask("a*-999-a999", {
            placeholder: " ",
            completed: function () {
                alert("You typed the following: " + this.val());
            }
        });


        $("#input-size-slider").css('width', '200px').slider({
            value: 1,
            range: "min",
            min: 1,
            max: 8,
            step: 1,
            slide: function (event, ui) {
                var sizing = ['', 'input-sm', 'input-lg', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
                var val = parseInt(ui.value);
                $('#form-field-4').attr('class', sizing[val]).attr('placeholder', '.' + sizing[val]);
            }
        });

        $("#input-span-slider").slider({
            value: 1,
            range: "min",
            min: 1,
            max: 12,
            step: 1,
            slide: function (event, ui) {
                var val = parseInt(ui.value);
                $('#form-field-5').attr('class', 'col-xs-' + val).val('.col-xs-' + val);
            }
        });

        //"jQuery UI Slider"
        //range slider tooltip example
        $("#slider-range").css('height', '200px').slider({
            orientation: "vertical",
            range: true,
            min: 0,
            max: 100,
            values: [17, 67],
            slide: function (event, ui) {
                var val = ui.values[$(ui.handle).index() - 1] + "";

                if (!ui.handle.firstChild) {
                    $("<div class='tooltip right in' style='display:none;left:16px;top:-6px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
                        .prependTo(ui.handle);
                }
                $(ui.handle.firstChild).show().children().eq(1).text(val);
            }
        }).find('span.ui-slider-handle').on('blur', function () {
            $(this.firstChild).hide();
        });


        $("#slider-range-max").slider({
            range: "max",
            min: 1,
            max: 10,
            value: 2
        });

        $("#slider-eq > span").css({
            width: '90%',
            'float': 'left',
            margin: '15px'
        }).each(function () {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                animate: true

            });
        });

        $("#slider-eq > span.ui-slider-purple").slider('disable'); //disable third item


        $('#id-input-file-1 , #id-input-file-2').ace_file_input({
            no_file: 'Nenhum ficheiro ...',
            btn_choose: 'Escolher',
            btn_change: 'Mudar',
            droppable: false,
            onchange: null,
            thumbnail: false //| true | large
        });


        $('#id-input-file-3').ace_file_input({
            style: 'well',
            btn_choose: 'Carregue seu arquivo aqui ou Clique para escolher',
            btn_change: null,
            no_icon: 'ace-icon fa fa-cloud-upload',
            droppable: true,
            thumbnail: 'large' //small | large | fit
            ,
            preview_error: function (filename, error_code) {
            }

        }).on('change', function () {
        });

        //dynamically change allowed formats by changing allowExt && allowMime function
        $('#id-file-format').removeAttr('checked').on('change', function () {
            var whitelist_ext, whitelist_mime;
            var btn_choose
            var no_icon
            if (this.checked) {
                btn_choose = "Carregue sua imagem aqui ou Clique para escolher";
                no_icon = "ace-icon fa fa-picture-o";

                whitelist_ext = ["jpeg", "jpg", "png", "gif", "bmp"];
                whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
            } else {
                btn_choose = "Carregue seu arquivo aqui ou Clique para escolher";
                no_icon = "ace-icon fa fa-cloud-upload";

                whitelist_ext = null; //all extensions are acceptable
                whitelist_mime = null; //all mimes are acceptable
            }
            var file_input = $('#id-input-file-3');
            file_input
                .ace_file_input('update_settings', {
                    'btn_choose': btn_choose,
                    'no_icon': no_icon,
                    'allowExt': whitelist_ext,
                    'allowMime': whitelist_mime
                })
            file_input.ace_file_input('reset_input');

            file_input
                .off('file.error.ace')
                .on('file.error.ace', function (e, info) {
                });
        });


        //======================================= id-input-file-3 ===================================================================
        $('#id-input-file-4').ace_file_input({
            style: 'well',
            btn_choose: 'Carregue seu arquivo aqui ou Clique para escolher',
            btn_change: null,
            no_icon: 'ace-icon fa fa-cloud-upload',
            droppable: true,
            thumbnail: 'large' //small | large | fit
            ,
            preview_error: function (filename, error_code) {
            }

        }).on('change', function () {
        });

        //dynamically change allowed formats by changing allowExt && allowMime function
        $('#id-file-format').removeAttr('checked').on('change', function () {
            var whitelist_ext, whitelist_mime;
            var btn_choose
            var no_icon
            if (this.checked) {
                btn_choose = "Carregue sua imagem aqui ou Clique para escolher";
                no_icon = "ace-icon fa fa-picture-o";

                whitelist_ext = ["jpeg", "jpg", "png", "gif", "bmp"];
                whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
            } else {
                btn_choose = "Carregue seu arquivo aqui ou Clique para escolher";
                no_icon = "ace-icon fa fa-cloud-upload";

                whitelist_ext = null; //all extensions are acceptable
                whitelist_mime = null; //all mimes are acceptable
            }
            var file_input = $('#id-input-file-4');
            file_input
                .ace_file_input('update_settings', {
                    'btn_choose': btn_choose,
                    'no_icon': no_icon,
                    'allowExt': whitelist_ext,
                    'allowMime': whitelist_mime
                })
            file_input.ace_file_input('reset_input');

            file_input
                .off('file.error.ace')
                .on('file.error.ace', function (e, info) {
                });
        });
        //======================================= id-input-file-4 ===================================================================

        $('#spinner1').ace_spinner({
            value: 1,
            min: 1,
            max: 9999999999999999999999999999999999999999999999999999,
            step: 1,
            btn_up_class: 'btn-info',
            btn_down_class: 'btn-info'
        })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {
                //console.log($('#spinner1').val())
            });
        $('#spinner2').ace_spinner({
            value: 1,
            min: 1,
            max: 9999999999999999999999999999999999999999999999999999,
            step: 1,
            touch_spinner: true,
            icon_up: 'ace-icon fa fa-caret-up bigger-120',
            icon_down: 'ace-icon fa fa-caret-down bigger-120'
        });
        $('#spinner3').ace_spinner({
            value: 1,
            min: 1,
            max: 9999999999999999999999999999999999999999999999999999,
            step: 1,
            on_sides: true,
            icon_up: 'ace-icon fa fa-plus bigger-110',
            icon_down: 'ace-icon fa fa-minus bigger-110',
            btn_up_class: 'btn-success',
            btn_down_class: 'btn-danger'
        });
        $('#spinner4').ace_spinner({
            value: 1,
            min: 1,
            max: 9999999999999999999999999999999999999999999999999999,
            step: 1,
            on_sides: true,
            icon_up: 'ace-icon fa fa-plus',
            icon_down: 'ace-icon fa fa-minus',
            btn_up_class: 'btn-purple',
            btn_down_class: 'btn-purple'
        });

        //datepicker plugin
        //link
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
            //show datepicker when clicking on the icon
            .next().on(ace.click_event, function () {
            $(this).prev().focus();
        });

        //or change it into a date range picker
        $('.input-daterange').datepicker({
            autoclose: true
        });


        //to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
        $('input[name=date-range-picker]').daterangepicker({
            'applyClass': 'btn-sm btn-success',
            'cancelClass': 'btn-sm btn-default',
            locale: {
                applyLabel: 'Apply',
                cancelLabel: 'Cancel',
            }
        })
            .prev().on(ace.click_event, function () {
            $(this).next().focus();
        });


        $('#timepicker1').timepicker({
            minuteStep: 1,
            showSeconds: true,
            showMeridian: false,
            disableFocus: true,
            icons: {
                up: 'fa fa-chevron-up',
                down: 'fa fa-chevron-down'
            }
        }).on('focus', function () {
            $('#timepicker1').timepicker('showWidget');
        }).next().on(ace.click_event, function () {
            $(this).prev().focus();
        });


        if (!ace.vars['old_ie']) $('#date-timepicker1').datetimepicker({
            //format: 'MM/DD/YYYY h:mm:ss A',//use this option to display seconds
            icons: {
                time: 'fa fa-clock-o',
                date: 'fa fa-calendar',
                up: 'fa fa-chevron-up',
                down: 'fa fa-chevron-down',
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-arrows ',
                clear: 'fa fa-trash',
                close: 'fa fa-times'
            }
        }).next().on(ace.click_event, function () {
            $(this).prev().focus();
        });


        $('#colorpicker1').colorpicker();
        //$('.colorpicker').last().css('z-index', 2000);//if colorpicker is inside a modal, its z-index should be higher than modal'safe

        $('#simple-colorpicker-1').ace_colorpicker();

        $(".knob").knob();


        var tag_input = $('#form-field-tags');
        try {
            tag_input.tag({
                placeholder: tag_input.attr('placeholder'),
                //enable typeahead by specifying the source array
                source: ace.vars['US_STATES'], //defined in ace.js >> ace.enable_search_ahead
            })

            //programmatically add/remove a tag
            var $tag_obj = $('#form-field-tags').data('tag');
            $tag_obj.add('Programmatically Added');

            var index = $tag_obj.inValues('some tag');
            $tag_obj.remove(index);
        } catch (e) {
            //display a textarea for old IE, because it doesn't support this plugin or another one I tried!
            tag_input.after('<textarea id="' + tag_input.attr('id') + '" name="' + tag_input.attr('name') + '" rows="3">' + tag_input.val() + '</textarea>').remove();
            //autosize($('#form-field-tags'));
        }

        /////////
        $('#modal-form input[type=file]').ace_file_input({
            style: 'well',
            btn_choose: 'Carregue seu arquivo aqui ou Clique para escolher',
            btn_change: null,
            no_icon: 'ace-icon fa fa-cloud-upload',
            droppable: true,
            thumbnail: 'large'
        })

        //chosen plugin inside a modal will have a zero width because the select element is originally hidden
        //and its width cannot be determined.
        //so we set the width after modal is show
        $('#modal-form').on('shown.bs.modal', function () {
            if (!ace.vars['touch']) {
                $(this).find('.chosen-container').each(function () {
                    $(this).find('a:first-child').css('width', '210px');
                    $(this).find('.chosen-drop').css('width', '210px');
                    $(this).find('.chosen-search input').css('width', '200px');
                });
            }
        })

        $(document).one('ajaxloadstart.page', function (e) {
            autosize.destroy('textarea[class*=autosize]')

            $('.limiterBox,.autosizejs').remove();
            $('.daterangepicker.dropdown-menu,.colorpicker.dropdown-menu,.bootstrap-datetimepicker-widget.dropdown-menu').remove();
        });
    });
</script>

<!-- FIM DO SCRIPT PARA UPLOAD DE IMAGEM DROP E OUTROS INPUTS DE FORMULÃRIOS-->

<!-- INICO DO SCRIPT PARA TABELA DE LISTAGEM DE DADOS, SIMPLES & DINÃ‚MICO-->

<script type="text/javascript">
    $(document).ready(function () {
        $('.tabela1').dataTable({
            "lengthMenu": [
                [15, 20, 30, 50, 100, -1],
                [15, 20, 30, 50, 100, "Todos"]
            ],
            "language": {
                "emptyTable": "Sem dados disponÃ­veis na tabela",
                "info": "<span class='text-primary' style='font-size: 12pt; left: 8%;'>Mostrar de _START_ a _END_ Registos(_TOTAL_ no total)</span>",
                "infoEmpty": "Mostrar de 0 a 0 registos",
                "infoFiltered": "(Filtrada de _MAX_  registos)",
                "lengthMenu": "<span class='text-primary' style='font-size:13pt; position: absolute; left: 1%;'>Mostrar _MENU_ </span>",
                "search": "<span class='text-primary' style='font-size: 13pt; float: left; left:-25%; position: relative;'>Pesquisar</span>",
                "zeroRecords": "<span style='color: red'>Nenhum registo correspondente encontrado</span>",
                "paginate": {
                    "first": "Primeiro",
                    "last": "Ãšltimo",
                    "previous": "Anterior",
                    "next": "Proximo",
                }
            }
        });
    });

    jQuery(function ($) {
        //initiate dataTables plugin
        var myTable = $('#dynamic-table')
            //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
            .DataTable({
                bAutoWidth: false,
                "aoColumns": [{
                    "bSortable": false
                },
                    null, null, null, null, null,
                    {
                        "bSortable": false
                    }
                ],
                "aaSorting": [],

                select: {
                    style: 'multi'
                }
            });

        $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

        new $.fn.dataTable.Buttons(myTable, {
            buttons: [{
                "extend": "colvis",
                "text": "<i class='fa fa-search bigger-110 text-primary'></i> <span class='hidden'>Mostrar/Ocultar Colunas</span>",
                "className": "btn btn-white btn-primary btn-bold",
                columns: ':not(:first):not(:last)'
            },
                {
                    "extend": "copy",
                    "text": "<i class='fa fa-copy bigger-110 text-pink'></i> <span class='hidden'>Copiar para uma tabela</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                },
                {
                    "extend": "csv",
                    "text": "<i class='fa fa-database bigger-110 text-orange' style='color: orange'></i> <span class='hidden'>Exportar para CSV</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                },
                {
                    "extend": "excel",
                    "text": "<i class='fa fa-file-excel-o bigger-110 text-success' style='color: green'></i> <span class='hidden'>Exportar para Excel</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                },
                {
                    "extend": "pdf",
                    "text": "<i class='fa fa-file-pdf-o bigger-110 text-danger' style='color: red'></i> <span class='hidden'>Exportar para PDF</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                },
                {
                    "extend": "print",
                    "text": "<i class='fa fa-print bigger-110 text-default'></i> <span class='hidden'>Imprimir toda Tabela</span>",
                    "className": "btn btn-white btn-primary btn-bold",
                    autoPrint: false,
                    message: 'This print was produced using the Print button for DataTables'
                }
            ]
        });
        myTable.buttons().container().appendTo($('.tableTools-container'));

        //style the message box
        var defaultCopyAction = myTable.button(1).action();
        myTable.button(1).action(function (e, dt, button, config) {
            defaultCopyAction(e, dt, button, config);
            $('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
        });

        var defaultColvisAction = myTable.button(0).action();
        myTable.button(0).action(function (e, dt, button, config) {

            defaultColvisAction(e, dt, button, config);

            if ($('.dt-button-collection > .dropdown-menu').length == 0) {
                $('.dt-button-collection')
                    .wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
                    .find('a').attr('href', '#').wrap("<li />")
            }
            $('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
        });

        ////

        setTimeout(function () {
            $($('.tableTools-container')).find('a.dt-button').each(function () {
                var div = $(this).find(' > div').first();
                if (div.length == 1) div.tooltip({
                    container: 'body',
                    title: div.parent().text()
                });
                else $(this).tooltip({
                    container: 'body',
                    title: $(this).text()
                });
            });
        }, 500);


        //                    myTable.on( 'select', function ( e, dt, type, index ) {
        //                        if ( type === 'row' ) {
        //                            $( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
        //                        }
        //                    } );
        //                    myTable.on( 'deselect', function ( e, dt, type, index ) {
        //                        if ( type === 'row' ) {
        //                            //COMENTEI PROPOSITADAMENTE
        //                            $( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
        //                            $( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
        //                        }
        //                    } );

        /////////////////////////////////
        //table checkboxes
        $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);

        //select/deselect all rows according to table header checkbox
        $('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function () {
            var th_checked = this.checked; //checkbox inside "TH" table header


            $('#dynamic-table').find('tbody > tr').each(function () {


                var row = this;
                if (th_checked) myTable.row(row).select();
                else myTable.row(row).deselect();
            });
        });

        //select/deselect a row when the checkbox is checked/unchecked
        $('#dynamic-table').on('click', 'td input[type=checkbox]', function () {


            var row = $(this).closest('tr').get(0);
            if (this.checked) myTable.row(row).deselect();
            else myTable.row(row).select();
        });

        $(document).on('click', '#dynamic-table .dropdown-toggle', function (e) {
            e.stopImmediatePropagation();
            e.stopPropagation();
            e.preventDefault();
        });

        //And for the first simple table, which doesn't have TableTools or dataTables
        //select/deselect all rows according to table header checkbox
        var active_class = 'active';
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
            var th_checked = this.checked; //checkbox inside "TH" table header

            $(this).closest('table').find('tbody > tr').each(function () {
                var row = this;
                if (th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            });
        });
        //select/deselect a row when the checkbox is checked/unchecked
        $('#simple-table').on('click', 'td input[type=checkbox]', function () {
            var $row = $(this).closest('tr');
            if ($row.is('.detail-row ')) return;
            if (this.checked) $row.addClass(active_class);
            else $row.removeClass(active_class);
        });

        /********************************/
        //add tooltip for small view action buttons in dropdown menu
        $('[data-rel="tooltip"]').tooltip({
            placement: tooltip_placement
        });

        //tooltip placement on right or left
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            //var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }

        /***************/
        $('.show-details-btn').on('click', function (e) {
            e.preventDefault();
            $(this).closest('tr').next().toggleClass('open');
            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
        });
        /***************/
    })
</script><!-- FIM DO SCRIPT PARA TABELA DE LISTAGEM DE DADOS, SIMPLES & DINÃ‚MICO-->

<style type="text/css">
    #body {
        padding-right: 0px !important;
    }

    #btn-assina {
        left: 0%;
        border-radius: 15px;
        margin-left: 10px;
        margin-top: 0.1%;
        padding: 3px;
        position: relative;
    }

    .assinatura {
        padding: 0px;
        margin-bottom: 0px !important;
    }

    #botoes {
        left: 0%;
        border-radius: 15px;
        margin-top: 0.1%;
        padding: 6px 12px 6px 12px;
        position: relative;
        text-transform: uppercase
    }

    /* .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 35px;
        }
        .select2-container .select2-selection--single {
            height: 35px;
        } */

    .form-control {
        display: block;
        width: 100%;
        height: calc(2.25rem + 2px);
        /* padding: .375rem .75rem; */
        font-size: 1rem;
        line-height: 1.5;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: .25rem;
    }

    .select2-container .select2-selection--single {
        height: 35px !important;
        padding: 4px !important;
    }

    .select2-container {
        width: 100% !important;

    }

    .select2-container--default .select2-selection--single .select2-selection__rendered {
        color: #444 !important;
    }

    .form-group.has-info input,
    .form-group.has-info select,
    .form-group.has-info textarea {
        color: #444 !important;
    }

    .vdpComponent.vdpWithInput#data_pago_banco > input {
        padding: 6px !important;
        width: 353px !important;
    }

    .error {
        color: red;
    }


    .modal-header#logomarca-header {
        padding: 15px;
        border-bottom: 1px solid #a72d2d;
        background-color: #b32932;
        color: white;
    }

    .btn-success#logomarca-butom,
    .btn-success#logomarca-butom.focus,
    .btn-success#logomarca-butom:focus {
        background-color: #47a447 !important;
        border-color: #47a447;
        padding: 0px 44px 0px 44px;
    }
</style>




<script>
    window.addEventListener('printPdf', event => {
        var data = base64ToArrayBuffer(event.detail.data);
        var file = new Blob([data], {
            type: "application/pdf",
        });
        var fileURL = URL.createObjectURL(file);
        window.open(fileURL);
    })

    function base64ToArrayBuffer(base64) {
        var binary_string = window.atob(base64);
        var len = binary_string.length;
        var bytes = new Uint8Array(len);
        for (var i = 0; i < scriptlen; i++) {
            bytes[i] = binary_string.charCodeAt(i);
        }
        return bytes.buffer;
    }

    window.addEventListener('printLink', event => {
        var data = event.detail.data;
        window.open(data, '_blank');
    })


    window.addEventListener('closeModal', event => {
        $('.closeModal').modal('hide');
    })
    </script>
@livewireScripts
<script src="{{asset('js/sweetalert.js')}}"></script>
<x-livewire-alert::scripts/>
</body>
</html>
