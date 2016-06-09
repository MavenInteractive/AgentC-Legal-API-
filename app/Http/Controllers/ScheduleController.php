<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;
use App\Schedule;
use App\CourtDetails;
use App\Court;
use App\RequestType;
use DB;

class ScheduleController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('associate_id', 'court_detail_id', 'from_date', 'to_date');
            if($input == 0){
                $result = Schedule::where('associate_id', $input['associate_id'])
                                  ->whereBetween('date_time', array($input['from_date'],$input['to_date']))
                                  ->get();
            } else {
                $result = Schedule::where('associate_id', $input['associate_id'])
                                  ->where('court_detail_id', $input['court_detail_id'])
                                  ->whereBetween('date_time', array($input['from_date'],$input['to_date']))
                                  ->get();
            }

			return response()->json($result);
		} catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }

    public function delete(){
        try {
            $input = \Request::only('schedule_id');
            Schedule::where('id', $input['schedule_id'])->delete();

        } catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }

    public function edit(){
        try {
            $input = \Request::only('schedule_id','associate_id','court_detail_id','date_time','request_type_id','notes');

            DB::table('schedules')->where('id',$input['schedule_id'])
                   ->update([
                       'court_detail_id' => $input['court_detail_id'],
                       'associate_id' => $input['associate_id'],
                       'date_time' => $input['date_time'],
                       'request_type_id' => $input['request_type_id'],
                       'notes' => $input['notes']
                    ]);

            $result = Schedule::find($input['schedule_id']);

            $courtDetails = CourtDetails::where('id',$input['court_detail_id'])->get();
            $court = Court::where('id', $courtDetails['0']->court_id)->get();
            $requestType = RequestType::where('id',$input['request_type_id'])->get();

            $result['type'] = $courtDetails['0']->type;
            $result['level'] = $courtDetails['0']->level;
            $result['court_id'] = $courtDetails['0']->court_id;
            $result['name'] = $court['0']->name;
            $result['latitude'] = $court['0']->latitude;
            $result['longitude'] = $court['0']->longitude;
            $result['address'] = $court['0']->address;
            $result['request_type'] = $requestType['0']->name;
            $result['request_description'] = $requestType['0']->description;

            return response()->json($result);

        } catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }

    public function add(){
        try {
            $input = \Request::only('associate_id','court_detail_id','date_time','request_type_id','notes');

            $insertedId = Schedule::insertGetId(
                                    array(
                                         'associate_id'       => $input['associate_id'],
                                         'court_detail_id'    => $input['court_detail_id'],
                                         'date_time'          => $input['date_time'],
                                         'request_type_id'    => $input['request_type_id'],
                                         'notes'              => $input['notes']
                                        )
                                    );

            $result = Schedule::find($insertedId);

            $courtDetails = CourtDetails::where('id',$input['court_detail_id'])->get();
            $court = Court::where('id', $courtDetails['0']->court_id)->get();
            $requestType = RequestType::where('id',$input['request_type_id'])->get();

            $result['type'] = $courtDetails['0']->type;
            $result['level'] = $courtDetails['0']->level;
            $result['court_id'] = $courtDetails['0']->court_id;
            $result['name'] = $court['0']->name;
            $result['latitude'] = $court['0']->latitude;
            $result['longitude'] = $court['0']->longitude;
            $result['address'] = $court['0']->address;
            $result['request_type'] = $requestType['0']->name;
            $result['request_description'] = $requestType['0']->description;

            return response()->json($result);

        } catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }


}
