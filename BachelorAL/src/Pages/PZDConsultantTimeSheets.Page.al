page 50117 "PZD Consultant Time Sheets"
{
    Caption = 'PZD Consultant Time Sheets';
    PageType = CardPart;
    SourceTable = "PZD Customer Information Cue";
    
    layout
    {
        area(content)
        {
            cuegroup(TimeSheets)
            {
                CuegroupLayout = Wide;
                field("Number Of Customer"; 0)
                {
                    Caption = 'Available Time Sheets';
                    ApplicationArea = All;
                    DrillDownPageId = "Time Sheet List";
                }
                // field("Number Of Internet Plans"; Rec."Number of Internet Options")
                // {
                //     Caption = 'Internet Option List';
                //     ApplicationArea = All;
                //     DrillDownPageId = "PZD Internet Option List";
                // }

            }
        }
    }
}
