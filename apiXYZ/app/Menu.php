<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{

    const UPDATED_AT = null;
    const CREATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'fecha', 'estado'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];

    // public function Pedidos()
    // {
    //     return $this->hasMany('App\PedidoCab', 'cliente_id');
    // }
}