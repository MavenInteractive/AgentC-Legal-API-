<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\Favorite;

class FavoriteController extends Controller
{
    use Notify;

    public function insert()
    {
        $input = \Request::only('associate_id', 'other_associate_id');

        $insertedId = Favorite::insertGetId([
            'associate_id'       => $input['associate_id'],
            'other_associate_id' => $input['other_associate_id'],
        ]);

        $this->createNofication($input['other_associate_id'], $input['associate_id'], 'NotificationTypeBeenAddedFavourite');

        $favorites = Favorite::select('other_associate_id')->where('associate_id', $input['associate_id'])->get();

        if (count($favorites)) {
            foreach ($favorites as $favorite) {
                $favoriteIds[] = $favorite->other_associate_id;
            }

            $result['favorites'] = $favoriteIds;
        } else {
            $result = null;
        }

        return response()->json($result);
    }

    public function destroy()
    {
        $input = \Request::only('associate_id', 'other_associate_id');

        $affectedRows = Favorite::where('associate_id', $input['associate_id'])
            ->where('other_associate_id', $input['other_associate_id'])
            ->delete();

        $favorites = Favorite::select('other_associate_id')->where('associate_id', $input['associate_id'])->get();

        if (count($favorites)) {
            foreach ($favorites as $favorite) {
                $favoriteIds[] = $favorite->other_associate_id;
            }

            $result['favorites'] = $favoriteIds;
        } else {
            $result = null;
        }

        return response()->json($result);
    }
}
