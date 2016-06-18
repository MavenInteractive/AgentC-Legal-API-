<?php

namespace App\Http\Controllers;
use DB;

trait Notify{

    public function createNofication($associate_id, $other_associate_id, $type){

        $notifiction_type = array(
            'associate_added'  => '1',
            'service_request_assigned' => '2',
            'service_request_declined' => '3',
            'service_request_completed' => '4',
            'service_request_accepted' => '5'
        );


        DB::table('notifications')->insert(
            array(
                'associate_id' => $associate_id,
	            'other_associate_id' => $other_associate_id,
	            'notification_type' => $notifiction_type[$type]
            )
        );

        return;
    }

}
