<?php

namespace App\Infra\Repository\Empresa;
use App\Models\empresa\FormaPagamentoGeral as FormaPagamentoDatabase;

class FormasPagamentoRepository
{
    public function getFormasPagamentos(){
        return FormaPagamentoDatabase::get();
    }
    public function getFormasPagamentosSemDuplo(){
        return FormaPagamentoDatabase::where('id', '!=', 6)->get();

    }
}
