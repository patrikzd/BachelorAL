page 50104 "PZD Consultant Main Activities"
{
    Caption = 'Consultant Main Activities';
    PageType = CardPart;
    SourceTable = "PZD Customer Information Cue";

    layout
    {
        area(Content)
        {
            cuegroup(Activities)
            {
                CuegroupLayout = Wide;
                field("Number Of Customer"; Rec."Number Of Customers")
                {
                    Caption = 'Customer List';
                    ApplicationArea = All;
                    DrillDownPageId = "PZD Customer List";
                }
                field("Number Of Internet Plans"; Rec."Number of Internet Options")
                {
                    Caption = 'Internet Option List';
                    ApplicationArea = All;
                    DrillDownPageId = "PZD Internet Option List";
                }
                field("Number of Various Phones"; Rec."Number of Various Phones")
                {
                    Caption = 'Available Phones List';
                    ApplicationArea = All;
                    DrillDownPageId = "PZD Phone List";
                }
                field(CustomProcedures; CustomProcedures.TimeSheetAvailable)
                {
                    Caption = 'Available Time Sheets';
                    ApplicationArea = All;
                    DrillDownPageId = "Time Sheet List";

                    trigger OnDrillDown()
                    var
                        TimeSheetList: Page "Time Sheet List";
                        TimeSheetHeader: Record "Time Sheet Header";
                        Resource: Record Resource;
                    begin
                        Resource.SetRange("Time Sheet Owner User ID", UserId);
                        Resource.FindFirst();
                        TimeSheetHeader.SetRange("Resource No.",Resource."No.");
                        TimeSheetList.SetTableView(TimeSheetHeader);
                        TimeSheetList.Run();
                    end;
                }

            }

        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    var
        CustomProcedures: Codeunit "PZD Custom Procedures";
}