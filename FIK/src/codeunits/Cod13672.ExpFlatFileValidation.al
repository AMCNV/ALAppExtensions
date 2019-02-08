codeunit 13672 "Exp. Flat File Validation"
{
    TableNo = 81;

    var
        HasErrorsErr: Label 'The file export has one or more errors. For each of the lines to be exported, resolve any errors that are displayed in the File Export Errors FactBox.';

    trigger OnRun();
    var
        GenJnlLine: Record "Gen. Journal Line";
        PaymentExportGenJnlCheck: Codeunit "Payment Export Gen. Jnl Check";
        PaymentMgt: Codeunit PaymentExportManagement;
    begin
        DeletePaymentFileBatchErrors();
        DeletePaymentFileErrors();

        GenJnlLine.COPYFILTERS(Rec);
        IF GenJnlLine.FINDSET() THEN
            REPEAT
                PaymentExportGenJnlCheck.RUN(GenJnlLine);
                PaymentMgt.CheckFormatSpecificPaymentRules(GenJnlLine);
            UNTIL GenJnlLine.NEXT() = 0;

        IF GenJnlLine.HasPaymentFileErrorsInBatch() THEN BEGIN
            COMMIT();
            ERROR(HasErrorsErr);
        END;
    end;
}

