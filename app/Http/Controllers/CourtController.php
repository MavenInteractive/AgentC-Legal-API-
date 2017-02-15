<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;
use App\Associate;
use App\AssociateLocation;
use App\Court;
use App\CourtDetails;
use App\Favorite;
use App\Schedule;
use App\Service;
use App\ServiceAssignees;

class CourtController extends Controller
{
    public function index()
    {
        try {
            $input = \Request::only('type', 'level');

            $result = Court::leftJoin('court_details', 'court_details.court_id', '=', 'courts.id')
                ->where('court_details.type', $input['type'])
                ->where('court_details.level', $input['level'])
                ->select('courts.*', 'court_details.id AS detail_id', 'court_details.type', 'court_details.level')
                ->get();

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function sched()
    {
        try {
            $input = \Request::only('court_id', 'date', 'associate_id');

            if (date('Y-m-d') == date('Y-m-d', strtotime($input['date']))) {
                $date = new \DateTime;
                $date->modify('-1 hour');
                $formatted_date = $date->format('Y-m-d H:i:s');
                $result = AssociateLocation::leftJoin('associates', 'associates.id', '=', 'associate_location.associate_id')
                    ->where('court_id', $input['court_id'])
                    ->where('date_time', 'LIKE', '%'.date('Y-m-d', strtotime($input['date'])).'%')
                    ->where('insert_time','>=',$formatted_date)
                    ->groupBy('associate_location.associate_id')
                    ->get();

                return response()->json($result);
            } else {
                $sched = Schedule::leftJoin('court_details', 'court_details.id', '=', 'schedules.court_detail_id')
                    ->leftJoin('courts', 'courts.id', '=', 'court_details.court_id')
                    ->leftJoin('associates', 'schedules.associate_id', '=','associates.id')
                    ->where('courts.id', $input['court_id'])
                    //->where('schedules.date_time', '=',date('Y-m-d', strtotime($input['date'])))
                    ->whereBetween('schedules.date_time', array(date('Y-m-d', strtotime($input['date']))." 00:00:00", date('Y-m-d', strtotime($input['date']))." 23:59:59"))
                    ->select('schedules.*','courts.name AS court_name','courts.latitude','courts.longitude','courts.address','court_details.type','court_details.level','court_details.court_id','associates.fullname')
                    ->get();

                // if (count($sched) > 0) {
                //     $sV = array();
                //
                //     foreach ($sched as $sc) {
                //         $sV[] = ServiceAssignees::leftJoin('associates', 'associates.id', '=', 'service_request_assignees.associate_id')
                //             ->where('service_request_id', $sc['id'])
                //             ->select('associates.*')
                //             ->first();
                //     }
                //
                //     $result = $sV;
                // } else {
                //     $result = array('0');
                // }

                return response()->json($sched);
            }
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function schedules()
    {
        $result = array();

        try {
            $input = \Request::only('court_id', 'date', 'associate_id');

            $court = new Court;
            $court = $court->where('id', $input['court_id']);
            $result['court'] = $court->first();

            $associate = new Associate;
            $associate = $associate->where('id', $input['associate_id']);
            $result['associate'] = $associate->first();

            $location = new AssociateLocation;
            $location = $location->where('court_id', $input['court_id']);
            $location = $location->where('associate_id', $input['associate_id']);
            $location = $location->whereRaw("date(date_time) = '" . $input['date'] . "'");
            $result['location'] = $location->get();

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request', 'msg' => $error], Response::HTTP_BAD_REQUEST);
        }
    }

    public function unique_multidim_array($array, $key)
    {
        $temp_array = array();
        $i = 0;
        $key_array = array();

        foreach ($array as $val) {
            if (!in_array($val[$key], $key_array)) {
                $key_array[$i] = $val[$key];
                $temp_array[$i] = $val;
            }

            ++$i;
        }

        return $temp_array;
    }
}
