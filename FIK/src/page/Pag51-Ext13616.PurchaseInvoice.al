pageextension 13616 PurchaseInvoice extends "Purchase Invoice"
{
    layout
    {
        addafter("Creditor No.")
        {
            field("Giro Acc. No."; GiroAccNo)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the vendor''s giro account.';
            }
        }
    }
}