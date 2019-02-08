pageextension 13623 CustLedgerEntries extends "Customer Ledger Entries"
{
    actions
    {
        addafter(IncomingDocAttachFile)
        {
            action(ExportPaymentsToFile)
            {
                Caption = 'Export Payments to File';
                ToolTip = 'Export a file with the payment information from the ledger entries.';
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedIsBig = true;
                Image = ExportFile;
                PromotedCategory = Process;
                trigger OnAction();
                var
                    CustLedgerEntry: Record "Cust. Ledger Entry";
                    PmtExportMgtCustLedgEntry: Codeunit "Pmt Export Mgt Cust Ledg Entry";
                begin
                    CurrPage.SETSELECTIONFILTER(CustLedgerEntry);
                    CustLedgerEntry.FINDFIRST();
                    PmtExportMgtCustLedgEntry.ExportCustPaymentFileYN(CustLedgerEntry);
                end;
            }
        }
    }
}