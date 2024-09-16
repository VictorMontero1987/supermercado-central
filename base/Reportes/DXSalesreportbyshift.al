report 50050 "DX Sales report by shift"
{
    ApplicationArea = All;
    Caption = 'DX Sales report by shift';
    DefaultLayout = RDLC;
    RDLCLayout = 'base\Reportes\Default\layouts\DX Sales report by shifts.rdl';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("<Statement> "; "LSC Posted Statement")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Store No.", "Posted Date";
            column(COMPANYNAME; CompanyName)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(Statement___No__; "No.")
            {
                IncludeCaption = true;
            }
            column(Statement___Store_No__; "Store No.")
            {
                IncludeCaption = true;
            }
            column(Statement___Store_Name; Store.Name)
            {
            }
            column(Statement___StoreNameFixed; StoreNameFixed)
            {
            }
            column(Statement___Trans__Ending_Date_; "Trans. Ending Date")
            {
                IncludeCaption = true;
            }
            column(Statement___Posted_Date_; "Posted Date")
            {
                IncludeCaption = true;
            }
            column(Statement___Sales_Amount_; "Sales Amount")
            {
                IncludeCaption = true;
            }
            column(Statement___Line_Discount_; "Line Discount")
            {
                IncludeCaption = true;
            }
            column(Statement___VAT_Amount_; "VAT Amount")
            {
                IncludeCaption = true;
            }
            column(Statement___Total_Discount_; "Total Discount")
            {
                IncludeCaption = true;
            }
            column(Statement___Income; Income)
            {
                IncludeCaption = true;
            }
            column(Statement___Expenses; Expenses)
            {
                IncludeCaption = true;
            }
            column(Statement___Sales_Amount_____VAT_Amount____Income___Expenses; "Sales Amount" + "VAT Amount" + Income + Expenses)
            {
            }
            dataitem("Posted Statement Line"; "LSC Posted Statement Line")
            {
                DataItemLink = "Statement No." = FIELD("No.");
                DataItemLinkReference = "<Statement> ";
                column(Posted_Statement_Line__Staff_ID_; "Staff ID")
                {
                    IncludeCaption = true;
                }
                column(Posted_Statement_Line__POS_Terminal_No__; "POS Terminal No.")
                {
                    IncludeCaption = true;
                }
                column(Posted_Statement_Line__Tender_Type_; "Tender Type")
                {
                    IncludeCaption = true;
                }
                column(Posted_Statement_Line__Tender_Type_Card_No__; "Tender Type Card No.")
                {
                    IncludeCaption = true;
                }
                column(Posted_Statement_Line__Tender_Type_Name_; "Tender Type Name")
                {
                    IncludeCaption = true;
                }
                column(Posted_Statement_Line__Currency_Code_; "Currency Code")
                {
                    IncludeCaption = true;
                }
                column(Posted_Statement_Line__Counted_Amount_in_LCY_; "Counted Amount in LCY")
                {
                    IncludeCaption = true;
                }
                column(Posted_Statement_Line__Trans__Amount_in_LCY_; "Trans. Amount in LCY")
                {
                    IncludeCaption = true;
                }
                column(Posted_Statement_Line__Difference_in_LCY_; "Difference in LCY")
                {
                    IncludeCaption = true;
                }
                column(GArea_; GArea)
                {

                }
                dataitem("LSC Staff"; "LSC Staff")
                {
                    DataItemLinkReference = "Posted Statement Line";
                    DataItemLink = id = field("staff id");
                    column(shift_LSCStaff; shift)
                    {

                    }
                    column(Last_Name; "Last Name")
                    {

                    }
                    column(First_Name; "First Name")
                    {

                    }
                    column(FullName; FullName)
                    {
                    }
                }
                trigger OnAfterGetRecord()
                var
                    transationHeade: Record "LSC Transaction Header";
                    PaymentEntry: Record "LSC Trans. Payment Entry";
                    "LSCPOSTerminalGroupLine": Record "LSC POS Terminal Group Line";
                begin
                    Clear(transationHeade);
                    transationHeade.SetRange("Posted Statement No.", "Posted Statement Line"."Statement No.");
                    transationHeade.SetRange("Staff ID", "Posted Statement Line"."Staff ID");
                    if transationHeade.FindFirst() then begin
                        Clear(PaymentEntry);
                        PaymentEntry.SetRange("Transaction No.", transationHeade."Transaction No.");
                        PaymentEntry.SetRange("Tender Type", "Posted Statement Line"."Tender Type");
                        PaymentEntry.SetRange("Staff ID", "Posted Statement Line"."Staff ID");
                        if PaymentEntry.FindFirst() then begin
                            Clear(LSCPOSTerminalGroupLine);
                            LSCPOSTerminalGroupLine.SetRange("Store No.", transationHeade."Store No.");
                            LSCPOSTerminalGroupLine.SetRange("POS Terminal No.", PaymentEntry."POS Terminal No.");
                            if LSCPOSTerminalGroupLine.FindFirst() then GArea := LSCPOSTerminalGroupLine."POS Terminal Group Code";

                        end;


                    end;


                end;


            }
            trigger OnAfterGetRecord()
            begin
                CalcFields("Store Name");
                StoreNameFixed := "Store Name";
                if Store.Get("Store No.") then;
                CompanyInformation.Get();
                CompanyInformation.CalcFields(Picture);
                staff.Init();

                "LSC Staff"."First Name" := "LSC Staff"."First Name" + '' + "LSC Staff"."Last Name";

            end;




        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
            }
        }
        actions
        {

        }
    }

    labels
    {
        l_ReportName = 'Sales report by shifts';
        l_Page = 'Page';
        l_Total = 'Total';
        l_SubTotal = 'Sub-Total';
        StatementTotal = 'Sales report by shifts';
    }


    local procedure GetFullName(Name: text; LastName: Text): Text

    begin
        exit(Name + '' + LastName)
    end;

    var
        FullName: Text[100];
        Store: Record "LSC Store";
        StoreNameFixed: Text[50];
        CompanyInformation: Record "Company Information";
        staff: Record "LSC Staff";
        DesdeFecha: Date;
        HastaFecha: Date;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Statement___TotalCaptionLbl: Label 'Statement - Total';
        Statement_No___CaptionLbl: Label 'Statement No.';
        Store_NameCaptionLbl: Label 'Store Name';
        Staff__Name: Label 'Staff Name';
        Sales_Amount_with_DiscountCaptionLbl: Label 'Sales Amount with Discount';
        Statement_TotalCaptionLbl: Label 'Statement Total';
        Tender_Type_NameCaptionLbl: Label 'Tender Type Name';
        TotalCaptionLbl: Label 'Total';

        GArea: code[20];


}
