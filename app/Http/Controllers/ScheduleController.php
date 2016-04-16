<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;
use App\Schedule;

class ScheduleController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('associate_id', 'court_detail_id', 'from_date', 'to_date');
			$result = Schedule::where('associate_id', $input['associate_id'])
                              ->where('court_detail_id', $input['court_detail_id'])
                              ->whereBetween('date_time', array($input['from_date'],$input['to_date']))
                              ->get();
			return response()->json($result);
		} catch (\Exception $error) {
            dd($error);
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }
}
