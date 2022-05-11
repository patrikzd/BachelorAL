page 50108 "PZD Phone Card"
{
    Caption = 'PZD Phone Card';
    PageType = Card;
    SourceTable = "PZD Phones";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Phone Type"; Rec."Phone Type")
                {
                    ToolTip = 'Specifies the value of the Phone Type field.';
                    ApplicationArea = All;
                }
                field(ModelName;Rec.ModelName)
                {
                    ToolTip = 'Specifies the Model Name';
                    ApplicationArea = All;
                }
                field("Memory Size"; Rec."Memory Size")
                {
                    ToolTip = 'Specifies the value of the Memory Size field.';
                    ApplicationArea = All;
                }
                field(Color; Rec.Color)
                {
                    ToolTip = 'Specifies the value of the Color field.';
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                    ApplicationArea = All;
                }
                field("Phone Cost"; Rec."Phone Cost")
                {
                    ApplicationArea = All;
                }
                field(Availability; Rec.Availability)
                {
                    ToolTip = 'Specifies the value of the Availability field.';
                    ApplicationArea = All;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
