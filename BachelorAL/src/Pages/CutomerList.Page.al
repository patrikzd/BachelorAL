page 50101 "PZD Customer List"
{
    ApplicationArea = All;
    Caption = 'Customer List';
    PageType = List;
    SourceTable = "PZD Customers";
    UsageCategory = Lists;
    CardPageId = "PZD Customer Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
