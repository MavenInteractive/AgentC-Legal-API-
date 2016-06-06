<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;
use App\Service;
use App\Schedule;
use App\CourtDetails;
use App\Court;
use App\RequestType;
use App\ServiceAssignees;
use App\Associate;
use DB;

class ServiceController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('as_assignor', 'associate_id', 'status', 'offset', 'limit');
			$service = Service::where('assigned_associate_id', $input['associate_id'])
                              ->where('status', $input['status'])
                              ->skip($input['offset'])
                              ->take($input['limit'])
                              ->get();
            if(count($service) > 0){
                $schedule = Schedule::where('id', $service['0']->schedule_id)->get();
                $courtDetails = CourtDetails::where('id', $schedule['0']->court_detail_id)->get();
                $court = Court::where('id', $courtDetails['0']->court_id)->get();
                $requestType = RequestType::where('id', $schedule['0']->request_type_id)->get();

                $assignees = ServiceAssignees::where('service_request_id', $service['0']->id)->get();
                $assigneeIds = array();
                if(count($assignees)){
                    foreach ($assignees as $assignee) {
                        $assigneeIds[] = $assignee->associate_id;
                    }
                }

                $associate = Associate::where('id', $schedule['0']->associate_id)->get();

                /* service request */
                $result['id'] = $service['0']->id;
                $result['schedule_id'] = $service['0']->schedule_id;
                $result['status'] = $service['0']->status;
                $result['assigned_associate_id'] = $service['0']->assigned_associate_id;
                $result['insert_time'] = $service['0']->insert_time;
                $result['update_time'] = $service['0']->update_time;

                /* schedules */
                $result['court_detail_id'] = $schedule['0']->court_detail_id;
                $result['associate_id'] = $schedule['0']->associate_id;
                $result['date_time'] = $schedule['0']->date_time;
                $result['request_type_id'] = $schedule['0']->request_type_id;
                $result['notes'] = $schedule['0']->notes;

                /* court details */
                $result['type'] = $courtDetails['0']->type;
                $result['level'] = $courtDetails['0']->level;
                $result['court_id'] = $courtDetails['0']->court_id;

                /* court */
                $result['name'] = $court['0']->name;
                $result['latitude'] = $court['0']->latitude;
                $result['longitude'] = $court['0']->longitude;
                $result['address'] = $court['0']->address;

                /* request type */
                $result['request_type'] = $requestType['0']->name;
                $result['request_description'] = $requestType['0']->description;

                /* service request assignees */
                $result['assignees'] = $assigneeIds;

                /* associates */
                $result['fullname'] = $associate['0']->fullname;
                $result['photo'] = $associate['0']->photo;
                $result['law_firm'] = $associate['0']->law_firm;
            }
            else{
                $result = array('0');
            }
            
			return response()->json($result);
		} catch (\Exception $error) {
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }

    public function add(){
        try {
            $input = \Request::only('associate_id','court_detail_id','date_time','request_type_id','notes','assignees');

            $insertedId = Schedule::insertGetId(
                                    array(
                                         'associate_id'    => $input['associate_id'],
                                         'court_detail_id' => $input['court_detail_id'],
                                         'date_time'       => $input['date_time'],
                                         'request_type_id' => $input['request_type_id'],
                                         'notes'           => $input['notes']
                                        )
                                    );
            $serviceId = Service::insertGetId(
                            array(
                                'schedule_id' => $insertedId,
                                'status' => 0,
                                'assigned_associate_id' => 0
                            )
                        );
            $assigneesNumbers = explode( ',', $input['assignees']);

            foreach ($assigneesNumbers as $a) {
                $assigneesId = ServiceAssignees::insertGetId(
                    array(
                        'service_request_id' => $serviceId,
                        'associate_id'       => $a
                    )
                );
            }


            $service = Service::where('id',$serviceId)->first();

            $schedule = Schedule::where('id', $insertedId)->get();
            $courtDetails = CourtDetails::where('id', $schedule['0']->court_detail_id)->get();
            $court = Court::where('id', $courtDetails['0']->court_id)->get();
            $requestType = RequestType::where('id', $schedule['0']->request_type_id)->get();

            $assignees = ServiceAssignees::where('service_request_id', $serviceId)->get();
            $assigneeIds = array();
            if(count($assignees)){
                foreach ($assignees as $assignee) {
                    $assigneeIds[] = $assignee->associate_id;
                }
            }

            $associate = Associate::where('id', $schedule['0']->associate_id)->get();

            /* service request */
            $result['id'] = $service->id;
            $result['schedule_id'] = $service->schedule_id;
            $result['status'] = $service->status;
            $result['assigned_associate_id'] = $service->assigned_associate_id;
            $result['insert_time'] = $service->insert_time;
            $result['update_time'] = $service->update_time;

            /* schedules */
            $result['court_detail_id'] = $schedule['0']->court_detail_id;
            $result['associate_id'] = $schedule['0']->associate_id;
            $result['date_time'] = $schedule['0']->date_time;
            $result['request_type_id'] = $schedule['0']->request_type_id;
            $result['notes'] = $schedule['0']->notes;

            /* court details */
            $result['type'] = $courtDetails['0']->type;
            $result['level'] = $courtDetails['0']->level;
            $result['court_id'] = $courtDetails['0']->court_id;

            /* court */
            $result['name'] = $court['0']->name;
            $result['latitude'] = $court['0']->latitude;
            $result['longitude'] = $court['0']->longitude;
            $result['address'] = $court['0']->address;

            /* request type */
            $result['request_type'] = $requestType['0']->name;
            $result['request_description'] = $requestType['0']->description;

            /* service request assignees */
            $result['assignees'] = $assigneeIds;

            /* associates */
            $result['fullname'] = $associate['0']->fullname;
            $result['photo'] = $associate['0']->photo;
            $result['law_firm'] = $associate['0']->law_firm;

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function status(){
        try {
            $input = \Request::only('associate_id', 'service_request_id', 'operation');

            switch ($input['operation']) {
                case '1':
                    DB::table('service_requests')->where('id',$input['service_request_id'])
                           ->where('assigned_associate_id',$input['associate_id'])
                           ->update(['status' => '1']);
                    break;
                case '2':
                    DB::table('service_requests')->where('id',$input['service_request_id'])
                           ->where('assigned_associate_id',$input['associate_id'])
                           ->update(['status' => '2']);
                    break;
                case '3':
                    DB::table('service_requests')->where('id',$input['service_request_id'])
                           ->where('assigned_associate_id',$input['associate_id'])
                           ->update(['status' => '3']);
                    break;

            }
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function delete(){
        try {
            $input = \Request::only('as_assignor', 'associate_id', 'service_request_id');
            Service::where('id', $input['service_request_id'])->delete();

        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }
}
