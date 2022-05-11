page 50111 "PZD Customer Issue List"
{
    ApplicationArea = All;
    Caption = 'Customer Issue List';
    PageType = List;
    SourceTable = "PZD Customer Issues";
    CardPageId = "PZD Customer Issue Card";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Issue No."; Rec."Issue No.")
                {
                    ToolTip = 'Specifies the value of the Issue No. field.';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Task Assigned to"; Rec."Task Assigned to")
                {
                    ToolTip = 'Specifies the value of the Task Assigned to field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
