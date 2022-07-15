<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});


// Respuesta MENU  
$router->group(['prefix' => 'api/menu'], function () use ($router) {
    $router->get('/',  ['uses' => 'MenuController@getMenu']);
    $router->get('/{id}',  ['uses' => 'MenuPlatoController@getMenuSemana']);
    $router->get('/{id}/{dia}',  ['uses' => 'MenuPlatoController@getMenuDia']);

    $router->post('',  ['uses' => 'MenuController@postMenu']);
    $router->post('/{id}',  ['uses' => 'MenuPlatoController@postMenuPlato']);
    $router->post('/{id}/{dia}',  ['uses' => 'MenuPlatoController@postMenuPlato']);

    $router->put('/{id}/{dia}',  ['uses' => 'MenuPlatoController@postPlatoPorDia']);
    
    $router->delete('/{id}/{dia}',  ['uses' => 'MenuPlatoController@deletePlatoPorDia']);
});
//
$router->group(['prefix' => 'api/pedidos'], function () use ($router) {
    $router->get('/',  ['uses' => 'PedidoCabController@showAllPedidos']);
    $router->get('/{id}',  ['uses' => 'PedidoCabController@showOnePedido']);
    $router->get('/Client/{id}',  ['uses' => 'PedidoCabController@showPedidoByCliente']);
    $router->post('/', ['uses' => 'PedidoCabController@createPedido']);
    $router->post('/{id}', ['uses' => 'PedidoCabController@updatePedido']);
    $router->delete('/{id}', ['uses' => 'PedidoCabController@deletePedido']);
});
