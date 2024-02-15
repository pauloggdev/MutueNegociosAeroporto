<?php

namespace App\Domain\Entity\Empresa\FaturaAeroporto;

class FaturaAeronautico
{

    private $tipoDocumento;
    private $observacao;
    private $nomeProprietario;
    private $clienteId;
    private $nomeCliente;
    private $telefoneCliente;
    private $nifCliente;
    private $emailCliente;
    private $enderecoCliente;
    private $tipoDeAeronave;
    private $pesoMaximoDescolagem;
    private $dataDeAterragem;
    private $dataDeDescolagem;
    private $horaDeAterragem;
    private $horaDeDescolagem;
    private $taxaIva;
    private $peso;
    private $horaExtra;
    private $cambioDia;
    private $moeda;
    private $items = [];


    public function __construct($tipoDocumento, $observacao, $isencaoIVA, $retencao, $valorRetencao, $nomeProprietario,$clienteId, $nomeCliente, $telefoneCliente, $nifCliente, $emailCliente, $enderecoCliente, $tipoDeAeronave, $pesoMaximoDescolagem, $dataDeAterragem, $dataDeDescolagem, $horaDeAterragem, $horaDeDescolagem, $taxaIva, $peso, $horaExtra, $cambioDia, $moeda)
    {
        $this->tipoDocumento = $tipoDocumento;
        $this->observacao = $observacao;
        $this->isencaoIVA = $isencaoIVA;
        $this->retencao = $retencao;
        $this->valorRetencao = $valorRetencao;
        $this->nomeProprietario = $nomeProprietario;
        $this->clienteId = $clienteId;
        $this->nomeCliente = $nomeCliente;
        $this->telefoneCliente = $telefoneCliente;
        $this->nifCliente = $nifCliente;
        $this->emailCliente = $emailCliente;
        $this->enderecoCliente = $enderecoCliente;
        $this->tipoDeAeronave = $tipoDeAeronave;
        $this->pesoMaximoDescolagem = $pesoMaximoDescolagem;
        $this->dataDeAterragem = $dataDeAterragem;
        $this->dataDeDescolagem = $dataDeDescolagem;
        $this->horaDeAterragem = $horaDeAterragem;
        $this->horaDeDescolagem = $horaDeDescolagem;
        $this->taxaIva = $taxaIva;
        $this->peso = $peso;
        $this->horaExtra = $horaExtra;
        $this->cambioDia = $cambioDia;
        $this->moeda = $moeda;
    }

    public function addItem(FaturaItemAeronautico $items)
    {
        $this->items[] = $items;
    }

    /**
     * @return mixed
     */
    public function getMoeda()
    {
        return $this->moeda;
    }



    public function getTipoDocumento()
    {
        return $this->tipoDocumento;
    }
    public function getObservacao(){
        return $this->observacao;
    }

    /**
     * @return mixed
     */
    public function getIsencaoIVA()
    {
        return $this->isencaoIVA;
    }

    /**
     * @return mixed
     */
    public function getRetencao()
    {
        return $this->retencao;
    }

    /**
     * @return mixed
     */
    public function getValorRetencao()
    {
        return ($this->getValorIliquido() * $this->getTaxaRetencao()) / 100;

    }
    public function getTaxaRetencao()
    {
        return $this->valorRetencao;
    }


    public function getProprietario(){
        return $this->nomeProprietario;
    }

    public function getClienteId()
    {
        return $this->clienteId;
    }

    public function getNomeCliente()
    {
        return $this->nomeCliente;
    }

    public function getTelefoneCliente()
    {
        return $this->telefoneCliente;
    }

    public function getNifCliente()
    {
        return $this->nifCliente;
    }

    public function getEmailCliente()
    {
        return $this->emailCliente;
    }

    public function getEnderecoCliente()
    {
        return $this->enderecoCliente;
    }

    public function getTipoDeAeronave()
    {
        return $this->tipoDeAeronave;
    }

    public function getPesoMaximoDescolagem()
    {
        return $this->pesoMaximoDescolagem;
    }

    /**
     * @return mixed
     */
    public function getDataDeAterragem()
    {
        return $this->dataDeAterragem;
    }

    /**
     * @return mixed
     */
    public function getDataDeDescolagem()
    {
        return $this->dataDeDescolagem;
    }

    /**
     * @return mixed
     */
    public function getHoraDeAterragem()
    {
        return $this->horaDeAterragem;
    }

    public function getHoraEstacionamento()
    {
        $dataInicial = $this->getDataDeAterragem(). " ".$this->getHoraDeAterragem();
        $dataFinal = $this->getDataDeDescolagem(). " ".$this->getHoraDeDescolagem();
        $hora1 = new \DateTime($dataInicial);
        $hora2 = new \DateTime($dataFinal);
        $diff = $hora1->diff($hora2);
        $horas = $diff->h + $diff->days * 24;
        if($diff->i > 14){
            $horas = ++$horas;
        }
        return $horas;
    }

    public function getHoraDeDescolagem()
    {
        return $this->horaDeDescolagem;
    }

    /**
     * @return mixed
     */
    public function getTaxaIva()
    {
        return $this->taxaIva;
    }
    public function getHoraExtra(){
        return $this->horaExtra;
    }
    public function getPeso(){
        return $this->peso;
    }

    /**
     * @return mixed
     */
    public function getCambioDia()
    {
        return $this->cambioDia;
    }

    public function getContraValor()
    {
        return $this->getTotal() / $this->getCambioDia();
    }

    public function getItems(): array
    {
        return $this->items;
    }

    public function getValorIliquido()
    {
        $total = 0;
        foreach ($this->getItems() as $item) {
            $total += $item->getTotal();
        }
        return $total;
    }

    public function getValorImposto()
    {
        return ($this->getValorIliquido() * $this->getTaxaIva()) / 100;
    }

    public function getTotal()
    {
        return $this->getValorIliquido() + $this->getValorImposto() - $this->getValorRetencao();
    }


}
