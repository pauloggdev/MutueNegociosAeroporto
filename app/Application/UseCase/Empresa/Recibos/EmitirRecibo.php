<?php

namespace App\Application\UseCase\Empresa\Recibos;

use App\Domain\Entity\Empresa\Recibos\Recibo;
use App\Domain\Factory\Empresa\RepositoryFactory;
use App\Infra\Repository\Empresa\ReciboRepository;
use Illuminate\Support\Facades\Storage;
use illuminate\Support\Str;
use Livewire\WithFileUploads;

class EmitirRecibo
{

    use WithFileUploads;
    
    private ReciboRepository $reciboRepository;
    public function __construct(RepositoryFactory $repositoryFactory){
        $this->reciboRepository = $repositoryFactory->createReciboRepository();
    }
    public function execute($data){


        if($data['comprovativoBancario']){
            $fileName= Str::slug($data['numeroOperacaoBancaria']) . "." .$data['comprovativoBancario']->getClientOriginalExtension();
            $path= $data['comprovativoBancario']->storeAs('comprovativos', $fileName, 'public');
            $data['comprovativoBancario'] = $path;
   
        }

        $ultimoDoc = $this->reciboRepository->lastDocument();
        $numSequenciaRecibo = 1;
        if ($ultimoDoc) {
            $numSequenciaRecibo = ++$ultimoDoc->numSequenciaRecibo;
        }
        $numeracaoRecibo = 'RC ATO' . date('Y') . '/' . $numSequenciaRecibo;
        $recibo = new Recibo(
            $data['clienteId'],
            $data['nomeCliente'],
            $data['nifCliente'],
            $data['telefoneCliente'],
            $data['emailCliente'],
            $data['enderecoCliente'],
            $data['anulado'],
            $data['totalEntregue'],
            $data['totalImposto'],
            $data['facturaId'],
            $data['totalFatura'],
            $data['formaPagamentoId'],
            $data['numeroOperacaoBancaria'],
            $data['dataOperacao'],
            $data['comprovativoBancario'],
            $data['observacao'],
            $numSequenciaRecibo,
            $numeracaoRecibo
        );

        return $this->reciboRepository->emitirRecibo($recibo);
    }
}