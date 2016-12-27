<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\Notification;

use DB;

class NotificationController extends Controller
{
    public function index()
    {
        try {
            $input = \Request::only('associate_id', 'offset', 'limit');
            $result = Notification::where('associate_id', $input['associate_id'])
                ->where('notifications.other_associate_id', '>', '0')
                ->leftJoin('associates', 'notifications.associate_id', '=', 'associates.id')
                ->leftJoin('associates AS other', 'notifications.other_associate_id', '=', 'other.id')
                ->select('notifications.*', 'associates.fullname', 'other.fullname AS other_associate')
                ->skip($input['offset'])
                ->take($input['limit'])
                ->orderBy('insert_time','DESC')
                ->get();

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function read($id){
        try{

            $result = DB::table('notifications')
                ->where('id', $id)
                ->update([
                    'read_at' => date('Y-m-d h:i:sa')
                ]);

            return response()->json($result);

        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }
}
