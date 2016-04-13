<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;

use App\Notification;

class NotificationController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('associate_id', 'offset', 'limit');
			$result = Notification::where('associate_id', $input['associate_id'])
                                  ->skip($input['offset'])
                                  ->take($input['limit'])
                                  ->get();
			return response()->json($result);
		} catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }
}
