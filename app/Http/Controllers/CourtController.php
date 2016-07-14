<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;
use App\AssociateLocation;
use App\Court;

class CourtController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('type','level');
			$result = Court::leftJoin('court_details', 'court_details.court_id', '=', 'courts.id')
                           ->where('court_details.type',$input['type'])
                           ->where('court_details.level',$input['level'])
                           ->select('courts.*','court_details.id AS detail_id','court_details.type','court_details.level')
                           ->get();
			return response()->json($result);
		} catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }

   public function sched(){
       try{
           $input = \Request::only('court_id','date');
           $result = AssociateLocation::leftJoin('associates','associates.id','=', 'associate_location.associate_id')
                   ->where('court_id',$input['court_id'])
                   ->where('date_time', 'LIKE', '%'.$input['date'].'%')
                   ->get();
            return response()->json($result);
       } catch(\Exception $error){
           dd($error);
           return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
       }
   }

}
