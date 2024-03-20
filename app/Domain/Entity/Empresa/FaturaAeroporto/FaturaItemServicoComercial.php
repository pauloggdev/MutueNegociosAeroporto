<?php
namespace App\Domain\Entity\Empresa\FaturaAeroporto;
class FaturaItemServicoComercial
{
    private $produtoId;
    private $nomeProduto;
    private $horaEstacionamento;
    private $taxaEstacionamento;
    private $dataEntradaEstacionamento;
    private $dataSaidaEstacionamento;
    private $taxaIva;
    private $cambioDia;
    private $considera1hDepois30min;

    public function __construct($produtoId, $nomeProduto, $dataEntradaEstacionamento, $dataSaidaEstacionamento, $taxaIva, $cambioDia, $considera1hDepois30min)
    {
        $this->produtoId = $produtoId;
        $this->nomeProduto = $nomeProduto;
        $this->dataEntradaEstacionamento = $dataEntradaEstacionamento;
        $this->dataSaidaEstacionamento = $dataSaidaEstacionamento;
        $this->taxaIva = $taxaIva;
        $this->cambioDia = $cambioDia;
        $this->considera1hDepois30min = $considera1hDepois30min;
    }
    public function getProdutoId()
    {
        return $this->produtoId;
    }
    public function getNomeProduto()
    {
        return $this->nomeProduto;
    }
    public function getTaxaEstacionamento()
    {
        return $this->taxaEstacionamento;
    }

    /**
     * @return mixed
     */
    public function getDataEntradaEstacionamento()
    {
        return $this->dataEntradaEstacionamento;
    }
    public function getDataSaidaEstacionamento()
    {
        return $this->dataSaidaEstacionamento;
    }
    public function getTaxaIva()
    {
        return $this->taxaIva;
    }

    public function getCambioDia()
    {
        return $this->cambioDia;
    }

    public function getConsidera1hDepois30min()
    {
        return $this->considera1hDepois30min;
    }
    public function getValorIva(){
        return ($this->getTotal() * $this->getTaxaIva()) / 100;
    }
    public function getTotalIva(){
        return $this->getTotal() + $this->getValorIva();
    }
    public function getDescHoraEstacionamento(){
        return $this->getDiasEstacionamento()." dias/". $this->getHoraEstacionamento()."h:".$this->getMinutoEstacionamento()."min";
    }

    public function getHoraEstacionamento()
    {
        $dataInicial = $this->getDataEntradaEstacionamento();
        $dataFinal = $this->getDataSaidaEstacionamento();
        $hora1 = new \DateTime($dataInicial);
        $hora2 = new \DateTime($dataFinal);
        $diff = $hora1->diff($hora2);
        $horas = $diff->h + $diff->days * 24;
        if ($this->getConsidera1hDepois30min() == 'SIM' && $diff->i > 30) {
            $horas = ++$horas;
        }
        return $horas;
    }
    public function getDiasEstacionamento(){
        $dataInicial = $this->getDataEntradaEstacionamento();
        $dataFinal = $this->getDataSaidaEstacionamento();
        $hora1 = new \DateTime($dataInicial);
        $hora2 = new \DateTime($dataFinal);
        $diff = $hora1->diff($hora2);
        return $diff->days;
    }
    public function getMinutoEstacionamento(){
        $dataInicial = $this->getDataEntradaEstacionamento();
        $dataFinal = $this->getDataSaidaEstacionamento();
        $hora1 = new \DateTime($dataInicial);
        $hora2 = new \DateTime($dataFinal);
        $diff = $hora1->diff($hora2);
        return $diff->i;
    }
    public function getTotal()
    {
        $estacionamentoCamiaoDentroTCA = $this->getProdutoId() == 28;
        $estacionamentoCamiaoForaTCA = $this->getProdutoId() == 29;
        $estacionamentoDeVeiculo = $this->getProdutoId() == 30;

        if($estacionamentoCamiaoDentroTCA){
            if($this->getDiasEstacionamento() <= 0 && $this->getHoraEstacionamento() <=0 && $this->getMinutoEstacionamento() <= 30){
                return $this->getTaxaDentroDoTca0a30() *  $this->getCambioDia();
            }
//            else if($this->getDiasEstacionamento() <= 0 && $this->getHoraEstacionamento() <=1 && $this->getMinutoEstacionamento() <= 30)

        }
        if($estacionamentoCamiaoForaTCA){

        }
        if($estacionamentoDeVeiculo){

        }

    }
    public function getTaxaDentroDoTca0a30()
    {
        return 0.79;
    }
    public function getTaxaDentroDoTcaAte1h()
    {
        return 1.00;

    }

    public function getTaxaDentroDoTcaDepois1hCada30min()
    {
        return 0.79;
    }

    //Taxas de estacionamento de camião fora TCA
    public function getTaxaForaDoTca0a30()
    {
        return 0.59;
    }

    public function getTaxaForaDoTcaAte1h()
    {
        return 0.88;

    }

    public function getTaxaForaDoTcaDepois1hCada30min()
    {
        return  0.59;
    }
    //Taxas de estacionamento de veiculos
    public function getTaxaVeiculo0a30()
    {
        return 0.59;
    }

    public function getTaxaVeiculoAte1h()
    {
        return 0.88;

    }

    public function getTaxaVeiculoDepois1hCada30min()
    {
        return  0.59;
    }


}
