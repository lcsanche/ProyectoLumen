<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tipoPlato extends Model
{
    protected $fillable = [
        'nombre'
    ];

    public function platos(){
        return $this->hasMany(Plato::class);
    }
}
