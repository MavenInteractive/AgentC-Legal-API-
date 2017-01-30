<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\Schedule;
use App\Service;
use App\CourtDetails;
use App\Court;
use App\RequestType;
use DB;

class ScheduleController extends Controller
{
    public function index()
    {
        try {
            $input = \Request::only('associate_id', 'court_detail_id', 'from_date', 'to_date');
            if ($input['court_detail_id'] == 0) {
                // $result = Schedule::where('service_request_assignees.associate_id', $input['associate_id'])
                //     ->leftJoin('court_details', 'schedules.court_detail_id', '=', 'court_details.id')
                //     ->leftJoin('courts', 'court_details.court_id', '=', 'courts.id')
                //
                //     ->leftJoin('service_requests','schedules.id', '=', 'service_requests.schedule_id')
                //     ->leftJoin('service_request_assignees','service_requests.id', '=', 'service_request_assignees.service_request_id')
                //
                //     ->leftJoin('request_types', 'schedules.request_type_id', '=', 'request_types.id')
                //     ->leftJoin('associates', 'service_request_assignees.associate_id', '=','associates.id')
                //     ->whereBetween('schedules.date_time', array($input['from_date'], $input['to_date']))
                //     ->select('schedules.*', 'courts.name AS court_name', 'request_types.name AS request_type','associates.fullname')
                //     ->get();
                 $sched = Schedule::where('service_request_assignees.associate_id', $input['associate_id'])
                         ->leftJoin('service_requests','schedules.id', '=', 'service_requests.schedule_id')
                         ->leftJoin('service_request_assignees','service_requests.id', '=', 'service_request_assignees.service_request_id')
                         ->leftJoin('request_types', 'schedules.request_type_id', '=', 'request_types.id')
                         ->leftJoin('associates', 'service_request_assignees.associate_id', '=','associates.id')
                         ->whereBetween('schedules.date_time', array($input['from_date'], $input['to_date']))
                         ->select('schedules.*','request_types.name AS request_type','associates.fullname')->get();

                 $service =  Service::where('service_request_assignees.associate_id',$input['associate_id'])
                             ->leftJoin('service_request_assignees','service_requests.id', '=', 'service_request_assignees.service_request_id')
                             ->leftJoin('associates', 'service_request_assignees.associate_id', '=','associates.id')
                             ->whereBetween('service_requests.insert_time', array($input['from_date'], $input['to_date']))
                             ->select('service_requests.*','associates.fullname')
                     ->get();

                $result = ['schedules' => $sched, 'service_requests' => $sched];


            } elseif ($input['associate_id'] == 0) {
                $result = Schedule::where('court_detail_id', $input['court_detail_id'])
                    ->leftJoin('court_details', 'schedules.court_detail_id', '=', 'court_details.id')
                    ->leftJoin('courts', 'court_details.court_id', '=', 'courts.id')
                    ->leftJoin('request_types', 'schedules.request_type_id', '=', 'request_types.id')

                    ->leftJoin('service_requests','schedules.id', '=', 'service_requests.schedule_id')
                    ->leftJoin('service_request_assignees','service_requests.id', '=', 'service_request_assignees.service_request_id')

                    ->leftJoin('associates', 'service_request_assignees.associate_id', '=','associates.id')
                    ->whereBetween('date_time', array($input['from_date'], $input['to_date']))
                    ->select('schedules.*', 'courts.name AS court_name', 'request_types.name AS request_type','associates.fullname')
                    ->get();
            } else {
                $result = Schedule::where('associate_id', $input['associate_id'])
                    ->where('court_detail_id', $input['court_detail_id'])
                    ->leftJoin('court_details', 'schedules.court_detail_id', '=', 'court_details.id')
                    ->leftJoin('courts', 'court_details.court_id', '=', 'courts.id')
                    ->leftJoin('request_types', 'schedules.request_type_id', '=', 'request_types.id')
                    ->whereBetween('date_time', array($input['from_date'], $input['to_date']))
                    ->select('schedules.*', 'courts.name AS court_name', 'request_types.name AS request_type')
                    ->get();
            }

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function delete()
    {
        try {
            $input = \Request::only('schedule_id');
            Schedule::where('id', $input['schedule_id'])->delete();
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function edit()
    {
        try {
            $input = \Request::only('schedule_id', 'associate_id', 'court_detail_id', 'date_time', 'request_type_id', 'notes');

            DB::table('schedules')
                ->where('id', $input['schedule_id'])
                ->update([
                    'court_detail_id' => $input['court_detail_id'],
                    'associate_id'    => $input['associate_id'],
                    'date_time'       => $input['date_time'],
                    'request_type_id' => $input['request_type_id'],
                    'notes'           => $input['notes'],
                ]);

            $result       = Schedule::find($input['schedule_id']);
            $courtDetails = CourtDetails::where('id', $input['court_detail_id'])->get();
            $court        = Court::where('id', $courtDetails['0']->court_id)->get();
            $requestType  = RequestType::where('id', $input['request_type_id'])->get();

            $result['type']                = $courtDetails['0']->type;
            $result['level']               = $courtDetails['0']->level;
            $result['court_id']            = $courtDetails['0']->court_id;
            $result['name']                = $court['0']->name;
            $result['latitude']            = $court['0']->latitude;
            $result['longitude']           = $court['0']->longitude;
            $result['address']             = $court['0']->address;
            $result['request_type']        = $requestType['0']->name;
            $result['request_description'] = $requestType['0']->description;

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function add()
    {
        try {
            $input = \Request::only('associate_id', 'court_detail_id', 'date_time', 'request_type_id', 'notes');

            $insertedId = Schedule::insertGetId(array(
                'associate_id'    => $input['associate_id'],
                'court_detail_id' => $input['court_detail_id'],
                'date_time'       => $input['date_time'],
                'request_type_id' => $input['request_type_id'],
                'notes'           => $input['notes'],
            ));

            $result       = Schedule::find($insertedId);
            $courtDetails = CourtDetails::where('id', $input['court_detail_id'])->get();
            $court        = Court::where('id', $courtDetails['0']->court_id)->get();
            $requestType  = RequestType::where('id', $input['request_type_id'])->get();

            $result['type']                = $courtDetails['0']->type;
            $result['level']               = $courtDetails['0']->level;
            $result['court_id']            = $courtDetails['0']->court_id;
            $result['name']                = $court['0']->name;
            $result['latitude']            = $court['0']->latitude;
            $result['longitude']           = $court['0']->longitude;
            $result['address']             = $court['0']->address;
            $result['request_type']        = $requestType['0']->name;
            $result['request_description'] = $requestType['0']->description;

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }
}
