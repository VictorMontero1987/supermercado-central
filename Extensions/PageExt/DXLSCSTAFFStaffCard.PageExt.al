pageextension 50051 "DX LSC STAFF Staff Card" extends "LSC STAFF Staff Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Inventory Main Menu")
        {
            field("DX shift"; Rec.shift)
            {
                ApplicationArea = All;
                ToolTip = 'shift';
                Caption = 'shift';
                TableRelation = "DX staff shifts".Description;
            }
        }
    }

}
