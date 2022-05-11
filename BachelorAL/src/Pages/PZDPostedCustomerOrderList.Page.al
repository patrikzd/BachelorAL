page 50119 "PZD Posted Customer Order List"
{
    ApplicationArea = All;
    Caption = 'Posted Customer Order List';
    PageType = List;
    SourceTable = "PZD Posted Customer Order";
    UsageCategory = Lists;
    CardPageId = "PZD Posted Customer Order Card";
    
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
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
