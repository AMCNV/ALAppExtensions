﻿// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Inventory.Intrastat;

pageextension 11785 "Tariff Numbers CZL" extends "Tariff Numbers"
{
    layout
    {
        addafter("Supplementary Units")
        {
            field("Statement Code CZL"; Rec."Statement Code CZL")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the statement code for VAT control report and reverse charge.';
            }
            field("Statement Limit Code CZL"; Rec."Statement Limit Code CZL")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the statement limit code for VAT control report and reverse charge.';
            }
            field("VAT Stat. UoM Code CZL"; Rec."VAT Stat. UoM Code CZL")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the unit of measure code for reverse charge reporting.';
            }
            field("Allow Empty UoM Code CZL"; Rec."Allow Empty UoM Code CZL")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the possibillity to allow or not allow empty unit of meas. code for VAT reverse charge.';
            }
            field("Description EN CZL"; Rec."Description EN CZL")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the english description for tariff number.';
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action("Import Tariff Numbers CZL")
            {
                ApplicationArea = Warehouse;
                Caption = 'Import Tariff Numbers (XML)';
                Image = ImportCodes;
                Ellipsis = true;
                ToolTip = 'Launch importing data from the list of codes published by the Customs Administration of the Czech Republic: https://www.celnisprava.cz/cz/aplikace/Stranky/ciselniky.aspx. Kombinovaná nomenklatura (pro Intrastat).';
                RunObject = report "Import Tariff Numbers XML CZL";
            }
        }
        addfirst(Category_Process)
        {
            actionref("Import Tariff Numbers CZL_Promoted"; "Import Tariff Numbers CZL")
            {
            }
        }
    }
}
