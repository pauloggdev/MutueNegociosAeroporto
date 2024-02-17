<?php

namespace App\Models\empresa;

use Illuminate\Database\Eloquent\Model;

class NotaCredito extends Model
{
    protected $table = 'notas_creditos';
    protected $connection = 'mysql2';

    protected $fillable = [
        'uuid',
        'facturaId',
        'reciboId',
        'numDoc',
        'hash',
        'hashTexto',
        'numSequencia',
        'userId',
        'empresaId',
        'descricao',
    ];


    public function factura(){
        return $this->belongsTo(Factura::class, 'facturaId');

    }
    public function recibo(){
        return $this->belongsTo(Recibos::class, 'reciboId');

    }


    public function user(){
        return $this->belongsTo(User::class, 'userId');
    }

}
