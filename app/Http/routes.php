<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/register',function(){$user = new App\User();
 $user->name='test user';
 $user->email='test@test.com';
 $user->password = \Illuminate\Support\Facades\Hash::make('testpass');
 $user->save();

});


Route::post('oauth/access-token', function() {
    return Response::json(Authorizer::issueAccessToken());
});

Route::group(['prefix' => 'api/v1.0'], function() {
    Route::get('start-up',           ['as' => 'startup.index',             'uses' => 'StartUpController@index']);

    Route::get('associate',          ['as' => 'associate.index',           'uses' => 'AssociateController@index']);
    Route::post('associate',         ['as' => 'associate.check',           'uses' => 'AssociateController@check']);
    Route::get('associates',          ['as' => 'associate.all',            'uses' => 'AssociateController@showAll']);

    Route::post('associate-devices', ['as' => 'associate-devices.index',   'uses' => 'AssociateDevicesController@index']);

    Route::get('courts',             ['as' => 'courts.index',              'uses' => 'CourtController@index']);

    Route::get('search',             ['as' => 'search.index',              'uses' => 'SearchController@index']);

    Route::get('schedules',          ['as' => 'schedules.index',           'uses' => 'ScheduleController@index']);

    Route::get('notifications',      ['as' => 'notification.index',        'uses' => 'NotificationController@index']);

    Route::get('message-inboxes',    ['as' => 'message-inboxes.index',     'uses' => 'InboxController@index']);
    
});
