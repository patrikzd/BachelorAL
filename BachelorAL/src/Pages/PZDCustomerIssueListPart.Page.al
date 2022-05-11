page 50109 "PZD Customer Issue ListPart"
{
    Caption = 'Customer Issues';
    PageType = ListPart;
    SourceTable = "PZD Customer Issues";
    Editable = false;
    CardPageId = "PZD Customer Issue Card";
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
