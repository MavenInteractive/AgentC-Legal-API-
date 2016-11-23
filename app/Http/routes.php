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

// Route::get('/register',function(){$user = new App\User();
//     $user->name='test user';
//     $user->email='test@test.com';
//     $user->password = \Illuminate\Support\Facades\Hash::make('testpass');
//     $user->save();
// });

Route::post('oauth/access-token', ['as' => 'associate.login', 'uses' => 'AssociateController@loginAssociate']);
Route::post('photo',              ['as' => 'photo.upload',    'uses' => 'PhotoController@upload']);

Route::group(['prefix' => 'api/v1.0'], function() {
    Route::get('start-up',           ['as' => 'startup.index',           'uses' => 'StartUpController@index']);

    Route::get('associate',          ['as' => 'associate.index',         'uses' => 'AssociateController@index']);
    Route::post('associate',         ['as' => 'associate.check',         'uses' => 'AssociateController@submitAction']);
    Route::get('associates',         ['as' => 'associate.all',           'uses' => 'AssociateController@showAll']);
    Route::post('forgot',            ['as' => 'forgot',                  'uses' => 'AssociateController@forgot']);

    Route::post('associate-devices', ['as' => 'associate-devices.index', 'uses' => 'AssociateDevicesController@index']);

    Route::get('courts',             ['as' => 'courts.index',            'uses' => 'CourtController@index']);

    Route::get('search',             ['as' => 'search.index',            'uses' => 'SearchController@index']);

    Route::get('schedules',          ['as' => 'schedules.index',         'uses' => 'ScheduleController@index']);
    Route::delete('schedules',       ['as' => 'schedules.delete',        'uses' => 'ScheduleController@delete']);
    Route::put('schedules',          ['as' => 'schedules.edit',          'uses' => 'ScheduleController@edit']);
    Route::post('schedules',          ['as' => 'schedules.add',          'uses' => 'ScheduleController@add']);

    Route::get('notifications',      ['as' => 'notification.index',      'uses' => 'NotificationController@index']);

    Route::get('message-inboxes',    ['as' => 'message-inboxes.index',   'uses' => 'InboxController@index']);
    Route::post('message-inboxes',   ['as' => 'message-inboxes.add',     'uses' => 'InboxController@add']);

    Route::post('favorites',         ['as' => 'favorites.insert',        'uses' => 'FavoriteController@insert']);
    Route::delete('favorites',       ['as' => 'favorites.delete',        'uses' => 'FavoriteController@destroy']);

    Route::post('service-request',   ['as' => 'service-request.add',     'uses' => 'ServiceController@add']);
    Route::get('service-request',    ['as' => 'service-request.index',   'uses' => 'ServiceController@index']);
    Route::put('service-request',    ['as' => 'service-request',         'uses' => 'ServiceController@status']);
    Route::delete('service-request', ['as' => 'service-request.delete',  'uses' => 'ServiceController@delete']);
    Route::get('service-request/completed','ServiceController@getCompletedRequests');

    Route::get('ping',               ['as' => 'ping',                    'uses' => 'PingController@index']);
    Route::post('courtsched',        ['as' => 'courtsched',              'uses' => 'CourtController@sched']);
    Route::post('courts/schedules',  ['as' => 'courts.schedules',        'uses' => 'CourtController@schedules']);
});
