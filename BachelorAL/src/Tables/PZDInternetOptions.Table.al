table 50103 "PZD Internet Options"
{
    Caption = 'PZD Internet Options';
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
                    NoSeriesManagement.TestManual(ShopSetup."Internet Nos.");
                end;
            end;
        }
        field(20; "Plan Name"; Text[50])
        {
            Caption = 'Plan Name';
            DataClassification = ToBeClassified;
        }
        field(30; Amount; Integer)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(40; Speed; Integer)
        {
            Caption = 'Speed';
            DataClassification = ToBeClassified;
        }
        field(50; Price; Decimal)
        {
            Caption = 'Plan Price';
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

    trigger OnInsert()
    var
        ShopSetup: Record "PZD Shop Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoSeries: Code[20];
        UserRolesManagement: Codeunit "PZD User Roles Management";
    begin
        if "No." = '' then begin
            ShopSetup.Get();
            ShopSetup.TestField("Internet Nos.");
            NoSeriesManagement.InitSeries(ShopSetup."Internet Nos.", '', 0D, "No.", NoSeries);
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
