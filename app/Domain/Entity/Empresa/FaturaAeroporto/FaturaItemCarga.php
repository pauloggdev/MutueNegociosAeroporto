<?php

namespace App\Domain\Entity\Empresa\FaturaAeroporto;

class FaturaItemCarga
{
    private $produtoId;
    private $nomeProduto;
    private $taxa;
    private $peso;
    private $nDias;
    private $cambioDia;
    private $sujeitoDespachoId;
    private $taxaTipoMercadoriaId;
    private $especificacaoMercadoriaId;
    private $desconto;

    private $imposto;
    private $total;

    /**
     * @param $produtoId
     * @param $taxa
     * @param $taxaCargaId
     * @param $taxaTipoMercadoriaId
     * @param $desconto
     * @param $imposto
     * @param $total
     */
    public function __construct($produtoId,$nomeProduto, $taxa, $peso,$nDias, $cambioDia, $sujeitoDespachoId, $taxaTipoMercadoriaId, $especificacaoMercadoriaId)
    {
        $this->produtoId = $produtoId;
        $this->nomeProduto = $nomeProduto;
        $this->taxa = $taxa;
        $this->peso = $peso;
        $this->nDias = $nDias;
        $this->cambioDia = $cambioDia;
        $this->sujeitoDespachoId = $sujeitoDespachoId;
        $this->taxaTipoMercadoriaId = $taxaTipoMercadoriaId;
        $this->especificacaoMercadoriaId = $especificacaoMercadoriaId;
    }

    /**
     * @return mixed
     */
    public function getProdutoId()
    {
        return $this->produtoId;
    }
    public function getNomeProduto()
    {
        return $this->nomeProduto;
    }

    /**
     * @return mixed
     */
    public function getTaxa()
    {
        return $this->taxa->getTaxa();
    }
    public function getCambioDia(){
        return $this->cambioDia;
    }
    public function getPeso()
    {
        return $this->peso;
    }
    public function getNDias()
    {
        return $this->nDias;
    }


    /**
     * @return mixed
     */
    public function getSujeitoDespachoId()
    {
        return $this->sujeitoDespachoId;
    }

    /**
     * @return mixed
     */
    public function getTaxaTipoMercadoriaId()
    {
        return $this->taxaTipoMercadoriaId;
    }

    /**
     * @return mixed
     */
    public function getEspecificacaoMercadoriaId(){
        return $this->especificacaoMercadoriaId;
    }
    public function getDesconto()
    {
        return $this->taxa->getDesconto();
    }

    /**
     * @return mixed
     */
    public function getImposto()
    {
        return "T";
    }

    /**
     * @return mixed
     */
    public function getTotal()
    {
        if($this->getProdutoId() == 1){
            return ($this->getPeso() * $this->getTaxa() * $this->getCambioDia());
        }else if($this->getProdutoId() == 2){
            return ($this->getPeso() * $this->getNDias() * $this->getTaxa()) * (1 - $this->getDesconto() / 100) * $this->getCambioDia();
        }else if($this->getProdutoId() == 3){
            return ($this->getPeso() * $this->getTaxa() * $this->getCambioDia());
        }
    }
}
