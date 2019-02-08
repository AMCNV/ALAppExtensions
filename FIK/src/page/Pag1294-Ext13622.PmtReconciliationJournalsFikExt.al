pageextension 13622 PmtReconciliationJournals extends "Pmt. Reconciliation Journals"
{
    actions
    {
        addafter(ImportBankTransactionsToNew)
        {
            action(ImportFik)
            {
                Ellipsis = true;
                Caption = 'Import &FIK Statement';
                ToolTip = 'Import a file with FIK payments. The Fik payments are automatically applied as suggestions.';
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedIsBig = true;
                Image = Import;
                PromotedCategory = New;
                trigger OnAction();
                begin
                    ImportAndProcessToNewFIK();
                end;
            }
        }
    }
}