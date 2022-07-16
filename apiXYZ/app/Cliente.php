<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nombre', 'direccion', 'ruc', 'telefono'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];

    public function Pedidos()
    {
        return $this->hasMany('App\PedidoCab', 'cliente_id');
    }
}