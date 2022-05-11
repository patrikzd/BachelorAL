pageextension 50102 "PZD Time Sheets" extends "Time Sheet Card"
{
    layout
    {
        modify(TimeSheetStatusFactBox)
        {
            Visible = false;
        }
        
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}