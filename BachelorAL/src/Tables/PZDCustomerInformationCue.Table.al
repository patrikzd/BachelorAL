table 50100 "PZD Customer Information Cue"
{
    Caption = 'Customer Information';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;"Primary Key"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(20; "Number Of Customers"; Integer)
        {
            Caption = 'Number of Customers';
            FieldClass = FlowField;
            CalcFormula = count("PZD Customers");
        }
        field(30; "Number of Internet Options"; Integer)
        {
            Caption = 'Internet Plans Available';
            FieldClass = FlowField;
            CalcFormula = count("PZD Internet Options");
        }
        field(40; "Number of Various Phones"; Integer)
        {
            Caption = 'Available Phone Models';
            FieldClass = FlowField;
            CalcFormula = count("PZD Phones");
        }
        field(50; "Time Sheets Available"; Integer)
        {
            Caption = 'Available Time Sheets';
            FieldClass = FlowField;
            CalcFormula = count("Time Sheet Header");
        }
        field(60; "Unassigned Issues"; Integer)
        {
            Caption = 'Unassigned Customer Issues';
            FieldClass = FlowField;
            CalcFormula = count("PZD Customer Issues" where("Task Assigned" = const(false)));
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}