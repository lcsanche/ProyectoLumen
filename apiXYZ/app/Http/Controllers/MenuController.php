<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Menu;

class MenuController extends Controller
{
    
    public function getMenu()
    {
        return response()->json(Menu::all());
    }

    public function postMenu(Request $request)
    {
        $dataMenu = new Menu;

        $dataMenu->fecha=$request->fecha;
        $dataMenu->estado=$request->estado;

        $dataMenu->save();

        return response()->json($request);
    }
}
