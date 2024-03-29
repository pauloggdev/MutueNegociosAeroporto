<?php

namespace App\Http\Controllers;

use App\Events\EnvioPagamentoVendaOnline;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AppController extends Controller {

    use TraitFirebaseService;

    public function __construct()
    {
      //  dd(auth()->guard('empresa')->user());
    }


    public function logout(){
        Auth::guard('web')->logout();
        Auth::guard('empresa')->logout();

    }

    public function Home() {


//        $this->saveFirebase();

       // return view('manutencao');

        $this->logout();

    //     $USER_TIPO_EMPRESA = 2;
    //     $USER_TIPO_FUNCIONARIO = 3;
    //     $USER_TIPO_ADMIN = 1;
    //dd(auth()->user());


    //     if(Auth::guard('web')->check() && Auth::user()->tipo_user_id == $USER_TIPO_EMPRESA){
    //         return redirect("/empresa/home");
    //     }
    //     else if(Auth::guard('empresa')->check() && Auth::user()->tipo_user_id == $USER_TIPO_FUNCIONARIO){
    //         return redirect("/empresa/home");
    //     }
    //     else if(Auth::guard('web')->check() && Auth::user()->tipo_user_id == $USER_TIPO_ADMIN){
    //         return redirect("/home");
    //     }



        // if(Auth::guard('web')->check() && )
        // dd(Auth::user()->tipo_user_id);
        // dd(Auth::guard('web')->check());


        $data['licencas'] = DB::connection('mysql')->table('licencas')
        ->join('tipotaxa', 'tipotaxa.codigo', '=', 'licencas.tipo_taxa_id')
        ->get();
        broadcast(new EnvioPagamentoVendaOnline('some data'));
        return view('login', $data);
    }

}