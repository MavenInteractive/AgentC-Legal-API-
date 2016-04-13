<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class ServiceController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('as_assignor', 'associate_id', 'status', 'offset', 'limit');
			$result = Service::where('associate_id', $input['associate_id'])
                              ->where('court_detail_id', $input['court_detail_id'])
                              ->get();
			return response()->json($result);
		} catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }
}
