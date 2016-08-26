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
                $result = AssociateLocation::leftJoin('associates', 'associates.id', '=', 'associate_location.associate_id')
                    ->where('court_id', $input['court_id'])
                    ->where('date_time', 'LIKE', '%'.$input['date'].'%')
                    ->get();

                return response()->json($result);
            } else {
                $sched = Schedule::leftJoin('court_details', 'court_details.id', '=', 'schedules.court_detail_id')
                    ->leftJoin('service_requests', 'service_requests.schedule_id', '=', 'schedules.id')
                    ->leftJoin('courts', 'courts.id', '=', 'court_details.court_id')
                    ->where('schedules.court_detail_id', $input['court_id'])
                    ->where('schedules.date_time', 'LIKE', '%'.$input['date'].'%')
                    ->select('service_requests.*')
                    ->get();

                if (count($sched) > 0) {
                    $sV = array();

                    foreach ($sched as $sc) {
                        $sV[] = ServiceAssignees::leftJoin('associates', 'associates.id', '=', 'service_request_assignees.associate_id')
                            ->where('service_request_id', $sc['id'])
                            ->select('associates.*')
                            ->first();
                    }

                    $result = $sV;
                } else {
                    $result = array('0');
                }

                return response()->json($result);
            }
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
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
