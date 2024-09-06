page 50051 "DXPG Staff Shifts Card"
{
    ApplicationArea = All;
    Caption = 'Staff Shifts Card';
    PageType = Card;
    SourceTable = "DX staff shifts";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Start time"; Rec."Start time")
                {
                    Caption = 'Start time';
                    ToolTip = 'Specifies the value of the Start time field.', Comment = '%';
                }
                field("End time"; Rec."End time")
                {
                    Caption = 'End time';
                    ToolTip = 'Specifies the value of the End time field.', Comment = '%';
                }

            }
        }
    }
}
