<?php

namespace App\Domain\Entity\Empresa\FaturaAeroporto;

class FaturaItemAeronautico
{
    private $produtoId;
    private $nomeProduto;
    private $pmd;
    private $horaEstacionamento;
    private $taxa;
    private $taxaLuminosa;
    private $taxaAduaneiro;
    private $sujeitoDespachoId;
    private $taxaIva;
    private $peso;
    private $horaExtra;
    private $taxaAbertoAeroporto;
    private $cambioDia;
    private $taxaReaberturaComercial;
    public function __construct($produtoId, $nomeProduto, $pmd, $horaEstacionamento, $taxaEstacionamento, $taxaLuminosa, $taxaAduaneiro, $sujeitoDespachoId,$taxaIva, $peso, $horaExtra, $horaAberturaAeroporto, $horaFechoAeroporto,$taxaAbertoAeroporto, $cambioDia, $taxaReaberturaComercial)
    {
        $this->produtoId = $produtoId;
        $this->nomeProduto = $nomeProduto;
        $this->pmd = $pmd;
        $this->horaEstacionamento = $horaEstacionamento;
        $this->taxa = $taxaEstacionamento;
        $this->taxaLuminosa = $taxaLuminosa;
        $this->taxaAduaneiro = $taxaAduaneiro;
        $this->sujeitoDespachoId = $sujeitoDespachoId;
        $this->taxaIva = $taxaIva;
        $this->peso = $peso;
        $this->horaExtra = $horaExtra;
        $this->horaAberturaAeroporto = $horaAberturaAeroporto;
        $this->horaFechoAeroporto = $horaFechoAeroporto;
        $this->taxaAbertoAeroporto = $taxaAbertoAeroporto;
        $this->cambioDia = $cambioDia;
        $this->taxaReaberturaComercial = $taxaReaberturaComercial;
    }

    public function getTaxaAduaneiro()
    {
        return $this->taxaAduaneiro;
    }

    public function getSujeitoDespachoId()
    {
        return $this->sujeitoDespachoId;
    }

    /**
     * @return mixed
     */
    public function getTaxaIva()
    {
        return $this->taxaIva;
    }
    public function getValorIva(){
        return ($this->getTotal() * $this->getTaxaIva()) / 100;
    }
    public function getTotalIva(){
        return $this->getTotal() + $this->getValorIva();
    }


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
    public function getHoraEstacionamento()
    {
        return $this->horaEstacionamento;
    }

    public function getTaxa()
    {
        return $this->taxa;
    }

    public function getTaxaLuminosa()
    {
        return $this->taxaLuminosa;
    }

    public function getPeso()
    {
        return $this->peso;
    }
    public function getHoraAberturaAeroporto(){
        return $this->horaAberturaAeroporto;

    }
    public function getTaxaReaberturaComercial(){
        return $this->taxaReaberturaComercial;
    }
    public function getHoraFechoAeroporto(){
      return $this->horaFechoAeroporto;
    }
    public function getTaxaAbertoAeroporto(){
        return $this->taxaAbertoAeroporto;
    }
    public function getHoraExtra(){
        return (float) $this->horaExtra;
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
        if ($this->getProdutoId() == 4) { //Servico Estacionamento
            return $this->getTarifaEstacionamento();
        }
        if ($this->getProdutoId() == 5) { //Servico Aterragem
            return $this->getTarifaAterragemDescolagem();
        }
        if ($this->getProdutoId() == 6 || $this->getProdutoId() == 9) { // Servico de Luminosa1x e Luminosa2x
            return $this->getTarifaLuminosa();
        }
        if ($this->getProdutoId() == 7) { //Servico de carga
            return $this->getTarifaCarga();
        }
        if($this->getProdutoId() == 8){ //Servico de Abertura - Prolonngamento
            return $this->getTarifaAbertoProlongamento();
        }
        if($this->getProdutoId() == 10){ //Serviço de Abertura - Anticipado
            return $this->getTarifaAbertoAnticipado();
        }
        if($this->getProdutoId() == 11){ //Serviço de Reabertura comercial
            return $this->getReaberturaComercial();
        }
        if ($this->getProdutoId() == 12) { //Servico de carga Importação
            return $this->getTarifaCarga();
        }
        if ($this->getProdutoId() == 13) { //Servico de carga Exportação
            return $this->getTarifaCarga();
        }
    }

