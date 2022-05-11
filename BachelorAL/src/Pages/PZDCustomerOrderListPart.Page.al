page 50122 "PZD Customer Order ListPart"
{
    Caption = 'Customer Orders';
    PageType = ListPart;
    SourceTable = "PZD Customer Order";
    CardPageId = "PZD Customer Order Card";
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
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ApplicationArea = All;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ToolTip = 'Specifies the value of the Item Type field.';
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
}
