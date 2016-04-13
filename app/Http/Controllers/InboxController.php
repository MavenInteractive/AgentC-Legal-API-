<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;

use App\Inbox;

class InboxController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('associate_id');
			$result = Inbox::where('receiver_associate_id', $input['associate_id'])
                                  ->get();
			return response()->json($result);
		} catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }
}
