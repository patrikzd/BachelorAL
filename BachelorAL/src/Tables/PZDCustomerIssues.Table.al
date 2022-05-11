table 50105 "PZD Customer Issues"
{
    Caption = 'PZD Customer Issues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Issue No."; Code[20])
        {
            Caption = 'Issue No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ShopSetup: Record "PZD Shop Setup";
                NoSeriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Issue No." <> xRec."Issue No." then begin
                    ShopSetup.Get();
                    NoSeriesManagement.TestManual(ShopSetup."Issue Nos.");
                end;
            end;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
        }
        field(20; "Task Assigned to"; Code[50])
        {
            Caption = 'Task Assigned to';
            DataClassification = ToBeClassified;
            TableRelation = User;

            trigger OnValidate()
            var
                UserRolesManagement: Codeunit "PZD User Roles Management";
            begin
                UserRolesManagement.AssignTechnician();
                "Task Assigned" := true;
            end;
        }
        field(30; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
        }
        field(40; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(50; "Customer Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Last Name';
        }
        field(60; "Customer Address"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Address';
        }
        field(70; "Task Assigned"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80; Status; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Issue No.", "Customer No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ShopSetup: Record "PZD Shop Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoSeries: Code[20];
    begin
        if "Issue No." = '' then begin
            ShopSetup.Get();
            ShopSetup.TestField("Internet Nos.");
            NoSeriesManagement.InitSeries(ShopSetup."Issue Nos.", '', 0D, "Issue No.", NoSeries);
        end;
    end;
}
