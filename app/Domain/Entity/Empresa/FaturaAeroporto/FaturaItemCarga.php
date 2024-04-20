<?php

namespace App\Domain\Entity\Empresa\FaturaAeroporto;

class FaturaItemCarga
{
    private $produtoId;
    private $nomeProduto;
    private $taxa;
    private $taxaIva;
    private $dataEntrada;
    private $dataSaida;
    private $tipoOperacao;
    private $isencaoCargaTransito;
    private $peso;
    private $nDias;
    private $cambioDia;
    private $sujeitoDespachoId;
    private $taxaTipoMercadoriaId;
    private $especificacaoMercadoriaId;
    private $desconto;
    private $imposto;
    private $total;

    public function __construct($produtoId, $nomeProduto, $taxa, $taxaIva, $peso, $nDias, $cambioDia, $sujeitoDespachoId, $taxaTipoMercadoriaId, $especificacaoMercadoriaId, $dataEntrada, $dataSaida, $tipoOperacao, $isencaoCargaTransito)
    {
        $this->produtoId = $produtoId;
        $this->nomeProduto = $nomeProduto;
        $this->taxa = $taxa;
        $this->taxaIva = $taxaIva;
        $this->peso = $peso;
        $this->nDias = $nDias;
        $this->cambioDia = $cambioDia;
        $this->sujeitoDespachoId = $sujeitoDespachoId;
        $this->taxaTipoMercadoriaId = $taxaTipoMercadoriaId;
        $this->especificacaoMercadoriaId = $especificacaoMercadoriaId;
        $this->dataEntrada = $dataEntrada;
        $this->dataSaida = $dataSaida;
        $this->tipoOperacao = $tipoOperacao;
        $this->isencaoCargaTransito = $isencaoCargaTransito;
    }

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

    public function getTaxaIva()
    {
        return $this->taxaIva;
    }

    public function getIsencaoCargaTransito()
    {
        return $this->isencaoCargaTransito;
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
    public function getTipoOperacao()
    {
        return $this->tipoOperacao;
    }

    public function getValorIva()
    {
        return ($this->getTotal() * $this->getTaxaIva()) / 100;
    }

    public function getCambioDia()
    {
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
    public function getEspecificacaoMercadoriaId()
    {
        return $this->especificacaoMercadoriaId;
    }

    public function getDesconto()
    {
        $CARGA_TRANSITO = $this->getTipoOperacao() == 3;
        $HORAS_ARMAZENAMENTO_CARGA = 24;
        if ($CARGA_TRANSITO && $this->getIsencaoCargaTransito() && $this->getHorasArmazenamentoCarga() <= $HORAS_ARMAZENAMENTO_CARGA) {
            return 100;
        }
        return $this->taxa->getDesconto();
    }
    public function getValorDesconto()
    {
        return $this->getTotal() * $this->getDesconto() / 100;
    }

    /**
     * @return mixed
     */
    public function getImposto()
    {
        return "T";
    }

    public function getTotalIva()
    {
        return $this->getTotal() + $this->getValorIva();
    }

    public function getHorasArmazenamentoCarga()
    {
        $dataInicial = $this->getDataEntrada();
        $dataFinal = $this->getDataSaida();
        $hora1 = new \DateTime($dataInicial);
        $hora2 = new \DateTime($dataFinal);
        $diff = $hora1->diff($hora2);
        $horas = $diff->h + $diff->days * 24;
        if ($diff->i > 0) {
            ++$horas;
        }
        return $horas;
    }
    public function getTotal()
    {
        if ($this->getProdutoId() == 1) {
            return ($this->getPeso() * $this->getTaxa() * $this->getCambioDia());
        } else if ($this->getProdutoId() == 2) {
            return ($this->getPeso() * $this->getNDias() * $this->getTaxa()) * (1 - $this->taxa->getDesconto() / 100) * $this->getCambioDia();
        } else if ($this->getProdutoId() == 3) {
            return ($this->getPeso() * $this->getTaxa() * $this->getCambioDia());
        }
    }
}
