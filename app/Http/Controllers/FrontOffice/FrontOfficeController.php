<?php

namespace App\Http\Controllers\FrontOffice;

use App\Http\Controllers\Controller;
use App\Jobs\JobMensagemContacto;
use App\Mail\MensagemContacto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class FrontOfficeController extends Controller
{

    public function sobre()
    {
        return view('frontOffice.sobre');
    }
    public function servicos()
    {
        return view('frontOffice.servicos');
    }
    public function contactos()
    {
        return view('frontOffice.contactos');
    }
    public function enviarMensagem(Request $request)
    {
        $mensagem = [
            'nome.required' => "campo nome é obrigatório",
            'email.required' => "campo email é obrigatório",
            'assunto.required' => "campo assunto é obrigatório",
            'mensagem.required' => "campo mensagem é obrigatório"
        ];
        $this->validate($request, [
            'nome' => ['required'],
            'email' => ['required'],
            'assunto' => ['required'],
            'mensagem' => ['required']
        ], $mensagem);

        try {
            Mail::send(new MensagemContacto($request->all()));
        } catch (\Throwable $th) {
            //throw $th;
        }




        // JobMensagemContacto::dispatch($request->all())->delay(now()->addSecond('5'));
        return back()->withSuccess('E-mail enviado, em breve responderemos a sua mensagem');
    }
}
