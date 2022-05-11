table 50107 "PZD Posted Customer Order"
{
    Caption = 'Posted Customer Order';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(20; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = "PZD Customers";
        }
        field(30; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(40; "Customer Last Name"; Text[50])
        {
            Caption = 'Customer Last Name';
            DataClassification = ToBeClassified;
        }
        field(50; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(60; Status; Enum "PZD Order Satus")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            InitValue = Open;
        }
        field(70; Address; Text[50])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(80; "Item Type"; Enum "PZD Item Type")
        {
            Caption = 'Item Type';
            DataClassification = ToBeClassified;
        }
        field(90; "Item No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = if("Item Type" = const("Internet Plan")) "PZD Internet Options"
            else if ("Item Type" = const(Phone)) "PZD Phones";

        }
        field(100; "Payment Period"; Enum "PZD Payment Period")
        {
            DataClassification = ToBeClassified;

        }
        field(110; Price; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(120; "Document End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(130; "Payment Amount Left"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(140; "Consultant ID"; Text[50])
        {
            DataClassification = ToBeClassified;
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
