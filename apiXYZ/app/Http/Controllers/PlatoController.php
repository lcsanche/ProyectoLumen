<?php

namespace App\Http\Controllers;

use App\Plato;
use Illuminate\Http\Request;

class PlatoController extends Controller
{
    public function index()
    {
        return response()->json([Plato::all()]);
        //retornar todos los platos
    }

     public function show($id)
    {  
        return response()->json([Plato::with('tipo_plato')->find($id)]);
        //retornar un plato en específico
    }

    public function store(Request $request)
    {
        try{
            $plato = new Plato();
            $plato->nombre = $request->nombre;
            $plato->tipo_plato_id = $request->tipo_plato_id;
            $plato->descripcion = $request->descripcion;

            if($plato->save()){
                return response()->json(['status' => 'success', 'message' => 'Plato guardado correctamente']);
            }

       }catch(\Exception $e){
            return response()->json(['status' => 'error', 'message' => 'Error al guardar el plato,' . $e->getMessage()]);
       }
    }

    public function update(Request $request, $id)
    {
       try{
            $plato = Plato::findOrFail($id);
            $plato->nombre = $request->nombre;
            $plato->tipo_plato_id = $request->tipo_plato_id;
            $plato->descripcion = $request->descripcion;

            if($plato->save()){
                return response()->json(['status' => 'success', 'message' => 'Plato editado correctamente']);
            }

       }catch(\Exception $e){
            return response()->json(['status' => 'error', 'message' => 'Error al editar el plato,' . $e->getMessage()]);
       }
    }

    public function destroy($id)
    {
        try{
            $plato = Plato::findOrFail($id);

            if($plato->delete()){
                return response()->json(['status' => 'success', 'message' => 'Plato eliminado correctamente']);
            }
       }catch(\Exception $e){
            return response()->json(['status' => 'error', 'message' => 'Error al eliminar el plato,' . $e->getMessage()]);
       }
    }
}
