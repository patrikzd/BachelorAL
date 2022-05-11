page 50107 "PZD Phone List"
{
    Caption = 'Phone List';
    PageType = List;
    SourceTable = "PZD Phones";
    CardPageId = "PZD Phone Card";
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
                field(ModelName;Rec.ModelName)
                {
                    ToolTip = 'Specifies the Model Name';
                    ApplicationArea = All;
                }
                field(Availability; Rec.Availability)
                {
                    ApplicationArea = All;
                }
            }
            
        }
    }
}
