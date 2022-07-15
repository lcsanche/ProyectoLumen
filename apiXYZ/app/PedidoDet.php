<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PedidosDet extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'pedido_cab', 'menu_plato_id', 'cantidad'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}