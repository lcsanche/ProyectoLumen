<?php

namespace App\Http\Controllers;

use App\PedidoCab;
use App\PedidoDet;
use App\Cliente;
use Illuminate\Http\Request;

class PedidoCabController extends Controller
{
    
    public function showAllPedidos()
    {
        
        return response()->json(PedidoCab::All());
        //retornar el detalle de los pedidos, y la informacion del cliente

    }

    public function showPedidoByCliente($id)
    {
        return response()->json(PedidoCab::where('cliente_id', $id)->get());
    }

    public function showOnePedido($id)
    {
        return response()->json(PedidoCab::find($id));
    }


}