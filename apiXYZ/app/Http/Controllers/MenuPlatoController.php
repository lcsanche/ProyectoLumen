<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\MenuPlato;

class MenuPlatoController extends Controller
{
    
    public function getMenuSemana($id)
    {
        return response()->json(MenuPlato::where('menu_id', $id)->get());
    }

    public function getMenuDia($id, $dia)
    {
        return response()->json(MenuPlato::where('menu_id', $id)
        ->where('dia', $dia)->get());
    }

    public function postMenuPlato(Request $request, $id)
    {
        $dataPlato = new MenuPlato;
        $dataPlato->where('menu_id', $id);

        $dataPlato->menu_id=$id;
        $dataPlato->plato_id=$request->plato_id;
        $dataPlato->dia=$request->dia;
        $dataPlato->precio=$request->precio;

        $dataPlato->save();

        return response()->json("Agregando nuevo plato al menú de la semana con id: ".$id."");
    }

    // Error con las claves foráneas
    public function putPlatoPorDia(Request $request, $id)
    {
        $dataPlato = new MenuPlato;
        $peticion = $request->json()->all();
        $dataPlato->where('menu_id', $id)->update([
            'plato_id' => $peticion['plato_id'], 
            'dia' => $peticion['dia'], 
            'precio' => $peticion['precio']
        ]);
        return response()->json("Plato modificado con éxito");
    }

    // Error con las claves foráneas
    public function deletePlatoPorDia(Request $request, $id, $dia)
    {
        $aEliminar = $request->plato_id;
        $data = MenuPlato::where('menu_id', $id)->where('dia', $dia)
        ->where('plato_id', $aEliminar);
        
        $data->delete();

        return response()->json('Eliminado con éxito');
    }
}
