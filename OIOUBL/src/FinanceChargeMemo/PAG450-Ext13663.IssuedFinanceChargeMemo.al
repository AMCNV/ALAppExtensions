pageextension 13663 "OIOUBL-IssuedFinanceChargeMemo" extends "Issued Finance Charge Memo"
{
    layout
    {
        addafter(Contact)
        {
            field("OIOUBL-Contact Phone No."; "OIOUBL-Contact Phone No.")
            {
                Tooltip = 'Specifies the telephone number of the contact person at the customer.';
                ApplicationArea = Basic, Suite;
            }
            field("OIOUBL-Contact Fax No."; "OIOUBL-Contact Fax No.")
            {
                Tooltip = 'Specifies the fax number of the contact person at the customer.';
                ApplicationArea = Basic, Suite;
            }
            field("OIOUBL-Contact E-Mail"; "OIOUBL-Contact E-Mail")
            {
                Tooltip = 'Specifies the email address of the contact person at the customer.';
                ApplicationArea = Basic, Suite;
            }
            field("OIOUBL-Contact Role"; "OIOUBL-Contact Role")
            {
                Tooltip = 'Specifies the role of the contact person at the customer.';
                ApplicationArea = Basic, Suite;
            }
        }

        addafter("Currency Code")
        {
            field("OIOUBL-GLN"; "OIOUBL-GLN")
            {
                Tooltip = 'Specifies the GLN location number for the customer.';
                ApplicationArea = Basic, Suite;
            }
            field("OIOUBL-Account Code"; "OIOUBL-Account Code")
            {
                Tooltip = 'Specifies the account code of the customer.';
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        addbefore("&Print")
        {
            group("OIOUBL-F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";

                action(CreateElectronicInvoice)
                {
                    Caption = 'Create Electronic Finance Charge Memo';
                    Tooltip = 'Create an electronic version of the current document.';
                    ApplicationArea = Basic, Suite;
                    Promoted = True;
                    Ellipsis = true;
                    Image = ElectronicDoc;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        IssuedFinChrgMemoHeader: Record "Issued Fin. Charge Memo Header";
                    begin
                        IssuedFinChrgMemoHeader := Rec;
                        IssuedFinChrgMemoHeader.SETRECFILTER();

                        REPORT.RUNMODAL(REPORT::"OIOUBL-Create E-Fin Chrg Memos", TRUE, FALSE, IssuedFinChrgMemoHeader);
                    end;
                }
            }
        }
    }
}