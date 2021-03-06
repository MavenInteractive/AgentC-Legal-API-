<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\Associate;
use App\Favorite;
use App\Court;
use App\AssociateLocation;
use Mail;
use Hash;
use DB;
use Authorizer;
use Auth;

class AssociateController extends Controller
{
    public function index()
    {
        try {
            $input = \Request::only('id', 'full');
            $result = Associate::where('id', $input['id'])->get();

            if ($input['full'] == 1 && count($result) > 0) {
                $favorites = Favorite::select('id')->where('associate_id', $input['id'])->get();

                if (count($favorites) > 0) {
                    foreach ($favorites as $favorite) {
                        $favoriteIds[] = $favorite->id;
                    }
                    $result['favorites'] = $favoriteIds;
                }
            }

            if (count($result) > 0) {
                return response()->json($result);
            } else {
                $result = array('0');

                return response()->json($result);
            }
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function submitAction()
    {
        try {
            $check = \Request::only('action');
            switch ($check['action']) {
                case 'create':
                    $input = \Request::only('email', 'username', 'password', 'fullname', 'phone', 'law_firm', 'position', 'city', 'law_society_ref_number', 'association_number', 'is_private', 'photo');

                    $existing = $this->userCheck($input['email'], $input['username']);

                    if ($existing == 'true') {
                        $insertedId = Associate::insertGetId(array(
                            'email'                  => $input['email'],
                            'username'               => $input['username'],
                            'password'               => \Hash::make($input['password']),
                            'fullname'               => $input['fullname'],
                            'phone'                  => $input['phone'],
                            'law_firm'               => $input['law_firm'],
                            'position'               => $input['position'],
                            'city'                   => $input['city'],
                            'law_society_ref_number' => $input['law_society_ref_number'],
                            'association_number'     => $input['association_number'],
                            'is_private'             => $input['is_private'],
                            'photo'                  => $input['photo'],
                        ));

                        $result = Associate::find($insertedId);

                        $this->sendRegisterEmail($input['email']);

                        return response()->json($result);
                    } else {
                        $result = array('message' => $existing);

                        return response()->json($result);
                    }
                    break;

                case 'edit':
                    $input = \Request::only('associate_id', 'email', 'username', 'password', 'fullname', 'phone', 'law_firm', 'position', 'city', 'law_society_ref_number', 'association_number', 'photo');

                    $associate = Associate::where('id', $input['associate_id'])->update([
                        'email'                  => $input['email'],
                        'username'               => $input['username'],
                        'fullname'               => $input['fullname'],
                        'phone'                  => $input['phone'],
                        'law_firm'               => $input['law_firm'],
                        'position'               => $input['position'],
                        'city'                   => $input['city'],
                        'photo'                  => $input['photo'],
                        'law_society_ref_number' => $input['law_society_ref_number'],
                        'association_number'     => $input['association_number'],
                    ]);

                    if (!empty($input['password'])) {
                        $associate = Associate::where('id', $input['associate_id'])->update([
                            'password' => \Hash::make($input['password']),
                        ]);
                    }

                    $result = Associate::findOrFail($input['associate_id']);

                    $favorites = Favorite::select('id')->where('associate_id', $input['associate_id'])->get();

                    if (count($favorites)) {
                        foreach ($favorites as $favorite) {
                            $favoriteIds[] = $favorite->id;
                        }

                        $result['favorites'] = $favoriteIds;
                    }

                    return response()->json($result);

                case 'public':
                    $input = \Request::only('associate_id', 'is_private');

                    $associate = Associate::where('id', $input['associate_id'])->update([
                        'is_private' => $input['is_private'],
                    ]);

                    $result = Associate::findOrFail($input['associate_id']);

                    $favorites = Favorite::select('id')->where('associate_id', $input['associate_id'])->get();

                    if (count($favorites)) {
                        foreach ($favorites as $favorite) {
                            $favoriteIds[] = $favorite->id;
                        }

                        $result['favorites'] = $favoriteIds;
                    }

                    return response()->json($result);

                case 'alert':
                    $input = \Request::only('associate_id', 'alert_settings');

                    $associate = Associate::where('id', $input['associate_id'])->update([
                        'alert_settings' => $input['alert_settings'],
                    ]);

                    $result = Associate::findOrFail($input['associate_id']);

                    $favorites = Favorite::select('id')->where('associate_id', $input['associate_id'])->get();

                    if (count($favorites)) {
                        foreach ($favorites as $favorite) {
                            $favoriteIds[] = $favorite->id;
                        }

                        $result['favorites'] = $favoriteIds;
                    }

                    return response()->json($result);

                case 'view':
                    $input = \Request::only('email', 'username', 'password', 'status');
                    $result = Associate::select('email', 'username', 'password', 'status')
                        ->where('email', $input['email'])
                        ->where('username', $input['username'])
                        ->where('password', $input['password'])
                        ->where('status', $input['status'])
                        ->get();

                    return response()->json($result);
            }
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function showAll()
    {
        try {
            $associates = Associate::all()->sortBy('fullname');

            foreach ($associates as $associate) {
                $latitude  = 0;
                $longitude = 0;
                $distance  = 0;
                $court_id  = 0;

                $location = AssociateLocation::where('associate_id', $associate['id'])->orderBy('date_time', 'desc')->first();

                if ($location == null) {
                    $latitude  = 0;
                    $longitude = 0;
                    $distance  = 0;
                    $court_id  = 0;
                } else {
                    $court     = Court::where('id', $location['court_id'])->first();
                    $latitude  = $court['latitude'];
                    $longitude = $court['longitude'];
                    $distance  = $location['distance'];
                    $court_id  = $location['court_id'];
                }

                $result[] = array(
                    'id'                     => $associate['id'],
                    'username'               => $associate['username'],
                    'password'               => $associate['password'],
                    'fullname'               => $associate['fullname'],
                    'email'                  => $associate['email'],
                    'phone'                  => $associate['phone'],
                    'photo'                  => $associate['photo'],
                    'law_firm'               => $associate['law_firm'],
                    'position'               => $associate['position'],
                    'city'                   => $associate['city'],
                    'law_society_ref_number' => $associate['law_society_ref_number'],
                    'association_number'     => $associate['association_number'],
                    'is_private'             => $associate['is_private'],
                    'status'                 => $associate['status'],
                    'alert_settings'         => $associate['alert_settings'],
                    'updated_at'             => $associate['updated_at'],
                    'insert_time'            => $associate['insert_time'],
                    'latitude'               => $latitude,
                    'longitude'              => $longitude,
                    'distance'               => $distance,
                    'court_id'               => $court_id,
                );
            }

            return response()->json($result);
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function forgot()
    {
        try {
            $input = \Request::only('email');

            $associate = Associate::where('email', $input['email'])->first();

            if(count($associate)){
                $this->sendForgotPasswordEmail($input['email']);
                return response()->json(['success' => 'password_sent_to_email']);
            } else {
                return response()->json(['error' => 'email_not_found']);
            }
        } catch (\Exception $error) {
            return response()->json(['error' => 'bad_request'], Response::HTTP_BAD_REQUEST);
        }
    }

    public function sendForgotPasswordEmail($email)
    {
        $associate      = Associate::where('email', $email)->first();
        $newPassword    = str_random(8);
        $hashedPassword = Hash::make($newPassword);

        DB::table('associates')->where('id', $associate->id)->update(['password' => $hashedPassword]);

        Mail::send('emails.forgot_password', array('fullname' => $associate->fullname, 'password' => $newPassword, 'username' => $associate->username), function ($message) use ($associate) {
            $message->to($associate->email, $associate->fullname)->subject('Forgot Password');
        });

        return;
    }

    public function sendRegisterEmail($email)
    {
        $associate = Associate::where('email', $email)->first();

        Mail::send('emails.register', array('fullname' => $associate->fullname), function ($message) use ($associate) {
            $message->to($associate->email, $associate->fullname)->subject('Welcome to AgentC Legal');
        });

        return;
    }

    public function userCheck($email, $username)
    {
        $associate = Associate::where('email', '=', $email)->get();

        if (count($associate) > 0) {
            return 'Someone has already used the same email. ';
        }

        $associate = Associate::where('username', '=', $username)->get();

        if (count($associate) > 0) {
            return 'Someone has already used the same username.';
        }

        return true;
    }

    public function loginAssociate()
    {
        $response = Authorizer::issueAccessToken();

        if (Auth::user()) {
            $response['user_id']  = Auth::user()->id;
            $response['username'] = Auth::user()->username;
            $response['fullname'] = Auth::user()->fullname;
            $response['email']    = Auth::user()->email;
            $response['phone']    = Auth::user()->phone;
            $response['photo']    = Auth::user()->photo;
            $response['law_firm'] = Auth::user()->law_firm;
            $response['position'] = Auth::user()->position;
            $response['city']     = Auth::user()->city;

            $favorites = Favorite::select('other_associate_id')->where('associate_id', $response['user_id'])->get();

            if (count($favorites)) {
                foreach ($favorites as $favorite) {
                    $favoriteIds[] = $favorite->other_associate_id;
                }

                $response['favorites'] = $favoriteIds;
            }

            return response()->json($response);
        }

        return response()->json($response);
    }
}
