<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;
use App\Service;
use App\Court;
use App\Schedule;
use App\CourtDetails;
use App\ServiceAssignees;
use App\AssociateLocation;
use App\Favorite;

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
           $input = \Request::only('court_id','date','associate_id');
           if (date('Y-m-d') == date('Y-m-d', strtotime($input['date']))) {
               $result = AssociateLocation::leftJoin('associates','associates.id','=', 'associate_location.associate_id')
                ->where('court_id',$input['court_id'])
                ->where('date_time', 'LIKE', '%'.$input['date'].'%')
                ->get();

                $fav = Favorite::leftJoin('associates','associates.id','=','favorites.other_associate_id')
                                ->where('favorites.associate_id',$input['associate_id'])
                                ->select('associates.*')
                                ->get();
                $result + = $fav;
                return response()->json($result);
           }
           else{
                // $result = Service::leftJoin('schedules','schedules.id','=','service_requests.schedule_id')
                //             ->leftJoin('service_request_assignees','service_requests.id','=','service_request_assignees.service_request_id')
                //             ->leftJoin('court_details','court_details.id','=','schedules.court_detail_id')
                //             ->leftJoin('associates','associates.id','=','schedules.associate_id')
                //             ->where('service_requests.insert_time','LIKE', '%'.$input['date'].'%')
                //             ->where('schedules.court_detail_id',$input['court_id'])
                //             ->select('associates.*')
                //             ->get();

                $sched = Schedule::leftJoin('court_details','court_details.id','=','schedules.court_detail_id')
                          ->leftJoin('service_requests','service_requests.schedule_id','=','schedules.id')
                          ->leftJoin('courts','courts.id','=','court_details.court_id')
                          ->where('schedules.court_detail_id',$input['court_id'])
                          ->where('schedules.date_time','LIKE', '%'.$input['date'].'%')
                          ->select('service_requests.*')
                          ->get();

                if(count($sched) > 0){
                    $sV = array();
                    foreach ($sched as $sc) {
                        $sV[] = ServiceAssignees::leftJoin('associates','associates.id','=','service_request_assignees.associate_id')
                        ->where('service_request_id', $sc['id'])
                        ->select('associates.*')
                        ->first();
                    }
                    $result = $sV;
                    $fav = Favorite::leftJoin('associates','associates.id','=','favorites.other_associate_id')
                                    ->where('favorites.associate_id',$input['associate_id'])
                                    ->select('associates.*')
                                    ->get();
                    $result + = $fav;


                } else {

                    $fav = Favorite::leftJoin('associates','associates.id','=','favorites.other_associate_id')
                                    ->where('favorites.associate_id',$input['associate_id'])
                                    ->select('associates.*')
                                    ->get();
                    $result + = $fav;

                }

                return response()->json($result);
            }

       } catch(\Exception $error){
           dd($error);
           return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
       }
   }

}
