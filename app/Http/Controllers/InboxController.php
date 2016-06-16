<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Http\Requests;

use App\Inbox;

class InboxController extends Controller
{
    public function index(){
        try {
            $input = \Request::only('associate_id');
			$messages = Inbox::leftJoin('associates as sender', 'message_inboxes.sender_associate_id', '=', 'sender.id')
                             ->leftJoin('associates as receiver', 'message_inboxes.receiver_associate_id', '=', 'receiver.id')
                             ->select('message_inboxes.*','receiver.fullname AS receiver_fullname','sender.fullname AS sender_fullname')
                             ->where('receiver_associate_id', $input['associate_id'])
                             ->orWhere('sender_associate_id', $input['associate_id'])
                             ->get();

			return response()->json($messages);
		} catch (\Exception $error) {
            dd($error);
			return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
		}
    }

    public function add(){
        try{
            $input = \Request::only('channel','message','receiver_associate_id','sender_associate_id');

            $insertedId = Inbox::insertGetId(
                                    array(
                                         'sender_associate_id'      => $input['sender_associate_id'],
                                         'receiver_associate_id'    => $input['receiver_associate_id'],
                                         'channel'                  => $input['channel'],
                                         'message'                  => $input['message']
                                        )
                                    );

            $result = Inbox::find($insertedId);
            return response()->json($result);
        } catch(\Exception $error){
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }
}
