<?php

namespace App\Http\Controllers\Api\Produtos;

use App\Repositories\Empresa\ProdutoRepository;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class ProdutoCreateController extends Controller
{
    private $produtoRepository;

    public function __construct(ProdutoRepository $produtoRepository)
    {
        $this->produtoRepository = $produtoRepository;
    }
    public function store(Request $request){

        $centroCustoId = isset($_GET['centroCustoId'])?$_GET['centroCustoId']:null;
        $message = [
            'designacao.required' => 'É obrigatório o nome',
            'categoria_id.required' => 'É obrigatório a categoria',
            'fabricante_id.required' => 'É obrigatório o fabricante',
            'preco_venda.required' => 'É obrigatório o preço de venda',
            'status_id.required' => 'É obrigatório o status',
            'stocavel.required' => 'É obrigatório o estocavel',
            'unidade_medida_id.required' => 'É obrigatório a unidade',
            'armazem_id.required' => 'É obrigatório o armazém',
            'codigo_taxa.required' => 'É obrigatório a taxa',

        ];

        $validator = Validator::make($request->all(), [
            'designacao' => ['required'],
            'categoria_id' => ['required'],
            'preco_venda' => ['required', function ($attr, $precoVenda, $fail) {
                if ($precoVenda < 0) {
                    $fail('O preço de venda não pode ser negativo');
                }
            }],
            'status_id' => ['required'],
            'codigo_taxa' => ['required'],
            'stocavel' => ['required'],
            'unidade_medida_id' => ['required'],
            'fabricante_id' => ['required'],
            'armazem_id' => ['required'],
            'imagem_produto' => 'max:1024'
        ], $message);

        if ($validator->fails()) {
            return response()->json($validator->errors()->messages(), 400);
        }
        $request['centroCustoId'] = $centroCustoId;
        return $this->produtoRepository->store($request);
    }
}
