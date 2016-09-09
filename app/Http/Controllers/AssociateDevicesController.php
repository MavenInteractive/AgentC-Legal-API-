<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\AssociateDevices;

class AssociateDevicesController extends Controller
{
    public function index()
    {
        try {
            $input = \Request::only('associate_id', 'device_token', 'device_model');
            $result = AssociateDevices::where('associate_id', $input['associate_id'])
                ->where('token', $input['device_token'])
                ->where('device', $input['device_model'])
                ->get();

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }
}
