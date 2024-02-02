<?php

namespace App\Application\UseCase\Empresa\Faturacao;

use App\Application\UseCase\Empresa\Parametros\GetParametroPeloLabelNoParametro;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaCarga;
use App\Domain\Entity\Empresa\FaturaAeroporto\FaturaItemCarga;
use App\Domain\Factory\Empresa\RepositoryFactory;
use App\Infra\Factory\Empresa\DatabaseRepositoryFactory;
use App\Infra\Repository\Empresa\EspecificacaoMercadoriaRepository;
use App\Infra\Repository\Empresa\TaxaCargaAduaneiraRepository;
use App\Infra\Repository\Empresa\TipoMercadoriaRepository;
use Illuminate\Support\Facades\DB;

class SimuladorFaturaCargaAeroporto
{
    private EspecificacaoMercadoriaRepository $especificacaoMercadoriaRepository;
    private TaxaCargaAduaneiraRepository $taxaCargaAduaneiraRepository;
    private TipoMercadoriaRepository $taxaTipoMercadoriaRepository;

    public function __construct(RepositoryFactory $repositoryFactory)
    {
        $this->especificacaoMercadoriaRepository = $repositoryFactory->createEspecificacaoMercadoriaRepository();
        $this->taxaCargaAduaneiraRepository = $repositoryFactory->createTaxaCargaAduaneiraRepository();
        $this->taxaTipoMercadoriaRepository = $repositoryFactory->createTipoMercadoriaRepository();
    }

    public function execute($input)
    {
        $input = (object)$input;

        $taxaIva = new GetParametroPeloLabelNoParametro(new DatabaseRepositoryFactory());
        $taxaIva = (float) $taxaIva->execute('valor_iva_aplicado')->valor;
        $cambioDia = DB::table('cambios')->where('designacao', 'USD')->first()->valor;

        $faturaCarga = new FaturaCarga(
            $input->cartaDePorte,
            $input->tipoDocumento,
            $input->peso,
            $input->dataEntrada,
            $input->dataSaida,
            $input->nDias,
            $taxaIva,
            $cambioDia
        );
        foreach ($input->items as $item){
            $item = (object)$item;
            if($item->produtoId == 1){//Produto/Serviçso do tipo Carga
                $taxaCargaAduaneira = $this->taxaCargaAduaneiraRepository->getTaxaCargaById($item->sujeitoDespachoId);
                $taxa = new Taxa(
                    $taxaCargaAduaneira->designacao,
                    $taxaCargaAduaneira->taxa,
                    0
                );
            }else{// Todos Produtos/Serviçso diferentes de Carga
                $taxaTipoMercadoria = $this->taxaTipoMercadoriaRepository->getTipoMercadoria($item->tipoMercadoriaId);
                $espeficificaoMercadoria = $this->especificacaoMercadoriaRepository->getEspecificacaoMercadoriaById($item->especificacaoMercadoriaId);
                $desconto = $espeficificaoMercadoria->desconto;
                $taxa = new Taxa(
                    $taxaTipoMercadoria->designacao,
                    $taxaTipoMercadoria->taxa,
                    $desconto
                );
            }
            $faturaItemCarga = new FaturaItemCarga(
                $item->produtoId,
                $item->nomeProduto,
                $taxa,
                $faturaCarga->getPeso(),
                $faturaCarga->getNDias(),
                $cambioDia,
                $item->sujeitoDespachoId,
                $item->tipoMercadoriaId,
                $item->especificacaoMercadoriaId
            );
            $faturaCarga->addItem($faturaItemCarga);
        }
        return $faturaCarga;
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
