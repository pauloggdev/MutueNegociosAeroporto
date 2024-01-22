<?php

namespace App\Http\Requests;


trait StoreUpdateClienteRequest
{


    public function rules()
    {
        return [
            'cliente.nome' => 'required',
            'cliente.email' => '',
            'cliente.website' => '',
            'cliente.numero_contrato' => '',
            'cliente.taxa_de_desconto' => '',
            'cliente.limite_de_credito' => '',
            'cliente.pais_id' => '',
            'cliente.tipo_cliente_id' => '',
            'cliente.telefone_cliente' =>  ['required', function ($attr, $telefone_cliente, $fail) {
                $unique = $this->unique2('clientes', 'telefone_cliente', $telefone_cliente, $this->clienteId);
                if($unique){
                    $fail("Cliente já cadastrado");
                }
            }],
            'cliente.endereco' => 'required',
            'cliente.cidade' => 'required',
            'cliente.data_contrato' => 'required',
            'cliente.nif' => ["required", function ($attr, $nif, $fail) {
                if ($this->clienteRepository->getClientePeloNif($this->cliente)) {
                    $fail('Cliente já cadastrado');
                }
            }],
            'cliente.tipo_cliente_id' => 'required',
            'cliente.pessoa_contacto' => 'required'
        ];
    }
    public function messages()
    {
        return [
            'cliente.nome.required' => 'Informe o nome do cliente',
            'cliente.telefone_cliente.required' => 'Informe o telefone',
            'cliente.endereco.required' => 'Informe o endereço',
            'cliente.cidade.required' => 'Informe a cidade',
            'cliente.dataContracto.required' => 'Informe a data de contrato',
            'cliente.nif.required' => 'Informe o nif',
            'cliente.tipo_cliente_id.required' => 'Informe o tipo cliente',
            'cliente.pessoa_contacto.required' => 'Informe a pessoa de contato',
        ];
    }
}
