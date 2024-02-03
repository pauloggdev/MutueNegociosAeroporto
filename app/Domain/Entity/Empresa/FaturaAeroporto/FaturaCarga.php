<?php

namespace App\Domain\Entity\Empresa\FaturaAeroporto;

class FaturaCarga
{
    private $cartaDePorte;
    private $tipoDocumento;
    private $clienteId;
    private $nomeCliente;
    private $telefoneCliente;
    private $nifCliente;
    private $emailCliente;
    private $enderecoCliente;
    private $peso;
    private $dataEntrada;
    private $dataSaida;
    private $nDias;
    private $taxaIva;
    private $cambioDia;
    private $items = [];

    /**
     * @param $CartaDePorte
     * @param $peso
     * @param $dataEntrada
     * @param $dataSaida
     * @param $nDias
     * @param $valorIliquido
     * @param $valorImposto
     * @param $contraValor
     */

    public function __construct($cartaDePorte, $tipoDocumento, $clienteId, $nomeCliente, $telefoneCliente, $nifCliente, $emailCliente, $enderecoCliente, $peso, $dataEntrada, $dataSaida, $nDias, $taxaIva, $cambioDia)
    {
        $this->cartaDePorte = $cartaDePorte;
        $this->tipoDocumento = $tipoDocumento;
        $this->clienteId = $clienteId;
        $this->nomeCliente = $nomeCliente;
        $this->telefoneCliente = $telefoneCliente;
        $this->nifCliente = $nifCliente;
        $this->emailCliente = $emailCliente;
        $this->enderecoCliente = $enderecoCliente;
        $this->peso = $peso;
        $this->dataEntrada = $dataEntrada;
        $this->dataSaida = $dataSaida;
        $this->nDias = $nDias;
        $this->taxaIva = $taxaIva;
        $this->cambioDia = $cambioDia;
    }

    public function addItem(FaturaItemCarga $items)
    {
        $this->items[] = $items;
    }

    public function getNomeCliente()
    {
        return $this->nomeCliente;
    }

    public function getTelefone()
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


    /**
     * @return mixed
     */
    public function getTipoDocumentoId()
    {
        return $this->tipoDocumento;
    }

    public function getClienteId()
    {
        return $this->clienteId;
    }

    public function getCartaDePorte()
    {
        return $this->cartaDePorte;
    }

    /**
     * @return mixed
     */
    public function getPeso()
    {
        return $this->peso;
    }

    /**
     * @return mixed
     */
    public function getDataEntrada()
    {
        return $this->dataEntrada;
    }

    /**
     * @return mixed
     */
    public function getDataSaida()
    {
        return $this->dataSaida;
    }

    /**
     * @return mixed
     */
    public function getNDias()
    {
        return $this->nDias;
    }

    public function getTaxaIva()
    {
        return $this->taxaIva;
    }

    public function getCambioDia()
    {
        return $this->cambioDia;
    }

    /**
     * @return mixed
     */


    /**
     * @return mixed
     */


    /**
     * @return mixed
     */
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
