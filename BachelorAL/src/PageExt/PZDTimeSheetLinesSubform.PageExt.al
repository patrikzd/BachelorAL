pageextension 50103 "PZD Time Sheet Lines Subform" extends "Time Sheet Lines Subform"
{
    layout
    {
        modify(UnitOfMeasureCode)
        {
            Visible = false;
        }
        modify(TimeSheetTotalQuantity)
        {
            Visible = false;
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        v: Page "Resource Card";
    begin
        
    end;
}