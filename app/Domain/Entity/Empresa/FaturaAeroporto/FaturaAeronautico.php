<?php

namespace App\Domain\Entity\Empresa\FaturaAeroporto;

class FaturaAeronautico
{

    private $tipoDocumento;
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
    private $cambioDia;

    private $items = [];


    public function __construct($tipoDocumento, $clienteId, $nomeCliente, $telefoneCliente, $nifCliente, $emailCliente, $enderecoCliente, $tipoDeAeronave, $pesoMaximoDescolagem, $dataDeAterragem, $dataDeDescolagem, $horaDeAterragem, $horaDeDescolagem, $taxaIva, $cambioDia)
    {
        $this->tipoDocumento = $tipoDocumento;
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
        $this->cambioDia = $cambioDia;
    }

    public function addItem(FaturaItemAeronautico $items)
    {
        $this->items[] = $items;
    }

    public function getTipoDocumento()
    {
        return $this->tipoDocumento;
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
        $hora1 = new \DateTime($this->getHoraDeAterragem());
        $hora2 = new \DateTime($this->getHoraDeDescolagem());
        $diff = $hora1->diff($hora2);
        return $diff->h <= 0 ? 1 : $diff->h;
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
        return $this->getValorIliquido() + $this->getValorImposto();
    }


}