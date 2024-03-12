<?php

namespace App\Application\UseCase\Empresa\Saft;

use App\Domain\Entity\Empresa\Saft\BillingAddress;
use App\Domain\Entity\Empresa\Saft\CompanyAddress;
use App\Domain\Entity\Empresa\Saft\CreditNotes;
use App\Domain\Entity\Empresa\Saft\CreditNotesLine;
use App\Domain\Entity\Empresa\Saft\Customer;
use App\Domain\Entity\Empresa\Saft\Header;
use App\Domain\Entity\Empresa\Saft\Invoice;
use App\Domain\Entity\Empresa\Saft\InvoiceLine;
use App\Domain\Entity\Empresa\Saft\MasterFiles;
use App\Domain\Entity\Empresa\Saft\Payment;
use App\Domain\Entity\Empresa\Saft\PaymentLine;
use App\Domain\Entity\Empresa\Saft\Product;
use App\Domain\Entity\Empresa\Saft\SourceDocuments;
use App\Domain\Entity\Empresa\Saft\TaxTableEntry;
use App\Domain\Entity\Empresa\Saft\WorkDocument;
use App\Models\empresa\Factura;
use App\Models\empresa\NotaCredito;
use App\Models\empresa\Recibos;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;


class GeradorDoFicheiroSaft
{
    public function execute()
    {
        $startDate = '2023-01-01 01:00';
        $endDate = '2024-03-12 23:59';

        $empresaAdmin = DB::connection('mysql')->table('empresas')->where('id', 1)->first();
        $companyAddress = new CompanyAddress($empresaAdmin->endereco, 'Luanda', 'Luanda', 'AO');
        $header = new Header(
            '1.01_01',
            $empresaAdmin->nif,
            $empresaAdmin->nif,
            'F',
            $empresaAdmin->nome,
            $companyAddress,
            Carbon::parse(Carbon::now())->format('Y'),
            date_format(date_create($startDate), "Y-m-d"),
            date_format(date_create($endDate), "Y-m-d"),
            'AOA',
            Carbon::parse(Carbon::now())->format('Y-m-d'),
            'Global',
            $empresaAdmin->nif,
            '384/AGT/2022',
            'Mutue-Negócios/MUTUE- SOLUÇOES TECNOLOGIA INTELIGENTES, LDA',
            '1.0.0',
            $empresaAdmin->pessoal_Contacto,
            $empresaAdmin->email,
            $empresaAdmin->website
        );



        //Start MasterFiles
        $masterFiles = new MasterFiles();
        //Customers
        $customersData = DB::table('clientes')->where('empresa_id', auth()->user()->empresa_id)->get();
        foreach ($customersData as $customer) {
            if ($customer->nif == '999999999') {
                $CustomerID = $customer->id;
                $AccountID = "Desconhecido";
                $CustomerTaxID = $customer->nif;
                $CompanyName = "Consumidor Final";
                $AddressDetail = "Desconhecido";
                $City = "Desconhecido";
                $Country = "Desconhecido";
            } else {
                $CustomerID = $customer->id;
                $AccountID = $customer->nif;
                $CustomerTaxID = $customer->nif;
                $CompanyName = $customer->nome;
                $AddressDetail = $customer->endereco;
                $City = $customer->cidade;
                $Country = "AO";
            }
            $customer = new Customer(
                $CustomerID,
                $AccountID,
                $CustomerTaxID,
                $CompanyName,
                new BillingAddress(
                    $AddressDetail,
                    $City,
                    $Country
                ),
                0
            );
            $masterFiles->addCustomer($customer);
        }
        // Products
        $productsData = DB::table('produtos')->where('empresa_id', auth()->user()->empresa_id)->get();
        foreach ($productsData as $product) {
            $product = new Product('S', $product->id, 'N/A', $product->designacao, $product->id);
            $masterFiles->addProduct($product);
        }
        //Taxas IVA
        $taxTableEntriesData = DB::table('tipotaxa')->get();
        foreach ($taxTableEntriesData as $taxTableEntriy) {
            $TaxType = $taxTableEntriy->taxa > 0 ? "IVA" : "NS";
            $TaxCode = $taxTableEntriy->taxa > 0 ? "NOR" : "NS";
            $Description = $taxTableEntriy->taxa > 0 ? "Taxa Normal" : "Isenta";
            $TaxPercentage = $taxTableEntriy->taxa;
            $taxTableEntriy = new TaxTableEntry(
                $TaxType,
                $TaxCode,
                $Description,
                $TaxPercentage
            );
            $masterFiles->addTaxTableEntry($taxTableEntriy);
        }
        //End MasterFiles
        //Start SourcesDocuments
        $faturasData = Factura::with(['tipoDocumentoSigla', 'facturas_items', 'facturas_items.produto.motivoIsencao'])
            ->whereIn('tipoDocumento', [1, 2])
            ->orderBy('created_at', 'asc')
            ->get();
        $notasCreditoData = NotaCredito::with(['factura', 'factura.facturas_items'])->whereNotNull('facturaId')
            ->orderBy('created_at', 'asc')
            ->get();

        $NumberOfEntries = count($faturasData) + count($notasCreditoData);

        $TotalDebit = DB::table('notas_creditos')
            ->join('facturas', 'facturas.id', '=', 'notas_creditos.facturaId')
            ->whereNotNull('facturaId')
            ->orderBy('created_at', 'asc')
            ->sum('facturas.valorIliquido');

        $TotalCredit = DB::table('facturas')
            ->where('anulado', 'N')
            ->whereIn('tipoDocumento', [1, 2])
            ->orderBy('created_at', 'asc')
            ->sum('valorIliquido');

        $sourcesDocuments = new SourceDocuments(
            $NumberOfEntries,
            $TotalDebit,
            $TotalCredit
        );
        foreach ($faturasData as $invoice) {
            $InvoiceStatus = $invoice->anulado == 'N' ? "N" : "A";
            $InvoiceStatusDate = Carbon::parse($invoice->created_at)->format('Y-m-d') . "T" . Carbon::parse($invoice->created_at)->format("H:i:s");
            $SourceBilling = 'P';
            $HashControl = 1;
            $Period = Carbon::parse($invoice->created_at)->format('m');
            $invoiceDate = Carbon::parse($invoice->created_at)->format('Y-m-d');
            $SelfBillingIndicator = 0;
            $CashVATSchemeIndicator = 0;
            $ThirdPartiesBillingIndicator = 0;
            $SystemEntryDate = str_replace(' ', 'T', $invoice->created_at);
            $Desconto = 0;
            $TaxPayable = $invoice->valorImposto - $Desconto;
            $NetTotal = $invoice->valorIliquido;
            $GrossTotal = $TaxPayable + $NetTotal;

            $invoiceEntity = new Invoice(
                $invoice->numeracaoFactura,
                $InvoiceStatus,
                $InvoiceStatusDate,
                $invoice->user_id,
                $SourceBilling,
                $invoice->hashValor,
                $HashControl,
                $Period,
                $invoiceDate,
                $invoice->tipoDocumentoSigla->sigla,
                $SelfBillingIndicator,
                $CashVATSchemeIndicator,
                $ThirdPartiesBillingIndicator,
                $SystemEntryDate,
                $invoice->clienteId,
                number_format($TaxPayable, 2, '.', ''),
                number_format($NetTotal, 2, '.', ''),
                number_format($GrossTotal, 2, '.', '')
            );
            $sourcesDocuments->addInvoice($invoiceEntity);
            foreach ($invoice->facturas_items as $key => $Line) {
                $Line = (object)$Line;
                $UnitOfMeasure = "un";
                $Description = $invoice->observacao ? $invoice->observacao : 'FACTURA ' . $invoice->numeracaoFactura;
                $TaxType = $Line->taxaIva > 0 ? "IVA" : "NS";
                $TaxCountryRegion = "AO";
                $TaxCode = $Line->taxaIva > 0 ? "NOR" : "NS";
                $TaxPercentage = $Line->taxaIva;
                $TaxExemptionReason = $Line->produto->motivoIsencao->descricao;
                $TaxExemptionCode = $Line->produto->motivoIsencao->codigoMotivo;

                $invoiceLine = new InvoiceLine(
                    ++$key,
                    $Line->produtoId,
                    $Line->nomeProduto,
                    number_format($Line->quantidade, 1, '.', ''),
                    $UnitOfMeasure,
                    $Line->total,
                    Carbon::parse($invoice->created_at)->format('Y-m-d'),
                    $Description,
                    number_format($Line->total, 2, ".", ""),
                    $TaxType,
                    $TaxCountryRegion,
                    $TaxCode,
                    $TaxPercentage,
                    $TaxExemptionReason,
                    $TaxExemptionCode,
                    $Line->desconto
                );
                $invoiceEntity->addInvoiceLine($invoiceLine);
            }

        }

        foreach ($notasCreditoData as $invoice) {
            $InvoiceStatus = "N";
            $InvoiceStatusDate = Carbon::parse($invoice->created_at)->format('Y-m-d') . "T" . Carbon::parse($invoice->created_at)->format("H:i:s");
            $SourceBilling = 'P';
            $HashControl = 1;
            $Period = Carbon::parse($invoice->created_at)->format('m');
            $invoiceDate = Carbon::parse($invoice->created_at)->format('Y-m-d');
            $SelfBillingIndicator = 0;
            $CashVATSchemeIndicator = 0;
            $ThirdPartiesBillingIndicator = 0;
            $SystemEntryDate = str_replace(' ', 'T', $invoice->created_at);
            $InvoiceType = "NC";
            $Desconto = 0;
            $TaxPayable = $invoice->factura->valorImposto - $Desconto;
            $NetTotal = $invoice->factura->valorIliquido;
            $GrossTotal = $TaxPayable + $NetTotal;

            $invoiceEntity = new CreditNotes(
                $invoice->numDoc,
                $InvoiceStatus,
                $InvoiceStatusDate,
                $invoice->userId,
                $SourceBilling,
                $invoice->hash,
                $HashControl,
                $Period,
                $invoiceDate,
                $InvoiceType,
                $SelfBillingIndicator,
                $CashVATSchemeIndicator,
                $ThirdPartiesBillingIndicator,
                $SystemEntryDate,
                $invoice->factura->clienteId,
                number_format($TaxPayable, 2, '.', ''),
                number_format($NetTotal, 2, '.', ''),
                number_format($GrossTotal, 2, '.', '')
            );
            $sourcesDocuments->addInvoice($invoiceEntity);
            foreach ($invoice->factura->facturas_items as $key => $Line) {
                $Line = (object)$Line;
                $UnitOfMeasure = "un";
                $TaxType = $Line->taxaIva > 0 ? "IVA" : "NS";
                $TaxCountryRegion = "AO";
                $TaxCode = $Line->taxaIva > 0 ? "NOR" : "NS";
                $TaxPercentage = $Line->taxaIva;
                $TaxExemptionReason = $Line->produto->motivoIsencao->descricao;
                $TaxExemptionCode = $Line->produto->motivoIsencao->codigoMotivo;
                $Reason = $invoice->descricao ?? "Anulação do documento " . $invoice->factura->numeracaoFactura;
                $invoiceLine = new CreditNotesLine(
                    ++$key,
                    $Line->produtoId,
                    $Line->nomeProduto,
                    number_format($Line->quantidade, 1, '.', ''),
                    $UnitOfMeasure,
                    $Line->total,
                    Carbon::parse($invoice->created_at)->format('Y-m-d'),
                    $invoice->factura->numeracaoFactura,
                    $Reason,
                    $Line->nomeProduto,
                    number_format($Line->total, 2, ".", ""),
                    $TaxType,
                    $TaxCountryRegion,
                    $TaxCode,
                    $TaxPercentage,
                    $TaxExemptionReason,
                    $TaxExemptionCode,
                    $Line->desconto
                );
                $invoiceEntity->addInvoiceLine($invoiceLine);
            }
        }
        //start WorkDocuments
        $faturasProformaData = Factura::with(['tipoDocumentoSigla', 'facturas_items', 'facturas_items.produto.motivoIsencao'])
            ->orderBy('created_at', 'asc')
            ->where('tipoDocumento', 3)
            ->get();

        $WorkTotalDebit = 0;
        $WorkTotalCredit = DB::table('facturas')
            ->where('anulado', 'N')
            ->where('tipoDocumento', 3)
            ->orderBy('created_at', 'asc')
            ->sum('valorIliquido');


        $WorkNumberOfEntries = count($faturasProformaData);
        $sourcesDocuments->setHeaderWorkDocument(
            $WorkNumberOfEntries,
            $WorkTotalDebit,
            $WorkTotalCredit);

        foreach ($faturasProformaData as $invoice) {
            $WorkStatus = $invoice->anulado == "N"?"N":"A";
            $InvoiceStatusDate = Carbon::parse($invoice->created_at)->format('Y-m-d') . "T" . Carbon::parse($invoice->created_at)->format("H:i:s");
            $SourceBilling = 'P';
            $HashControl = 1;
            $Period = Carbon::parse($invoice->created_at)->format('m');
            $SystemEntryDate = Carbon::parse($invoice->created_at)->format('Y-m-d') . "T" . Carbon::parse($invoice->created_at)->format("H:i:s");
            $Desconto = 0;
            $invoiceDate = Carbon::parse($invoice->created_at)->format('Y-m-d');
            $TaxPayable = $invoice->valorImposto - $Desconto;
            $NetTotal = $invoice->valorIliquido;
            $GrossTotal = $TaxPayable + $NetTotal;
            $DocumentNumber = str_replace("FP", "PP", $invoice->numeracaoFactura);
            $workDocument = new WorkDocument(
                $DocumentNumber,
                $WorkStatus,
                $InvoiceStatusDate,
                $invoice->user_id,
                $SourceBilling,
                $invoice->hashValor,
                $HashControl,
                $Period,
                $invoiceDate,
                'PP',
                $SystemEntryDate,
                '',
                $invoice->clienteId,
                number_format($TaxPayable, 2, '.', ''),
                number_format($NetTotal, 2, '.', ''),
                number_format($GrossTotal, 2, '.', '')
            );
            $sourcesDocuments->addWorkDocument($workDocument);
            foreach ($invoice->facturas_items as $key => $Line) {
                $Line = (object)$Line;
                $UnitOfMeasure = "un";
                $Description = $invoice->observacao ? $invoice->observacao : 'FACTURA ' . $invoice->numeracaoFactura;
                $TaxType = $Line->taxaIva > 0 ? "IVA" : "NS";
                $TaxCountryRegion = "AO";
                $TaxCode = $Line->taxaIva > 0 ? "NOR" : "NS";
                $TaxPercentage = $Line->taxaIva;
                $TaxExemptionReason = $Line->produto->motivoIsencao->descricao;
                $TaxExemptionCode = $Line->produto->motivoIsencao->codigoMotivo;

                $invoiceLine = new InvoiceLine(
                    ++$key,
                    $Line->produtoId,
                    $Line->nomeProduto,
                    number_format($Line->quantidade, 1, '.', ''),
                    $UnitOfMeasure,
                    $Line->total,
                    Carbon::parse($invoice->created_at)->format('Y-m-d'),
                    $Description,
                    number_format($Line->total, 2, ".", ""),
                    $TaxType,
                    $TaxCountryRegion,
                    $TaxCode,
                    $TaxPercentage,
                    $TaxExemptionReason,
                    $TaxExemptionCode,
                    $Line->desconto
                );
                $workDocument->addInvoiceLine($invoiceLine);
            }
        }
        //end WorkDocuments

        //start Payments
        $recibosData = Recibos::with(['factura'])
            ->where('empresaId', auth()->user()->empresa_id)
            ->orderBy('created_at', 'asc')
            ->get();

        $PaymentNumberOfEntries = count($recibosData);
        $PaymentTotalDebit = 0;
        $PaymentTotalCredit = DB::table('recibos')
            ->where('anulado', "N") //recibo não anulado
            ->where('empresaId', auth()->user()->empresa_id)
            ->orderBy('created_at', 'asc')
            ->sum('totalEntregue');

        $sourcesDocuments->setHeaderPaymentDocument(
            $PaymentNumberOfEntries,
            $PaymentTotalDebit,
            $PaymentTotalCredit);

        foreach ($recibosData as $payment){

            $Period = Carbon::parse($payment->created_at)->format('m');
            $TransactionDate = Carbon::parse($payment->created_at)->format('Y-m-d');
            $PaymentType = "RC";
            $PaymentStatus = $payment->anulado == "N"?"N":"A";
            $PaymentStatusDate = Carbon::parse($payment->created_at)->format('Y-m-d') . "T" . Carbon::parse($payment->created_at)->format("H:i:s");
            $SourcePayment = 'P';
            $PaymentDate = Carbon::parse($payment->created_at)->format('Y-m-d');
            $SystemEntryDate = Carbon::parse($payment->created_at)->format('Y-m-d') . "T" . Carbon::parse($payment->created_at)->format("H:i:s");

            $TaxPayable = 0;
            $NetTotal = $payment->totalEntregue;
            $GrossTotal = $payment->totalEntregue;

            $paymentEntity = new Payment(
                $payment->numeracaoRecibo,
                $Period,
                $TransactionDate,
                $PaymentType,
                $payment->userId,
                $PaymentStatus,
                $PaymentStatusDate,
                $payment->userId,
                $SourcePayment,
                $payment->totalEntregue,
                $PaymentDate,
                $SystemEntryDate,
                $payment->clienteId,
                $TaxPayable,
                $NetTotal,
                $GrossTotal
            );
            $sourcesDocuments->addPayment($paymentEntity);
            $LineNumer = 1;
            $SettlementAmount = 0;
            $paymentLine = new PaymentLine(
                $LineNumer,
                $payment->factura->numeracaoFactura,
                Carbon::parse($payment->factura->created_at)->format('Y-m-d'),
                $SettlementAmount,
                $GrossTotal
            );
            $paymentEntity->addPaymentLine($paymentLine);
        }
        //end Payments
        //end SourcesDocuments
        $header->addMasterFile($masterFiles);
        $header->addSourceDocument($sourcesDocuments);
//        dd($header->toXML());
        $xmlString = $header->toXML();

        $fileName = 'xml_' . time() . '.xml';

        // Salvar o conteúdo XML em um arquivo temporário
        $filePath = storage_path('app/' . $fileName);
        file_put_contents($filePath, $xmlString);
        // Retornar o arquivo XML para download
        return response()->download($filePath, $fileName)->deleteFileAfterSend(true);
    }

}
