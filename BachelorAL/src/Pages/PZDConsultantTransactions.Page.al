page 50116 "PZD Consultant Transactions"
{
    Caption = 'PZD Consultant Transactions';
    PageType = ListPart;
    SourceTable = "PZD Customer Order";
    CardPageId = "PZD Customer Order Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field("Customer Last Name"; Rec."Customer Last Name")
                {
                    ToolTip = 'Specifies the value of the Customer Last Name field.';
                    ApplicationArea = All;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ToolTip = 'Specifies the value of the Item Type field.';
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                    ApplicationArea = All;
                }
                field("Document End Date"; Rec."Document End Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                    ApplicationArea = All;
                }
                field("Payment Amount Left"; Rec."Payment Amount Left")
                {
                    ToolTip = 'Specifies the Amount of payments left';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {
                ApplicationArea = All;
                Image = Open;

                trigger OnAction()
                var
                    CustomerOrderCard: Page "PZD Customer Order Card";
                begin
                    CustomerOrderCard.SetRecord(Rec);
                    CustomerOrderCard.Run();
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId());
        if UserSetup.UserRoles <> UserSetup.UserRoles::Manager then
            Rec.SetRange("Consultant ID", UserSetup."User ID");
    end;
}
