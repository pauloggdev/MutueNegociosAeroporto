<?php

namespace App\Domain\Entity\Empresa\FaturaAeroporto;

class FaturaItemAeronautico
{
    private $produtoId;
    private $nomeProduto;
    private $pmd;
    private $horaEstacionamento;
    private $taxa;
    private $cambioDia;
    private $imposto;
    private $total;

    public function __construct($produtoId, $nomeProduto, $pmd, $horaEstacionamento, $taxa, $cambioDia)
    {
        $this->produtoId = $produtoId;
        $this->nomeProduto = $nomeProduto;
        $this->pmd = $pmd;
        $this->horaEstacionamento = $horaEstacionamento;
        $this->taxa = $taxa;
        $this->cambioDia = $cambioDia;
    }

    /**
     * @return mixed
     */
    public function getProdutoId()
    {
        return $this->produtoId;
    }

    /**
     * @return mixed
     */
    public function getNomeProduto()
    {
        return $this->nomeProduto;
    }

    /**
     * @return mixed
     */
    public function getHoraEstacionamento(){
        return $this->horaEstacionamento;
    }
    public function getTaxa(){
        return $this->taxa;
    }
    public function getPMD()
    {
        return $this->pmd;
    }

    /**
     * @return mixed
     */
    public function getCambioDia()
    {
        return $this->cambioDia;
    }


    public function getImposto()
    {
        return "T";
    }

    /**
     * @return mixed
     */
    public function getTotal()
    {
        if ($this->produtoId == 4) { //Servico Estacionamento
            return $this->getTarifaEstacionamento();
        }
        if ($this->produtoId == 5) { //Servico Aterragem
            return $this->getTarifaAterragemDescolagem();
        }
    }
    public function getTarifaEstacionamento(){

//        if($this->getHoraEstacionamento() <= 2){
//            return 0;
//        }else if($this->getHoraEstacionamento() > 2 && $this->getHoraEstacionamento() < 4){
//            return $this->getTaxa() * $this->getPMD();
//        }else if($this->getHoraEstacionamento() >= 4 && $this->getHoraEstacionamento() <= 6){
//            return $this
//        }

    }
    public function getTarifaAterragemDescolagem()
    {
        if ($this->getPMD() >= 0 && $this->getPMD() <= 10) {
            return ($this->getTaxa0a10() * $this->getPMD()) * $this->getCambioDia();
        } else if ($this->getPMD() > 10 && $this->getPMD() <= 25) {
            return ($this->getTaxa0a10() * 10) + ($this->getTaxa10a25() * ($this->getPMD() - 10));
        } else if ($this->getPMD() > 25 && $this->getPMD() <= 75) {
            return ($this->getTaxa0a10() * 10) + ($this->getTaxa10a25() * 15) + ($this->getTaxa25a75() * ($this->getPMD() - 25));
        } else if ($this->getPMD() > 75 && $this->getPMD() <= 150) {
            return (($this->getTaxa0a10() * 10) + ($this->getTaxa10a25() * 15) + ($this->getTaxa25a75() * 50) + ($this->getTaxa75a150() * ($this->getPMD() - 75))) * $this->getCambioDia();
        } else {
            return ($this->getTaxa0a10() * 10) + ($this->getTaxa10a25() * 15) + ($this->getTaxa25a75() * 50) + ($this->getTaxa75a150() * 75) + ($this->getTaxa150aInfinito() * ($this->getPMD() - 150));
        }
    }

    public function getTaxa0a10()
    {
        return 7.21;
    }

    public function getTaxa10a25()
    {
        return 6.62;
    }

    public function getTaxa25a75()
    {
        return 7.53;
    }

    public function getTaxa75a150()
    {
        return 8.26;
    }

    public function getTaxa150aInfinito()
    {
        return 8.1;
    }
}