    public function getTarifaEstacionamento()
    {
//        return $this->getPMD() * $this->getCambioDia();
        if ($this->getHoraEstacionamento() <= 2) {
            return 0;
        } else if ($this->getHoraEstacionamento() > 2 && $this->getHoraEstacionamento() <= 3) {
            return $this->getTaxa() * $this->getPMD() * $this->getCambioDia();
        } else if ($this->getHoraEstacionamento() > 3 && $this->getHoraEstacionamento() <= 6) {
            return ($this->getTaxa() * $this->getPMD() * ($this->getHoraEstacionamento() - 2)) * $this->getCambioDia();
        } else if ($this->getHoraEstacionamento() > 6) {
            return (($this->getTaxa() * $this->getPMD() * 4) + ($this->getTaxa() * 1.5) * $this->getPMD() * ($this->getHoraEstacionamento() - 6)) * $this->getCambioDia();
        }
    }

    public function getTarifaLuminosa()
    {
        if ($this->getProdutoId() == 6) {
            return $this->getTaxaLuminosa() * $this->getCambioDia();
        } else if ($this->getProdutoId() == 9) {
            return $this->getTaxaLuminosa() * 2 * $this->getCambioDia();
        }
        return 0;
    }
    public function getTarifaCarga()
    {
        if(!$this->getPeso() || $this->getPeso() <= 0) throw new \Error("Informe o peso");
        return $this->getPeso() * $this->getTaxaAduaneiro() * $this->getCambioDia();
    }
    public function getTarifaAbertoProlongamento(){
        if(!$this->getHoraExtra() || $this->getHoraExtra()<=0) throw new \Error("Informa a hora extra");
        return ($this->getTaxaAbertoAeroporto() * (($this->getHoraExtra()+$this->getHoraFechoAeroporto()) - $this->getHoraFechoAeroporto()))  * $this->getCambioDia();

    }
    public function getTarifaAbertoAnticipado(){
        if(!$this->getHoraExtra() || $this->getHoraExtra()<=0 ) throw new \Error("Informa a hora extra");
        return ($this->getTaxaAbertoAeroporto() * ($this->getHoraAberturaAeroporto() -  ($this->getHoraAberturaAeroporto() - $this->getHoraExtra()))) * $this->getCambioDia();
    }
    public function getReaberturaComercial(){
        return ($this->getTaxaReaberturaComercial() * $this->getHoraExtra() * $this->getCambioDia());
    }

    public function getTarifaAterragemDescolagem()
    {
        if ($this->getPMD() >= 0 && $this->getPMD() <= 10) {
            return ($this->getTaxa0a10() * $this->getPMD()) * $this->getCambioDia();
        } else if ($this->getPMD() > 10 && $this->getPMD() <= 25) {
            return (($this->getTaxa0a10() * 10) + ($this->getTaxa10a25() * ($this->getPMD() - 10))) * $this->getCambioDia();
        } else if ($this->getPMD() > 25 && $this->getPMD() <= 75) {
            return (($this->getTaxa0a10() * 10) + ($this->getTaxa10a25() * 15) + ($this->getTaxa25a75() * ($this->getPMD() - 25))) * $this->getCambioDia();
        } else if ($this->getPMD() > 75 && $this->getPMD() <= 150) {
            return (($this->getTaxa0a10() * 10) + ($this->getTaxa10a25() * 15) + ($this->getTaxa25a75() * 50) + ($this->getTaxa75a150() * ($this->getPMD() - 75))) * $this->getCambioDia();
        } else {
            return (($this->getTaxa0a10() * 10) + ($this->getTaxa10a25() * 15) + ($this->getTaxa25a75() * 50) + ($this->getTaxa75a150() * 75) + ($this->getTaxa150aInfinito() * ($this->getPMD() - 150))) * $this->getCambioDia();
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
