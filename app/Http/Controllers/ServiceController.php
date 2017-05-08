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
    use Notify;

    public function index()
    {
        try {
            $input = \Request::only('as_assignor', 'associate_id', 'status', 'offset', 'limit');

            if ($input['as_assignor'] == 1) {
                $service_requests = DB::table('service_requests')
                    ->leftJoin('schedules', 'service_requests.schedule_id', '=', 'schedules.id')
                    ->leftJoin('court_details', 'court_details.id', '=', 'schedules.court_detail_id')
                    ->leftJoin('courts', 'courts.id', '=', 'court_details.court_id')
                    ->leftJoin('request_types', 'request_types.id', '=', 'schedules.request_type_id')
                    ->leftJoin('associates', 'associates.id', '=', 'schedules.associate_id')
                    ->where('service_requests.assigned_associate_id', $input['associate_id'])
                    ->where('service_requests.status', $input['status'])
                    ->skip($input['offset'])
                    ->take($input['limit'])
                    ->select('service_requests.*', 'schedules.court_detail_id', 'schedules.associate_id', 'schedules.date_time', 'schedules.request_type_id', 'schedules.notes', 'court_details.type', 'court_details.level', 'court_details.court_id', 'courts.name', 'courts.latitude', 'courts.longitude', 'courts.address', 'request_types.name AS request_type', 'request_types.description AS request_description', 'associates.fullname', 'associates.photo', 'associates.law_firm')
                    ->get();

                if (count($service_requests) > 0) {
                    $result = array();

                    foreach ($service_requests as $request) {
                        $assignees   = ServiceAssignees::where('service_request_id', $request->id)->get();
                        $assigneeIds = array();

                        if (count($assignees)) {
                            foreach ($assignees as $assignee) {
                                $associateData = Associate::where('id', $assignee->associate_id)->first();

                                if (count($associateData)) {
                                    $assigneeIds[] = array('id' => $assignee->associate_id, 'fullname' => $associateData->fullname);
                                }
                            }
                        }

                        /* service request */
                        $sr['id']                    = $request->id;
                        $sr['schedule_id']           = $request->schedule_id;
                        $sr['status']                = $request->status;
                        $sr['assigned_associate_id'] = $request->assigned_associate_id;
                        $sr['insert_time']           = $request->insert_time;
                        $sr['update_time']           = $request->update_time;

                        /* schedules */
                        $sr['court_detail_id'] = $request->court_detail_id;
                        $sr['associate_id']    = $request->associate_id;
                        $sr['date_time']       = $request->date_time;
                        $sr['request_type_id'] = $request->request_type_id;
                        $sr['notes']           = $request->notes;

                        /* court details */
                        $sr['type']     = $request->type;
                        $sr['level']    = $request->level;
                        $sr['court_id'] = $request->court_id;

                        /* court */
                        $sr['name']      = $request->name;
                        $sr['latitude']  = $request->latitude;
                        $sr['longitude'] = $request->longitude;
                        $sr['address']   = $request->address;

                        /* request type */
                        $sr['request_type']        = $request->request_type;
                        $sr['request_description'] = $request->request_description;

                        /* service request assignees */
                        $sr['assignees'] = $assigneeIds;

                        /* associates */
                        $sr['fullname'] = $request->fullname;
                        $sr['photo']    = $request->photo;
                        $sr['law_firm'] = $request->law_firm;

                        $result[] = $sr;
                    }
                } else {
                    $result = array('0');
                }
            } else {
                $service_requests = DB::table('service_request_assignees')
                    ->leftJoin('service_requests', 'service_request_assignees.service_request_id', '=', 'service_requests.id')
                    ->leftJoin('schedules', 'service_requests.schedule_id', '=', 'schedules.id')
                    ->leftJoin('court_details', 'court_details.id', '=', 'schedules.court_detail_id')
                    ->leftJoin('courts', 'courts.id', '=', 'court_details.court_id')
                    ->leftJoin('request_types', 'request_types.id', '=', 'schedules.request_type_id')
                    ->leftJoin('associates', 'associates.id', '=', 'service_requests.assigned_associate_id')
                    ->where('service_request_assignees.associate_id', $input['associate_id'])
                    ->where('service_requests.status', $input['status'])
                    ->skip($input['offset'])
                    ->take($input['limit'])
                    ->select('service_requests.*', 'schedules.court_detail_id', 'service_request_assignees.associate_id', 'schedules.date_time', 'schedules.request_type_id', 'schedules.notes', 'court_details.type', 'court_details.level', 'court_details.court_id', 'courts.name', 'courts.latitude', 'courts.longitude', 'courts.address', 'request_types.name AS request_type', 'request_types.description AS request_description', 'associates.fullname', 'associates.photo', 'associates.law_firm')
                    ->get();

                if (count($service_requests) > 0) {
                    $result = array();

                    foreach ($service_requests as $request) {
                        $assignees   = ServiceAssignees::where('service_request_id', $request->id)->get();
                        $assigneeIds = array();

                        if (count($assignees)) {
                            foreach ($assignees as $assignee) {
                                $associateData = Associate::where('id', $assignee->associate_id)->first();

                                if (count($associateData)) {
                                    $assigneeIds[] = array('id' => $assignee->associate_id, 'fullname' => $associateData->fullname);
                                }
                            }
                        }

                        /* service request */
                        $sr['id']                    = $request->id;
                        $sr['schedule_id']           = $request->schedule_id;
                        $sr['status']                = $request->status;
                        $sr['assigned_associate_id'] = $request->assigned_associate_id;
                        $sr['insert_time']           = $request->insert_time;
                        $sr['update_time']           = $request->update_time;

                        /* schedules */
                        $sr['court_detail_id'] = $request->court_detail_id;
                        $sr['associate_id']    = $request->associate_id;
                        $sr['date_time']       = $request->date_time;
                        $sr['request_type_id'] = $request->request_type_id;
                        $sr['notes']           = $request->notes;

                        /* court details */
                        $sr['type']     = $request->type;
                        $sr['level']    = $request->level;
                        $sr['court_id'] = $request->court_id;

                        /* court */
                        $sr['name']      = $request->name;
                        $sr['latitude']  = $request->latitude;
                        $sr['longitude'] = $request->longitude;
                        $sr['address']   = $request->address;

                        /* request type */
                        $sr['request_type']        = $request->request_type;
                        $sr['request_description'] = $request->request_description;

                        /* service request assignees */
                        $sr['assignees'] = $assigneeIds;

                        /* associates */
                        $sr['fullname'] = $request->fullname;
                        $sr['photo']    = $request->photo;
                        $sr['law_firm'] = $request->law_firm;

                        $result[] = $sr;
                    }
                } else {
                    $result = array('0');
                }
            }

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function add()
    {
        try {
            $input = \Request::only('associate_id', 'court_detail_id', 'date_time', 'request_type_id', 'notes', 'assignees');

            $insertedId = Schedule::insertGetId(array(
                'associate_id'    => $input['assignees'],
                'court_detail_id' => $input['court_detail_id'],
                'date_time'       => $input['date_time'],
                'request_type_id' => $input['request_type_id'],
                'notes'           => $input['notes'],
            ));

            $serviceId = Service::insertGetId(array(
                'schedule_id'           => $insertedId,
                'status'                => 0,
                'assigned_associate_id' => $input['associate_id'],
            ));

            $assigneesNumbers = explode(',', $input['assignees']);

            foreach ($assigneesNumbers as $a) {
                $assigneesId = ServiceAssignees::insertGetId(array(
                    'service_request_id' => $serviceId,
                    'associate_id'       => $a,
                ));

                $this->createNofication($a, $input['associate_id'], 'NotificationTypeAssignedTask');

                //$this->sendStatusEmail($input['associate_id'], $a, $type);
            }

            $service_requests = DB::table('service_requests')
                ->leftJoin('schedules', 'service_requests.schedule_id', '=', 'schedules.id')
                ->leftJoin('court_details', 'court_details.id', '=', 'schedules.court_detail_id')
                ->leftJoin('courts', 'courts.id', '=', 'court_details.court_id')
                ->leftJoin('request_types', 'request_types.id', '=', 'schedules.request_type_id')
                ->leftJoin('associates', 'associates.id', '=', 'schedules.associate_id')
                ->where('schedules.id', $insertedId)
                ->select('service_requests.*', 'schedules.court_detail_id', 'schedules.associate_id', 'schedules.date_time', 'schedules.request_type_id', 'schedules.notes', 'court_details.type', 'court_details.level', 'court_details.court_id', 'courts.name', 'courts.latitude', 'courts.longitude', 'courts.address', 'request_types.name AS request_type', 'request_types.description AS request_description', 'associates.fullname', 'associates.photo', 'associates.law_firm')
                ->get();

            if(count($service_requests) > 0){
                $result = array();
                foreach ($service_requests as $request) {
                    $assignees   = ServiceAssignees::where('service_request_id', $request->id)->get();
                    $assigneeIds = array();

                    if (count($assignees)) {
                        foreach ($assignees as $assignee) {
                            $assigneeIds[] = $assignee->associate_id;
                        }
                    }

                    /* service request */
                    $sr['id']                    = $request->id;
                    $sr['schedule_id']           = $request->schedule_id;
                    $sr['status']                = $request->status;
                    $sr['assigned_associate_id'] = $request->assigned_associate_id;
                    $sr['insert_time']           = $request->insert_time;
                    $sr['update_time']           = $request->update_time;

                    /* schedules */
                    $sr['court_detail_id'] = $request->court_detail_id;
                    $sr['associate_id']    = $request->associate_id;
                    $sr['date_time']       = $request->date_time;
                    $sr['request_type_id'] = $request->request_type_id;
                    $sr['notes']           = $request->notes;

                    /* court details */
                    $sr['type']     = $request->type;
                    $sr['level']    = $request->level;
                    $sr['court_id'] = $request->court_id;

                    /* court */
                    $sr['name']      = $request->name;
                    $sr['latitude']  = $request->latitude;
                    $sr['longitude'] = $request->longitude;
                    $sr['address']   = $request->address;

                    /* request type */
                    $sr['request_type']        = $request->request_type;
                    $sr['request_description'] = $request->request_description;

                    /* service request assignees */
                    $sr['assignees'] = $assigneeIds;

                    /* associates */
                    $sr['fullname'] = $request->fullname;
                    $sr['photo']    = $request->photo;
                    $sr['law_firm'] = $request->law_firm;

                    $result[] = $sr;
                }
            } else {
                $result = array('0');
            }

            return response()->json($result);
        } catch (\Exception $error) {
            dd($error);
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function status()
    {
        try {
            $input = \Request::only('associate_id', 'service_request_id', 'operation','date_time');

            switch ($input['operation']) {
                case '1':
                    DB::table('service_requests')
                        ->where('id', $input['service_request_id'])
                        ->update(['status' => '1']);

                        $request = DB::table('service_requests')->where('service_requests.id', $input['service_request_id'])                      ->leftJoin('service_request_assignees','service_request_assignees.service_request_id','=','service_requests.id')
                        ->select('service_requests.*','service_request_assignees.associate_id AS assignee_id')->first();


                    $this->createNofication($request->assigned_associate_id, $input['associate_id'], 'NotificationTypeAcceptedRequest');
                    return response()->json($request);

                    break;
                case '2':
                    DB::table('service_requests')
                        ->where('id', $input['service_request_id'])
                        ->update(['status' => '2']);

                        $request = DB::table('service_requests')->where('service_requests.id', $input['service_request_id'])                      ->leftJoin('service_request_assignees','service_request_assignees.service_request_id','=','service_requests.id')
                        ->select('service_requests.*','service_request_assignees.associate_id AS assignee_id')->first();

                        $this->createNofication($request->assigned_associate_id, $input['associate_id'], 'NotificationTypeCompletedRequest');
                        return response()->json(array('1'));
                    break;
                case '3':
                    DB::table('service_requests')
                        ->where('id', $input['service_request_id'])
                        ->update(['status' => '3']);

                        $request = DB::table('service_requests')->where('service_requests.id', $input['service_request_id'])                      ->leftJoin('service_request_assignees','service_request_assignees.service_request_id','=','service_requests.id')
                        ->select('service_requests.*','service_request_assignees.associate_id AS assignee_id')->first();

                        $this->createNofication($request->assigned_associate_id, $input['associate_id'], 'NotificationTypeDeclinedRequest');
                        return response()->json(array('1'));
                    break;

            }
        } catch (\Exception $error) {
            dd($error);
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function delete()
    {
        try {
            $input = \Request::only('as_assignor', 'associate_id', 'service_request_id');
            Service::where('id', $input['service_request_id'])->delete();

            $this->createNofication($input['associate_id'], 0, 'NotificationTypeAssignorCancelRequest');

        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function getCompletedRequests(){
        try{
            $input = \Request::only('associate_id');

            $service_requests = DB::table('service_requests')
                                ->where('assigned_associate_id', $input['associate_id'])
                                ->where('status', '2')
                                ->get();

            return count($service_requests);


        } catch (\Exception $error){
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }

    }


    public function getNearbyAssociates(){
        try {
            $input = \Request::only('associate_id','court_id','date');

            $dateInput = $input['date'];
            $createDate = new DateTime($dateInput);
            $strip = $createDate->format('Y-m-d');

            if (date('Y-m-d') == $strip) {
                $date = new \DateTime;
                $date->modify('-1 hour');
                $formatted_date = $date->format('Y-m-d H:i:s');
                $result = AssociateLocation::leftJoin('associates', 'associates.id', '=', 'associate_location.associate_id')
                    ->where('court_id', $input['court_id'])
                //    ->where('date_time', 'LIKE', '%'.date('Y-m-d', strtotime($input['date'])).'%')
                //    ->where('insert_time','>=',$formatted_date)
                    ->groupBy('associate_location.associate_id')
                    ->select('associates.*')
                    ->get();

                return response()->json($result);
            } else {
                $result = array(0);
                return response()->json($result);
            }

        } catch (Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }

    }

    // public function sendStatusEmail($sender_id, $reciever_id, $type){
    //
    //     $sender = Associate::where('id', $sender_id)->first();
    //     $reciever = Associate::where('id', $reciever_id)->first();
    //
    //
    //     switch ($type) {
    //         case '1':
    //             $msg = $sender->fullname . " has sent you a service request";
    //             break;
    //
    //         case '2':
    //             $msg = $associate->fullname . " has accepted the service request you assign to him/her";
    //             break;
    //
    //         case '3':
    //             $msg = $associate->fullname . " has declined your service request";
    //             break;
    //
    //         case '4':
    //             $msg = $associate->fullname . " has completed the service request to him/her";
    //             break;
    //     }
    //
    //
    //
    //
    //     Mail::send('emails.register', array('message' => $msg ), function($message) use ($reciever){
    //         $message->to($associate->email, $associate->fullname)->subject('Notification');
    //     });
    //
    //     return;
    // }
}
