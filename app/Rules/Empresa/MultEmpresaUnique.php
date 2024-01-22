<?php

namespace App\Rules\Empresa;

use App\Empresa\GerenciaEmpresa;
use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\DB;


class MultEmpresaUnique implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    private $table;
    private $column;
    private $columnValue;
    private $connection;
    

    public function __construct($table, $connection = "mysql2", $column = 'id', $columnValue = null)
    {
        $this->table = $table;
        $this->column = $column;
        $this->columnValue = $columnValue;
        $this->connection = $connection;
      
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {


        $empresa_id = auth('EmpresaApi')->user()->empresa_id;

        $result = DB::connection($this->connection)->table($this->table)
        ->where($attribute, $value)
            ->where('empresa_id', $empresa_id)
            ->first();
            return true;
            if($result && $result->{$this->column} == $this->columnValue)
                return true;
            
        return is_null($result);
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'O valor indicado para o campo :attribute já se encontra registado';
    }
}
