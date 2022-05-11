table 50104 "PZD Phones"
{
    Caption = 'PZD Phones';
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
                    NoSeriesManagement.TestManual(ShopSetup."Phone Nos.");
                end;
            end;
        }
        field(20; "Phone Type"; Enum "PZD Phone Types")
        {
            Caption = 'Phone Type';
            DataClassification = ToBeClassified;
        }
        field(30; "Memory Size"; Enum "PZD Memory Size")
        {
            Caption = 'Memory Size';
            DataClassification = ToBeClassified;
        }
        field(40; Price; Decimal)
        {
            Caption = 'Price';
            DataClassification = ToBeClassified;
        }
        field(50; Color; Enum "PZD Phone Color")
        {
            Caption = 'Color';
            DataClassification = ToBeClassified;
        }
        field(60; Availability; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70; ModelName; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Phone Cost"; Decimal)
        {
            Caption = 'Phone Cost';
            DataClassification = ToBeClassified;
        }
        field(130; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
        }
        field(140; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
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
        NoSeries: Code[20];
        UserRolesManagement: Codeunit "PZD User Roles Management";
    begin
        if "No." = '' then begin
            ShopSetup.Get();
            ShopSetup.TestField("Phone Nos.");
            NoSeriesManagement.InitSeries(ShopSetup."Phone Nos.", '', 0D, "No.", NoSeries);
        end;
        UserRolesManagement.CreateRecord();
    end;

    trigger OnModify()
    var
        UserRolesManagement: Codeunit "PZD User Roles Management";
    begin
        UserRolesManagement.ModifyRecord();
    end;
}
