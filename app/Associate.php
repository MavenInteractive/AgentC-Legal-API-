<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Associate extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'associates';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'email', 'username', 'password', 'fullname', 'phone', 'law_firm', 'position', 'city', 'law_society_ref_number', 'association_number', 'is_private', 'photo', 'status', 'alert_settings', 'insert_time'
    ];

}
