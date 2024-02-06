<?php

namespace App\Application\UseCase\Empresa\Faturacao;
use App\Application\UseCase\Empresa\Parametros\GetParametroPeloLabelNoParametro;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaAeronautico;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaItemAeronautico;
use App\Domain\Factory\Empresa\RepositoryFactory;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Infra\Repository\Empresa\TaxaPesoMaximoDescolagemRepositoryRepository;
use Illuminate\Support\Facades\DB;

class SimuladorFaturaAeronauticoAeroporto
{
    private TaxaPesoMaximoDescolagemRepositoryRepository $taxaPesoMaximoDescolagemRepository;
    public function __construct(RepositoryFactory $repositoryFactory)
    {
        $this->taxaPesoMaximoDescolagemRepository = $repositoryFactory->createTaxaPesoMaximoDescolagemRepositoryRepository();

    }
    public function execute($input)
    {
        $input = (object)$input;
        $taxaIva = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $taxaIva = (float) $taxaIva->execute('valor_iva_aplicado')->valor;
        $cambioDia = DB::table('cambios')->where('designacao', 'USD')->first()->valor;

        $faturaAeronautico = new FaturaAeronautico(
            $input->tipoDocumento,
            $input->clienteId,
            $input->nomeCliente,
            $input->telefoneCliente,
            $input->nifCliente,
            $input->emailCliente,
            $input->enderecoCliente,
            $input->tipoDeAeronave,
            $input->pesoMaximoDescolagem,
            $input->dataDeAterragem,
            $input->dataDeDescolagem,
            $input->horaDeAterragem,
            $input->horaDeDescolagem,
            $taxaIva,
            $cambioDia
        );
        foreach ($input->items as $item){
            $item = (object)$item;
            $faturaItemAeronautico = new FaturaItemAeronautico(
                $item->produtoId,
                $item->nomeProduto,
                $input->pesoMaximoDescolagem,
                $faturaAeronautico->getHoraEstacionamento(),
                $cambioDia
            );
            $faturaAeronautico->addItem($faturaItemAeronautico);
        }
        return $faturaAeronautico;
    }

}



class Taxa{
    private $designacao;
    private $taxa;
    private $desconto;

    public function __construct($designacao, $taxa, $desconto)
    {
        $this->designacao = $designacao;
        $this->taxa = $taxa;
        $this->desconto = $desconto;
    }

    /**
     * @return mixed
     */
    public function getDesignacao()
    {
        return $this->designacao;
    }

    /**
     * @return mixed
     */
    public function getTaxa()
    {
        return $this->taxa;
    }
    public function getDesconto()
    {
        return $this->desconto;
    }


}
