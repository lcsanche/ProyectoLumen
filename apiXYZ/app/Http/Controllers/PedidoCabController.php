<?php

namespace App\Http\Controllers;

use App\PedidoCab;
use App\PedidoDet;
use App\Cliente;
use Illuminate\Http\Request;

class PedidoCabController extends Controller {
    
    public function showAllPedidos(){
        
        return response()->json(PedidoCab::All());
        //retornar el detalle de los pedidos, y la informacion del cliente

    }

    public function showPedidoByCliente($id){
        return response()->json(PedidoCab::where('cliente_id', $id)->get());
    }

    public function showOnePedido($id){
        return response()->json(PedidoCab::find($id));
    }

    private function createPedidoDet(Request $request, $id){
        if($id){
            $dataPedidoDet = new PedidoDet;
            $dataPedidoDet->pedido_cab = $id;
            $dataPedidoDet->menu_plato_id = $request->menu_plato_id;
            $dataPedidoDet->cantidad = $request->cantidad;
            $dataPedidoDet->save();
            return true;
        }
        return false;
    }

    public function createPedido(Request $request){
        $dataPedidoCab = new PedidoCab;
        $dataPedidoCab->menu_id = $request->menu_id;
        $dataPedidoCab->cliente_id = $request->cliente_id;
        $dataPedidoCab->fecha_pedido = $request->fecha_pedido;
        $dataPedidoCab->save();
        $details = $this->createPedidoDet($request, $dataPedidoCab->id);
        return response()->json("Registro de datos exitoso");
    }

    public function updatePedido(Request $request, $id){
        $dataPedidoCab = PedidoCab::find($id);
        $dataPedidoDet = PedidoDet::where('pedido_cab', $id)->first();
        if($request->input('fecha_pedido')){
            $dataPedidoCab->fecha_pedido = $request->input('fecha_pedido');
            $dataPedidoCab->save();
        }
        if($request->input('cantidad')){
            $dataPedidoDet->cantidad = $request->input('cantidad');
            $dataPedidoDet->save();
        }
        return response()->json("Registros de pedido con ".$id." modificados con exito");
    }

    public function deletePedido($id){
        try{
            $dataPedido = PedidoCab::find($id);
            if ($dataPedido){
                $dataPedido->delete();
                return response()->json("El pedido con ".$id." ha sido eliminado");
            } else {
                return response()->json("El pedido con ".$id." no ha sido encontrado");
            }
        } catch(\Illuminate\Database\QueryException $exception){
            return response()->json("El pedido con ".$id." tiene apariciones en otras tablas, por favor eliminarlas ".
                "para completar el proceso");
        }
    }
}