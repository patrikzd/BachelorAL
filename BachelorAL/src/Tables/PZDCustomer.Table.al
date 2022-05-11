table 50101 "PZD Customers"
{
    Caption = 'PZD Customers';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                ShopSetup: Record "PZD Shop Setup";
                NoSeriesManagement: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    ShopSetup.Get();
                    NoSeriesManagement.TestManual(ShopSetup."Reader Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(21; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
            DataClassification = ToBeClassified;
        }
        field(30; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
        }
        field(40; Address; Text[50])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(50; "No. Series"; Code[20])
        {
            Caption = 'No.Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(60; Bill; Decimal)
        {
            Caption = 'Money due payment';
            DataClassification = ToBeClassified;
        }
        field(70; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
            InitValue = 'LT';
        }
        field(80; "City"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;
        }
        field(90; Email; Text[50])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ShopSetup: Record "PZD Shop Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            ShopSetup.Get();
            ShopSetup.TestField("Reader Nos.");
            NoSeriesManagement.InitSeries(ShopSetup."Reader Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
}
