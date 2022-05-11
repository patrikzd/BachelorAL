table 50106 "PZD Customer Order"
{
    Caption = 'PZD Customer Order';
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
                    NoSeriesManagement.TestManual(ShopSetup."Order Nos.");
                end;
            end;
        }
        field(20; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = "PZD Customers";

            trigger OnValidate()
            var
                Customers: Record "PZD Customers";
            begin
                Customers.Get(Rec."Customer No.");
                Rec."Customer Name" := Customers.Name;
                Rec."Customer Last Name" := Customers."Last Name";
                Rec.Address := Customers.Address;
                "Document Date" := System.Today;
            end;
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

            trigger OnValidate()
            var
                Expr: Text[30];
            begin
                Expr := '<30D>';
                "Payment Due" := CalcDate(Expr, "Document Date");
            end;
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
            TableRelation = if ("Item Type" = const("Internet Plan")) "PZD Internet Options"
            else
            if ("Item Type" = const(Phone)) "PZD Phones";

            trigger OnValidate()
            var
                Phones: Record "PZD Phones";
                InternetOptions: Record "PZD Internet Options";
            begin
                if ("Item Type" = "Item Type"::Phone) then begin
                    Phones.Get("Item No.");
                    Price := Phones.Price;
                    "Payment Period" := "Payment Period"::"Full Price";
                end else begin
                    InternetOptions.Get("Item No.");
                    Price := InternetOptions.Price;
                end;
                Rec."Payment Amount Left" := Rec.Price;
                Rec.ModelName := Phones.ModelName;
                Rec."Memory Size" := Phones."Memory Size";
                Rec.Color := Phones.Color;
            end;
        }
        field(100; "Payment Period"; Enum "PZD Payment Period")
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Expr1: Text[30];
                Expr2: Text[30];
            begin
                Expr1 := '<CM+12M>';
                Expr2 := '<CM+24M>';
                if ("Payment Period" = "Payment Period"::"12 Months") then begin
                    "Document End Date" := CalcDate(Expr1, "Document Date");
                    if ("Item Type" = "Item Type"::Phone) then
                        Price := Price / 12
                    else
                        "Payment Amount Left" := Price * 12;
                end else
                    if ("Payment Period" = "Payment Period"::"24 Months") then begin
                        "Document End Date" := CalcDate(Expr2, "Document Date");
                        if ("Item Type" = "Item Type"::Phone) then
                            Price := Price / 24
                        else
                            "Payment Amount Left" := Price * 24;
                    end;

            end;
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

            trigger OnValidate()
            var
                CustomProcedures: Codeunit "PZD Custom Procedures";
                Expr: Text[30];
            begin
                Expr := '<+30D>';
                "Last Payment Done" := System.Today;
                //"Payment Due" := CalcDate(Expr, "Payment Due");
                if "Payment Amount Left" <= 0 then
                    CustomProcedures.PostOrder(Rec);
            end;
        }
        field(131; "Last Payment Done"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(132; "Payment Due"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(140; "Consultant ID"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(150; ModelName; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(160; Color; Enum "PZD Phone Color")
        {
            Caption = 'Color';
            DataClassification = ToBeClassified;
        }
        field(170; "Memory Size"; Enum "PZD Memory Size")
        {
            Caption = 'Memory Size';
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
    begin
        if "No." = '' then begin
            ShopSetup.Get();
            ShopSetup.TestField("Order Nos.");
            NoSeriesManagement.InitSeries(ShopSetup."Phone Nos.", '', 0D, "No.", NoSeries);
        end;
    end;
}
