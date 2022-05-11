page 50114 "PZD Phone List Part"
{
    Caption = 'Phones';
    PageType = ListPart;
    SourceTable = "PZD Phones";
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
                field(ModelName; Rec.ModelName)
                {
                    ToolTip = 'Specifies the Model Name';
                    ApplicationArea = All;
                }
                field("Phone Type"; Rec."Phone Type")
                {
                    ToolTip = 'Specifies the value of the Phone Type field.';
                    ApplicationArea = All;
                }
                field("Memory Size"; Rec."Memory Size")
                {
                    ToolTip = 'Specifies the value of the Memory Size field.';
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                    ApplicationArea = All;
                }
                field(Color; Rec.Color)
                {
                    ToolTip = 'Specifies the value of the Color field.';
                    ApplicationArea = All;
                }
                field(Availability; Rec.Availability)
                {
                    ToolTip = 'Specifies the value of the Availability field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Phone Model")
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
