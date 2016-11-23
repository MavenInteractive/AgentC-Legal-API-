<?php

namespace App\Http\Controllers;

use DB;

trait Notify
{
    public function createNofication($associate_id, $other_associate_id, $type)
    {
        $notifiction_type = array(
            'NotificationTypeBeenAddedFavourite'    => '1',
            'NotificationTypeAssignedTask'          => '2',
            'NotificationTypeCompletedRequest'      => '3',
            'NotificationTypeAssignorCancelRequest' => '4',
            'NotificationTypeOtherAcceptedRequest'  => '5',
            'NotificationTypeAcceptedRequest'       => '6',
            'NotificationTypeDeclinedRequest'       => '7',
            'NotificationTypeAssigneeCancelRequest' => '8',
        );

        DB::table('notifications')->insert(array(
            'associate_id'       => $associate_id,
            'other_associate_id' => $other_associate_id,
            'notification_type'  => $notifiction_type[$type]
        ));

        return;
    }
}
