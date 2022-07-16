<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

<<<<<<< HEAD
class PedidosDet extends Model
{

=======
class PedidoDet extends Model
{
    const CREATED_AT = null;
    const UPDATED_AT = null;
>>>>>>> bec72725cd436e49b3cf781ba399dc02b5ab1df7
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'pedido_cab', 'menu_plato_id', 'cantidad'
    ];

<<<<<<< HEAD
=======
    protected $primaryKey = 'pedido_cab';

>>>>>>> bec72725cd436e49b3cf781ba399dc02b5ab1df7
    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}