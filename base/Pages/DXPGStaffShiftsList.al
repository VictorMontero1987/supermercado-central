page 50050 "DXPG Staff Shifts List"
{
    ApplicationArea = All;
    Caption = 'Staff Shifts List';
    PageType = List;
    SourceTable = "DX staff shifts";
    UsageCategory = Lists;
    CardPageId = "DXPG Staff Shifts Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
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
