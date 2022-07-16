<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Plato extends Model
{
    protected $fillable = [
        'tipo_plato', 'nombre', 'descripcion'
    ];

    public function tipo_plato()
    {
        return $this->belongsTo(tipoPlato::class, 'tipo_plato_id');
    }

}