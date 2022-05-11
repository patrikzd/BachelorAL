page 50115 "PZD Internet Plans List Part"
{
    Caption = 'Internet Plans';
    PageType = ListPart;
    SourceTable = "PZD Internet Options";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Plan Name"; Rec."Plan Name")
                {
                    ToolTip = 'Specifies the value of the Plan Name field.';
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies Internet Plan Price.';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    ApplicationArea = All;
                }
                field(Speed; Rec.Speed)
                {
                    ToolTip = 'Specifies the value of the Speed field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Choose Internet Plan")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CustomerOrder: Record "PZD Customer Order";
                begin
                    CustomerOrder.FindLast();
                    CustomerOrder.Validate("Item No.", Rec."No.");
                    CustomerOrder.Modify();
                end;
            }
        }
    }
}
