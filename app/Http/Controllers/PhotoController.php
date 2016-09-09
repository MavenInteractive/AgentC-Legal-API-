<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use App\Associates;
use Image;

class PhotoController extends Controller
{
    public function upload()
    {
        $input = \Request::only('associate_id', 'filedata');

        if ($input['filedata']) {
            $image = $input['filedata'];
            $filename = time().'.'.$image->getClientOriginalExtension();

            $path = public_path('photos/'.$filename);

            $imageUploaded = Image::make($image->getRealPath())->resize(200, 200)->save($path);

            $result = array(
               'associate_id' => $input['associate_id'],
               'photo_url'    => url('/photos').'/'.$filename,
           );

            return response()->json($result);
        }
    }
}
