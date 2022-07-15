<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MenuPlato extends Model
{

    const UPDATED_AT = null;
    const CREATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'menu_id', 'plato_id', 'dia', 'precio'
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