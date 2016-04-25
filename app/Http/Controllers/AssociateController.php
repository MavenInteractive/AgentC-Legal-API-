<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\Associate;
use App\Favorite;


class AssociateController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('id','full');
			$result = Associate::findOrFail($input['id']);
            if($input['full'] == 1){
                $favorites = Favorite::select('id')->where('associate_id',$input['id'])->get();

                foreach ($favorites as $favorite) {
                    $favoriteIds[] = $favorite->id;
                }
                $result['favorites'] = $favoriteIds;
            }

			return response()->json($result);
		} catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }

    public function submitAction(){
        try{
            $check = \Request::only('action');
            switch ($check['action']) {
                case 'create':
                    $input = \Request::only('email', 'username', 'password', 'fullname', 'phone', 'law_firm', 'position', 'city', 'law_society_ref_number', 'association_number', 'is_private', 'photo');

                    $insertedId = Associate::insertGetId(
                                            array(
                                                 'email'                  => $input['email'],
                                                 'username'               => $input['username'],
                                                 'password'               => \Hash::make($input['password']),
                                                 'fullname'               => $input['fullname'],
                                                 'phone'                  => $input['phone'],
                                                 'law_firm'               => $input['law_firm'],
                                                 'position'               => $input['position'],
                                                 'city'                   => $input['city'],
                                                 'law_society_ref_number' => $input['law_society_ref_number'],
                                                 'association_number'     => $input['association_number'],
                                                 'is_private'             => $input['is_private'],
                                                 'photo'                  => $input['photo']
                                                )
                                            );

                    $result = Associate::find($insertedId);

                    return response()->json($result);
                    break;
                case 'edit':
                    $input = \Request::only('associate_id','email', 'username', 'password', 'fullname', 'phone', 'law_firm', 'position', 'city', 'law_society_ref_number', 'association_number');

                    $associate = Associate::where('id',$input['associate_id'])->update([
                        'email'     => $input['email'],
                        'username' => $input['username'],
                        'password' => \Hash::make($input['password']),
                        'fullname' => $input['fullname'],
                        'phone' => $input['phone'],
                        'law_firm' => $input['law_firm'],
                        'position' => $input['position'],
                        'city' => $input['city'],
                        'law_society_ref_number' => $input['law_society_ref_number'],
                        'association_number' => $input['association_number']
                    ]);


                    $result = Associate::findOrFail($input['associate_id']);

                    $favorites = Favorite::select('id')->where('associate_id',$input['associate_id'])->get();

                    if(count($favorites)){
                        foreach ($favorites as $favorite) {
                            $favoriteIds[] = $favorite->id;
                        }

                        $result['favorites'] = $favoriteIds;
                    }


                    return response()->json($result);
                    break;

                case 'public':
                    $input = \Request::only('associate_id','is_private');

                    $associate = Associate::where('id',$input['associate_id'])->update([
                        'is_private' => $input['is_private'],
                    ]);


                    $result = Associate::findOrFail($input['associate_id']);

                    $favorites = Favorite::select('id')->where('associate_id',$input['associate_id'])->get();

                    if(count($favorites)){
                        foreach ($favorites as $favorite) {
                            $favoriteIds[] = $favorite->id;
                        }

                        $result['favorites'] = $favoriteIds;
                    }


                    return response()->json($result);
                break;
                case 'alert':
                    $input = \Request::only('associate_id','alert_settings');

                    $associate = Associate::where('id',$input['associate_id'])->update([
                        'alert_settings' => $input['alert_settings'],
                    ]);


                    $result = Associate::findOrFail($input['associate_id']);

                    $favorites = Favorite::select('id')->where('associate_id',$input['associate_id'])->get();

                    if(count($favorites)){
                        foreach ($favorites as $favorite) {
                            $favoriteIds[] = $favorite->id;
                        }

                        $result['favorites'] = $favoriteIds;
                    }


                    return response()->json($result);
                    break;

                case 'view':
                    $input = \Request::only('email','username','password','status');
                    $result = Associate::select('email','username','password','status')
                                       ->where('email',$input['email'])
                                       ->where('username',$input['username'])
                                       ->where('password',$input['password'])
                                       ->where('status',$input['status'])
                                       ->get();

                    return response()->json($result);
                    break;
            }

        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function showAll(){
        try{
            $result = Associate::all()->sortBy('fullname');
            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function forgot(){
        try{
            $input = \Request::only('email');
        } catch(\Exception $error){
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }
}
