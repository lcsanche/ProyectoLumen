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

$router->group(['prefix' => 'api/platos'], function () use ($router) {
    $router->get('/',  'PlatoController@index');
    $router->get('/{id}',  'PlatoController@show');
    $router->post('/',  'PlatoController@store');
    $router->put('/{id}',  'PlatoController@update');
    $router->delete('/{id}',  'PlatoController@destroy');
});

$router->group(['prefix' => 'api/tipo-platos'], function () use ($router) {    
    $router->get('/',  'TipoPlatoController@index');
    $router->get('/{id}',  'TipoPlatoController@show');
    $router->post('/',  'TipoPlatoController@store');
    $router->put('/{id}',  'TipoPlatoController@update');
    $router->delete('/{id}',  'TipoPlatoController@destroy');
});
