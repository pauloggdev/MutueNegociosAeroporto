<?php

namespace App\Infra\Repository\Empresa;
use App\Models\empresa\Cliente as ClienteDatabase;

class ClienteRepository
{
    public function getClientes($search = null){
        return ClienteDatabase::where('empresa_id', auth()->user()->empresa_id??53)
            ->search(trim($search))
            ->get();
    }
    public function getClientesSemConsumidorFinal(){
        return ClienteDatabase::where('empresa_id', auth()->user()->empresa_id??53)
            ->where('diversos', 'Não')
            ->get();
    }

}
