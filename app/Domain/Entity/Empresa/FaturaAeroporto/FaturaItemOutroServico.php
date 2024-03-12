<?php

namespace App\Domain\Entity\Empresa\FaturaAeroporto;

class FaturaItemOutroServico
{
    private $produtoId;
    private $nomeProduto;
    private $precoProduto;
    private $taxaIva;
    private $quantidade;
    private $cambioDia;

    public function __construct($produtoId, $nomeProduto, $precoProduto, $taxaIva, $quantidade, $cambioDia)
    {
        $this->produtoId = $produtoId;
        $this->nomeProduto = $nomeProduto;
        $this->precoProduto = $precoProduto;
        $this->taxaIva = $taxaIva;
        $this->quantidade = $quantidade;
        $this->cambioDia = $cambioDia;
    }

    public function getProdutoId()
    {
        return $this->produtoId;
    }

    public function getNomeProduto()
    {
        return $this->nomeProduto;
    }

    public function getPrecoProduto()
    {
        return $this->precoProduto;
    }

    public function getTaxaIva()
    {
        return $this->taxaIva;
    }

    public function getValorIva()
    {
        return ($this->getTotal() * $this->getTaxaIva()) / 100;
    }

    public function getTotalIva()
    {
        return $this->getTotal() + $this->getValorIva();
    }

    public function getQuantidade()
    {
        return $this->quantidade;
    }

    public function getCambioDia()
    {
        return $this->cambioDia;
    }

    public function getTotal()
    {
        if ($this->getProdutoId() == 21) { //Assistência a combustível e óleo
            return ($this->getQuantidade() / 100) * $this->getPrecoProduto() * $this->getCambioDia();
        }
        return $this->getPrecoProduto() * $this->getQuantidade() * $this->getCambioDia();
    }
}
