<?php

namespace App\OAuth2\Verifier;

use Illuminate\Support\Facades\Auth;

class PasswordGrantVerifier
{
  public function verify($username, $password)
  {
      $credentials = [
        'username'    => $username,
        'password' => $password,
      ];

      if (Auth::attempt($credentials)) {
          return Auth::user()->id;
      }

      return false;
  }
}
