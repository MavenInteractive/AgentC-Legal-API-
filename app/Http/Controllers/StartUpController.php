<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\Court;
use App\Associate;
use App\RequestType;

class StartUpController extends Controller
{
    public function index()
    {
        try {
            $courts     = Court::get();
            $associates = Associate::get();
            $requests   = RequestType::get();

            foreach ($courts as $court) {
                $courtNames[] = $court;
            }

            foreach ($associates as $associate) {
                $associateNames[] = $associate;
            }

            foreach ($requests as $request) {
                $requestNames[] = $request;
            }

            $result['courts']        = $courtNames;
            $result['associates']    = $associateNames;
            $result['request_types'] = $requestNames;

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }
}
