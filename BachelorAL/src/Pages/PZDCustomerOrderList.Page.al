page 50112 "PZD Customer Order List"
{
    ApplicationArea = All;
    Caption = 'Customer Order List';
    PageType = List;
    SourceTable = "PZD Customer Order";
    UsageCategory = Lists;
    CardPageId = "PZD Customer Order Card";
    
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
