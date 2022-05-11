page 50105 "PZD Internet Option List"
{
    ApplicationArea = All;
    Caption = 'Internet Options List';
    PageType = List;
    SourceTable = "PZD Internet Options";
    CardPageId = "PZD Internet Option Card";
    UsageCategory = Lists;

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
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies Internet Plan Price.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
