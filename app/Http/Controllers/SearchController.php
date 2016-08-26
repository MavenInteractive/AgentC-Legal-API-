<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\Court;
use App\Associate;

class SearchController extends Controller
{
    public function index()
    {
        try {
            $input = \Request::only('entity', 'query');
            $result = '';

            if ($input['entity'] == 'courts') {
                $result = Court::where('name', 'LIKE', '%'.$input['query'].'%')
                    ->orWhere('address', 'LIKE', '%'.$input['query'].'%')
                    ->get();
            } elseif ($input['entity'] == 'associates') {
                $result = Associate::where('fullname', 'LIKE', '%'.$input['query'].'%')
                    ->orWhere('email', 'LIKE', '%'.$input['query'].'%')
                    ->orWhere('phone', 'LIKE', '%'.$input['query'].'%')
                    ->orWhere('law_firm', 'LIKE', '%'.$input['query'].'%')
                    ->orWhere('position', 'LIKE', '%'.$input['query'].'%')
                    ->orWhere('city', 'LIKE', '%'.$input['query'].'%')
                    ->orWhere('law_society_ref_number', 'LIKE', '%'.$input['query'].'%')
                    ->orWhere('association_number', 'LIKE', '%'.$input['query'].'%')
                    ->get();
            }

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }
}
