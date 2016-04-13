<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class ScheduleController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('associate_id', 'court_detail_id', 'from_date', 'to_date', 'include_service_request', 'month', 'year');
			$result = Schedule::where('associate_id', $input['associate_id'])
                              ->where('court_detail_id', $input['court_detail_id'])

                             // ->where('include_service_request', $input[''])

                              ->get();
			return response()->json($result);
		} catch (\Exception $error) {
            dd($error);
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }
}
