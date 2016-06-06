<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;
use App\AssociateLocation;
use App\Notification;
use App\Inbox;
use DB;

class PingController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('associate_id','latitude','longitude','timestamps');

            $associateId = $input['associate_id'];
            $timestamps = $input['timestamps'];
            if($timestamps) {
                $locationTimestamp = $timestamps['location_timestamp'];
            }

            if(isset($input['latitude']) && isset($input['longitude']) && $locationTimestamp) {
                $latitude = $input['latitude'];
                $longitude = $input['longitude'];
                $this->updateAssociateLocations($associateId, $latitude, $longitude, $locationTimestamp);
            }

            $result = $this->getUpdates($associateId, $timestamps);
            return response()->json($result);

		} catch (\Exception $error) {
            dd($error);
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }

    public function updateAssociateLocations($associateId, $latitude, $longitude, $timestamp){
        $hash = array('associate_id' => $associateId);
        $associateLocations = AssociateLocation::where($hash);

        $nearestCourts = $this->getNearbyCourts($latitude, $longitude, 1);
        if(count($nearestCourts) > 0) {
            foreach($nearestCourts as $nearestCourt) {
                $associateLocationId = 0;
                if(count($associateLocations) > 0) {
                    $index = $this->getAssociateLocationIndexByCourtId($nearestCourt->id, $associateLocations);
                    if($index > -1) {
                        $associateLocationId = $associateLocations[$index]['id'];
                        unset($associateLocations[$index]);
                    }
                }
                $hash['court_id'] = $nearestCourt->id;
                $hash['distance'] = $nearestCourt->distance;
                $hash['date_time'] = $timestamp;
                if($associateLocationId > 0) {
                    $this->_tblAssociateLocation->updateRecord($associateLocationId, $hash);

                    DB::table('associate_location')->where('id',$associateLocationId)
                           ->update($hash);
                }
                else {
                    $insertedId = AssociateLocation::insertGetId($hash);
                }

                if(count($associateLocations) > 0) {
                    foreach($associateLocations as $associateLocation) {
                        AssociateLocation::where('id', $associateLocation['id'])->delete();
                    }
                }
            }
        }

    }

    public function getUpdates($associateId, $timestamps){
        $requestsTimestamp = $timestamps['requests_timestamp'];
        $notificationsTimestamp = $timestamps['notifications_timestamp'];
        $messagesTimestamp = $timestamps['messages_timestamp'];

        $newRequests = DB::table('service_requests')
                        ->leftJoin('schedules', 'service_requests.schedule_id', '=', 'schedules.id')
                        ->where('schedules.associate_id',$associateId)
                        //->leftJoin('service_request_assignees', 'service_requests.id', '=', 'service_request_assignees.service_request_id')
                        // ->where(function($query) use ($associateId){
                        //      $query->where('service_requests.assigned_associate_id',$associateId)
                        //      ->orWhere('schedules.associate_id',$associateId)
                        //  })
                        ->where('service_requests.update_time','>=',  $requestsTimestamp)->get();

        $newNotifications = Notification::where('associate_id',$associateId)->where('insert_time','>=', $notificationsTimestamp)->get();


        $newMessages = Inbox::where(function($query) use ($associateId){
                                  $query->where('sender_associate_id',$associateId)
                                  ->orWhere('receiver_associate_id',$associateId);
                              })
                              ->where('update_time','>=', $messagesTimestamp)
                              ->get();

        return array('new_requests' => $newRequests,
                    'new_notifications' => $newNotifications,
                    'new_messages' => $newMessages);
    }

    public function getAssociateLocationIndexByCourtId($courtId, $associateLocations) {
        foreach($associateLocations as $index => $associateLocation) {
            if($associateLocation['court_id'] == $courtId) {
                return $index;
            }
        }
        return -1;
    }

    public function getNearbyCourts($latitude, $longitude, $radius = 1.0, $distanceUnit = 111.045){
        $query = "
 SELECT id, name, address,
       latitude, longitude, distance
  FROM (
 SELECT c.id,
 		c.name,
        c.address,
        c.latitude, c.longitude,
        p.radius,
        p.distance_unit
                 * DEGREES(ACOS(COS(RADIANS(p.latpoint))
                 * COS(RADIANS(c.latitude))
                 * COS(RADIANS(p.longpoint - c.longitude))
                 + SIN(RADIANS(p.latpoint))
                 * SIN(RADIANS(c.latitude)))) AS distance
  FROM courts AS c
  JOIN (
        SELECT  " . $latitude . "  AS latpoint,  ". $longitude . " AS longpoint,
                " . $radius  . " AS radius,  " . $distanceUnit . " AS distance_unit
    ) AS p ON 1=1
  WHERE c.latitude
     BETWEEN p.latpoint  - (p.radius / p.distance_unit)
         AND p.latpoint  + (p.radius / p.distance_unit)
    AND c.longitude
     BETWEEN p.longpoint - (p.radius / (p.distance_unit * COS(RADIANS(p.latpoint))))
         AND p.longpoint + (p.radius / (p.distance_unit * COS(RADIANS(p.latpoint))))
 ) AS d
 WHERE distance <= radius
 ORDER BY distance
 LIMIT 15";

        $nearestLocations = DB::select(DB::raw($query));

        return $nearestLocations;
    }


}
