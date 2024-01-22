<?php

namespace App\Application\UseCase\Empresa\Fabricantes;

use App\Domain\Factory\Empresa\RepositoryFactory;
use App\Infra\Repository\Empresa\FabricanteRepository;

class GetFabricantes
{
    private FabricanteRepository $fabricanteRepository;
    public function __construct(RepositoryFactory $repositoryFactory){
        $this->fabricanteRepository = $repositoryFactory->createFabricanteRepository();
    }
    public function execute(){
        return $this->fabricanteRepository->getFabricantes();
    }
}
