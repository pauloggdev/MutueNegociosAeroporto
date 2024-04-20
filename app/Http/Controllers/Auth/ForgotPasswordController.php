<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Foundation\Auth\sSendsPasswordResetEmails;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Password;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;


    /*
    Metodo subscrito
    */
    public function broker($params =  null)
    {
        $params = $params ? $params : "";
        return Password::broker($params);
    }

    /*
    Metodo subscrito
    */
    public function sendResetLinkEmail(Request $request)
    {

        $this->validateEmail($request);
        $connection2 = DB::connection('mysql2')->table("users_cliente")->where("email", $request->get("email"))->first();
        if ($connection2) {
            $response = $this->broker('empresas')->sendResetLink($this->credentials($request));
        }

        if (!$connection2) {
            $response = $this->broker()->sendResetLink($this->credentials($request));
        }
        // We will send the password reset link to this user. Once we have attempted
        // to send the link, we will examine the response then see the message we
        // need to show to the user. Finally, we'll send out a proper response.

        //return $this->sendResetLinkResponse($request, 'Acessa o email para redefinir a senha');


        $response == Password::RESET_LINK_SENT
            ? $this->sendResetLinkResponse($request, $response)
            : $this->sendResetLinkFailedResponse($request, $response);

        switch ($response) {
            case Password::RESET_LINK_SENT:
                return back()->with('status', trans($response)); // Redireciona de volta com uma mensagem de sucesso
            case Password::INVALID_USER:
                return back()->withErrors(['email' => trans($response)]); // Redireciona de volta com mensagem de erro
            case Password::RESET_THROTTLED:
                return back()->withErrors(['email' => trans('auth.throttle')]); // Redireciona de volta com mensagem de erro personalizada
            default:
                return back()->withErrors(['email' => trans($response)]); // Redireciona de volta com mensagem de erro
        }
    }
    protected function validateEmail(Request $request)
    {
        $request->validate(
            [
                'email' => ['required', function ($attr, $email, $fail) use ($request) {
                    $connection2 = DB::connection('mysql2')->table("users_cliente")->where("email", $request->get("email"))->first();
                    if (!$connection2) {
                        $fail('E-mail não encontrado');
                    }
                }]
            ]
        );
    }
}
