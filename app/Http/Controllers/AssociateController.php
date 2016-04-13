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

    public function check(){
        try{
            $input = \Request::only('email','username','password','status');
            $result = Associate::select('email','username','password','status')
                               ->where('email',$input['email'])
                               ->where('username',$input['username'])
                               ->where('password',$input['password'])
                               ->where('status',$input['status'])
                               ->get();

            return response()->json($result);

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
}
