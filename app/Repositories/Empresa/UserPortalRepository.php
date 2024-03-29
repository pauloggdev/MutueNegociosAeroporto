<?php

namespace App\Repositories\Empresa;

use App\Models\empresa\Cliente;
use App\Models\empresa\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserPortalRepository
{

    protected $user;
    protected $cliente;


    public function __construct(User $user, Cliente $cliente)
    {
        $this->user = $user;
        $this->cliente = $cliente;
    }

    public function quantidadeUsers()
    {
        return $this->user::where('tipo_user_id', 4)
            ->where('empresa_id', auth()->user()->empresa_id)->count();
    }

    public function createValidacaoUser(Request $request)
    {
        if (isset($request['foto']) && !empty($request['foto'])) {
            $foto = $request->foto->store('/utilizadores/cliente/');
        } else {
            $foto = 'utilizadores/cliente/avatarEmpresa.png';
        }
        $userId = DB::connection('mysql2')->table('users_cliente_validacao')->insertGetId(
            [
                'name' => $request['name'],
                'uuid' => Str::uuid(),
                'username' => $request['name'],
                'password' => Hash::make($request['password1']),
                'codigo' => $request['codigo'],
                'status_id' => 1,
                'telefone' => $request['telefone'],
                'email' => $request['email'],
                'foto' => $foto,
                'status_senha_id' => 2,
                'used' => 'N'
            ]
        );
        return $userId;
    }
    public function createNewUserMobile($request){

        try {

            DB::beginTransaction();

            $user = $this->user->create([
                'uuid' => Str::uuid(),
                'name' => $request['name'],
                'username' => $request['name'],
                'email' => $request['email'],
                'telefone' => null,
                'password' => null,
                'tipo_user_id' => 4,
                'status_id' => 1,
                'status_senha_id' => 2,
                'canal_id' => 4,
                'foto' => null
            ]);

            $cliente = $this->cliente->create([
                'uuid' =>  Str::uuid(),
                'nome' => $request['name'],
                'pessoa_contacto' => $request['name'],
                'email' => $request['email'],
                'conta_corrente' => $this->contaCorrente(),
                'telefone_cliente' => null,
                'taxa_de_desconto' => 100,
                'limite_de_credito' => 100000000000000000000,
                'endereco' => null,
                'canal_id' => 4,
                'status_id' => 1,
                'nif' => null,
                'operador' => $user->name,
                'tipo_cliente_id' => 6,
                'user_id' => $user->id,
                'pais_id' => 1,
                'empresa_id' => 148,
                'cidade' => null,
            ]);
            DB::commit();
            return $user;
        } catch (\Throwable $th) {
            DB::rollBack();
        }
    }

    public function createNewUser($request)
    {

        try {
            DB::beginTransaction();
            $user = $this->user->create([
                'uuid' => $request['uuid'],
                'name' => $request['name'],
                'username' => $request['name'],
                'email' => $request['email'],
                'telefone' => $request['telefone'],
                'password' => $request['password'],
                'tipo_user_id' => 4,
                'status_id' => 1,
                'status_senha_id' => 2,
                'canal_id' => 4,
                'foto' => $request['foto']
            ]);

            $cliente = $this->cliente->create([
                'uuid' =>  Str::uuid(),
                'nome' => $request['name'],
                'pessoa_contacto' => $request['name'],
                'email' => $request['email'],
                'conta_corrente' => $this->contaCorrente(),
                'telefone_cliente' => $request['telefone'],
                'taxa_de_desconto' => 100,
                'limite_de_credito' => 100000000000000000000,
                'endereco' => null,
                'canal_id' => 4,
                'status_id' => 1,
                'nif' => null,
                'operador' => $user->name,
                'tipo_cliente_id' => 6,
                'user_id' => $user->id,
                'pais_id' => 1,
                'cidade' => null,
                'empresa_id' => 148
            ]);
            DB::commit();
            return $user;
        } catch (\Throwable $th) {
            DB::rollBack();
        }
    }
    private function contaCorrente()
    {
        $resultado =  DB::connection('mysql2')->table('clientes')->orderBy('id', 'DESC')
            ->limit(1)->first();
        if ($resultado) {
            $contaCorrente = "31.1.2.1." . $resultado->id;
        } else {
            $contaCorrente = "31.1.2.1.1";
        }
        return $contaCorrente;
    }


    public function updateUser($request, $uuid)
    {
        try {
            DB::beginTransaction();
            if (isset($request['password1'])) {
                $user = $this->user->where('uuid', $uuid)->update([
                    "password" => Hash::make($request['password1'])
                ]);
            }
            $user = $this->user->where('uuid', $uuid)->update([
                'name' => $request['name'],
                'username' => $request['name'],
                'email' => $request['email'],
                'telefone' => $request['telefone'],
            ]);

            $user = $this->user::where('uuid', $uuid)->first();
            $cliente = $this->cliente->where('user_id', $user->id)
                ->where('empresa_id', auth()->user()->empresa_id)
                ->update([
                    'nome' => $request['name'],
                    'pessoa_contacto' => $request['name'],
                    'email' => $request['email'],
                    'telefone_cliente' => $request['telefone'],
                    'endereco' => $request['endereco'],
                    'operador' => $user->name,
                ]);
            DB::commit();
            return $user;
        } catch (\Throwable $th) {
            DB::rollBack();
        }
    }
    public function getUsers($search = null)
    {
        $users = $this->user::with(['statuGeral', 'perfis'])->search(trim($search))
            ->where('empresa_id', auth()->user()->empresa_id)
            ->paginate();
        return $users;
    }
    public function getUser($uuid)
    {
        $user = $this->user::with(['statuGeral', 'perfis'])->where('empresa_id', auth()->user()->empresa_id)
            ->where('uuid', $uuid)->first();
        return $user;
    }
    public function updatePassword($user)
    {
        $user =  DB::connection('mysql')->table('users_admin')->update([
            'password' => Hash::make($user['password']),
            'updated_at' => Carbon::now(),
        ]);
        return $user;
    }
    public function deletarUtilizador($utilizadorId)
    {

        return $this->user::where('id', $utilizadorId)
            ->where('empresa_id', auth()->user()->empresa_id)
            ->delete();
    }

    public function alterarSenha(Request $request, $userId)
    {
        if (auth()->user()->id == $userId) {
            $user = $this->user::findOrfail($userId);
            if (Hash::check($request->old_password, $user->password)) {
                $user->password = Hash::make($request->password);
                $user->updated_at = Carbon::now();
                $user->status_senha_id = 2;
                $user->remember_token = $request->_token;
                $user->save();
                return redirect()->route('admin.users.perfil')->withSuccess(' Senha Alterada com Sucesso!');
            } else {
                return redirect()->back()->withErrors('A senha antiga não corresponde com a deste utilizador!');
            }
        } else {
            return redirect()->back()->withErrors('Sem permissão para efectuar esta operação!');
        }
    }
}
