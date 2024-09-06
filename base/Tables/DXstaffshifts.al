table 50050 "DX staff shifts"
{
    Caption = 'DX staff shifts';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';

        }
        field(2; Description; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(3; "Start time"; Time)
        {
            DataClassification = ToBeClassified;
            Caption = 'Start time';
        }
        field(4; "End time"; Time)
        {
            DataClassification = ToBeClassified;
            Caption = 'End time';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
