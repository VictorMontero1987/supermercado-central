pageextension 50050 "DX LSC Posted Statement List" extends "LSC Posted Statement List"
{
    actions
    {
        addafter("&Print")
        {
            group("Report")
            {
                action("Posted Report")
                {
                    ApplicationArea = All;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction()
                    begin
                        PostedStatement.SetCurrentKey("No.");
                        PostedStatement.SetRange("No.", Rec."No.");
                        REPORT.RunModal(Report::"DX Sales report by shift", true, true, PostedStatement);
                    end;
                }
            }
        }

    }
    var
        PostedStatement: Record "LSC Posted Statement";
}
