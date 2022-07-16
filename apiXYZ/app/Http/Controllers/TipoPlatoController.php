<?php

namespace App\Http\Controllers;

use App\tipoPlato;
use Illuminate\Http\Request;

class TipoPlatoController extends Controller
{
    public function index()
    {
        return response()->json([tipoPlato::all()]);
    }
    
    public function show($id)
    {
        return response()->json([tipoPlato::with('platos')->find($id)]);
    }

    public function store(Request $request)
    {
        try{
            $plato = new tipoPlato();
            $plato->nombre = $request->nombre;

            if($plato->save()){
                return response()->json(['status' => 'success', 'message' => 'Tipo guardado correctamente']);
            }

       }catch(\Exception $e){
            return response()->json(['status' => 'error', 'message' => 'Error al guardar el tipo,' . $e->getMessage()]);
       }
    }

    public function update(Request $request, $id)
    {
       try{
            $plato = tipoPlato::findOrFail($id);
            $plato->nombre = $request->nombre;

            if($plato->save()){
                return response()->json(['status' => 'success', 'message' => 'Tipo editado correctamente']);
            }

       }catch(\Exception $e){
            return response()->json(['status' => 'error', 'message' => 'Error al editar el tipo,' . $e->getMessage()]);
       }
    }

    public function destroy($id)
    {
        try{
            $plato = tipoPlato::findOrFail($id);

            if($plato->delete()){
                return response()->json(['status' => 'success', 'message' => 'Tipo eliminado correctamente']);
            }
       }catch(\Exception $e){
            return response()->json(['status' => 'error', 'message' => 'Error al eliminar el tipo,' . $e->getMessage()]);
       }
    }
}
