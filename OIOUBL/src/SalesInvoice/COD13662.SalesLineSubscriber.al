codeunit 13662 "OIOUBL-Sales Line Suscriber"
{
    [EventSubscriber(ObjectType::Table, 37, 'OnAfterAssignHeaderValues', '', false, false)]
    procedure OnAfterCheckSalesDocCheckOIOUBL(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header");
    begin
        SalesLine."OIOUBL-Account Code" := SalesHeader."OIOUBL-Account Code";
    end;
}