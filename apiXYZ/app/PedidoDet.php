<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PedidoDet extends Model
{
    const CREATED_AT = null;
    const UPDATED_AT = null;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'pedido_cab', 'menu_plato_id', 'cantidad'
    ];

    protected $primaryKey = 'pedido_cab';

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}