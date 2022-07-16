<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PedidoCab extends Model
{
<<<<<<< HEAD

=======
    const CREATED_AT = null;
    const UPDATED_AT = null;
>>>>>>> bec72725cd436e49b3cf781ba399dc02b5ab1df7
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'menu_id', 'cliente_id', 'fecha_pedido'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];

    public function Clientes()
    {
        return $this->belongsTo('App\Cliente', 'cliente_id');
    }
}