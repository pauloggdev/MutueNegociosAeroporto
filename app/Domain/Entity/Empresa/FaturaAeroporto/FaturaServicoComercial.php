<?php
namespace App\Domain\Entity\Empresa\FaturaAeroporto;
class FaturaServicoComercial
{
    private $tipoDocumento;
    private $formaPagamentoId;
    private $observacao;
    private $nomeProprietario;
    private $clienteId;
    private $nomeCliente;
    private $telefoneCliente;
    private $nifCliente;
    private $emailCliente;
    private $enderecoCliente;
    private $taxaIva;
    private $cambioDia;
    private $moeda;
    private $moedaPagamento;
    private $isencaoIVA;
    private $items = [];
    public function __construct($tipoDocumento, $formaPagamentoId, $observacao, $nomeProprietario, $clienteId, $nomeCliente, $telefoneCliente, $nifCliente, $emailCliente, $enderecoCliente, $taxaIva, $cambioDia, $moeda, $moedaPagamento, $isencaoIVA, $retencao, $valorRetencao)
    {
        $this->tipoDocumento = $tipoDocumento;
        $this->formaPagamentoId = $formaPagamentoId;
        $this->observacao = $observacao;
        $this->nomeProprietario = $nomeProprietario;
        $this->clienteId = $clienteId;
        $this->nomeCliente = $nomeCliente;
        $this->telefoneCliente = $telefoneCliente;
        $this->nifCliente = $nifCliente;
        $this->emailCliente = $emailCliente;
        $this->enderecoCliente = $enderecoCliente;
        $this->taxaIva = $taxaIva;
        $this->cambioDia = $cambioDia;
        $this->moeda = $moeda;
        $this->retencao = $retencao;
        $this->valorRetencao = $valorRetencao;
        $this->moedaPagamento = $moedaPagamento;
        $this->isencaoIVA = $isencaoIVA;
    }
    public function addItem(FaturaItemServicoComercial $items)
    {
        $this->items[] = $items;
    }
    public function getTipoDocumento()
    {
        return $this->tipoDocumento;
    }
    public function getProprietario()
    {
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
    public function getMoeda()
    {
        return $this->moeda;
    }
    public function getMoedaPagamento()
    {
        return $this->moedaPagamento;
    }
    public function getFormaPagamentoId()
    {
        if ($this->getTipoDocumento() == 3) return null;
        if ($this->getTipoDocumento() == 2) return 2;
        return $this->formaPagamentoId;
    }
    public function getObservacao()
    {
        return $this->observacao;
    }
    public function getIsencaoIVA()
    {
        return $this->isencaoIVA;
    }
    public function getTaxaIva()
    {
        return $this->taxaIva;
    }
    public function getCambioDia()
    {
        return $this->cambioDia;
    }
    public function getItems(): array
    {
        return $this->items;
    }
    public function getRetencao()
    {
        return $this->retencao;
    }
    public function getValorRetencao()
    {
        return ($this->getValorIliquido() * $this->getTaxaRetencao()) / 100;
    }
    public function getContraValor()
    {
        return $this->getTotal() / $this->getCambioDia();
    }
    public function getTaxaRetencao()
    {
        return $this->valorRetencao;
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
