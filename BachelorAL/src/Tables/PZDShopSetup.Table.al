table 50102 "PZD Shop Setup"
{
    Caption = 'PZD Shop Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; PK; Code[10])
        {
            Caption = 'PK';
            DataClassification = ToBeClassified;
        }
        field(20; "Reader Nos."; Code[10])
        {
            Caption = 'Reader Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(30; "Internet Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40; "Phone Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50; "Issue Nos."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(60; "Order Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }
}
