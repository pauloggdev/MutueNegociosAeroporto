<?php

namespace App\Application\UseCase\VendasOnline\PerguntasFrequentes;

use App\Domain\Factory\VendasOnline\RepositoryFactory;
use App\Infra\Repository\VendasOnline\PerguntaFrequenteRepository;

class EliminarPerguntaFrequente
{
    private PerguntaFrequenteRepository $perguntaFrequenteRepository;
    public function __construct(RepositoryFactory $repositoryFactory)
    {
        $this->perguntaFrequenteRepository = $repositoryFactory->createPerguntaFrequenteRepository();
    }
    public function execute($perguntaFrequenteId){
        return $this->perguntaFrequenteRepository->delete($perguntaFrequenteId);
    }

}
