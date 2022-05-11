page 50121 "PZD Manager Main Activities"
{
    Caption = 'Manager Main Activities';
    PageType = CardPart;
    SourceTable = "PZD Customer Information Cue";

    layout
    {
        area(Content)
        {
            cuegroup(Activities)
            {
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
                field("Time Sheets"; Rec."Time Sheets Available")
                {
                    Caption = 'Available Time Sheets';
                    ApplicationArea = All;
                    DrillDownPageId = "Manager Time Sheet List";
                }
                field("Unassigned Issues"; Rec."Unassigned Issues")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                        CustomerIssueList: Page "PZD Customer Issue List";
                        CustomerIssues: Record "PZD Customer Issues";
                    begin
                        CustomerIssues.SetRange("Task Assigned", false);
                        CustomerIssueList.SetTableView(CustomerIssues);
                        CustomerIssueList.Run();
                    end;
                }
                field(CustomProcedures; CustomProcedures.SalesToday)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Today';

                    trigger OnDrillDown()
                    var
                        CustomerOrderList: Page "PZD Customer Order List";
                        CustomerOrder: Record "PZD Customer Order";
                    begin
                        CustomerOrder.SetRange("Document Date", System.Today);
                        CustomerOrderList.SetTableView(CustomerOrder);
                        CustomerOrderList.Run();
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