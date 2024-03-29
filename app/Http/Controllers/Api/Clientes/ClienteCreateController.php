<?php

namespace App\Http\Controllers\Api\Clientes;

use App\Http\Controllers\Controller;
use App\Repositories\Empresa\ClienteRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class ClienteCreateController extends Controller
{
    private $clienteRepository;
    public function __construct(ClienteRepository $clienteRepository)
    {
        $this->clienteRepository = $clienteRepository;
    }
    public function store(Request $request)
    {
        $messages = [
            'nome.required' => 'Informe o nome',
            'telefone_cliente.required' => 'Informe o telefone',
            'endereco.required' => 'Informe o endereço',
            'cidade.required' => 'Informe a cidade',
            'tipo_cliente_id.required' => 'Informe o tipo cliente',
            'data_contrato.required' => 'Informe o tipo cliente',
        ];
        $validator = Validator::make($request->all(), [
            'nif' => ["required", function ($attr, $value, $fail) {
                $cliente =  DB::table('clientes')
                    ->where('empresa_id', auth()->user()->empresa_id)
                    ->where('nif', $value)
                    ->where('nif',"!=", '999999999')
                    ->first();

                if ($cliente) {
                    $fail("Cliente já cadastrado");
                }
            }],
            'nome' => ["required", function ($attr, $value, $fail) {
                $cliente =  DB::table('clientes')
                    ->where('empresa_id', auth()->user()->empresa_id)
                    ->where('nome', $value)
                    ->first();
                if ($cliente) {
                    $fail("Cliente já cadastrado");
                }
            }],
            'telefone_cliente' => "required",
            'endereco' => "required",
            'cidade' => "required",
            'tipo_cliente_id' => "required",
            'data_contrato' => "required",
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors()->messages(), 400);
        }
        return $this->clienteRepository->store($request);
    }
}
