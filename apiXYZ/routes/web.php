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

$router->group(['prefix' => 'api'], function () use ($router) {
    $router->get('pedidos',  ['uses' => 'PedidoCabController@showAllPedidos']);
  });

// Respuesta MENU  
$router->group(['prefix' => 'api'], function () use ($router) {
    $router->get('menu',  ['uses' => 'MenuController@getMenu']);
    $router->get('menu/{id}',  ['uses' => 'MenuPlatoController@getMenuSemana']);
    $router->get('menu/{id}/{dia}',  ['uses' => 'MenuPlatoController@getMenuDia']);

    $router->post('menu',  ['uses' => 'MenuController@postMenu']);
    $router->post('menu/{id}',  ['uses' => 'MenuPlatoController@postMenuPlato']);
    $router->post('menu/{id}/{dia}',  ['uses' => 'MenuPlatoController@postMenuPlato']);

    $router->put('menu/{id}/{dia}',  ['uses' => 'MenuPlatoController@postPlatoPorDia']);
    
    $router->delete('menu/{id}/{dia}',  ['uses' => 'MenuPlatoController@deletePlatoPorDia']);
});
//