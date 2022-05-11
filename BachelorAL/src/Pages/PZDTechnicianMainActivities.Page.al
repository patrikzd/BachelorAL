page 50124 "PZD Technician Main Activities"
{
    Caption = 'Technician Main Activities';
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