codeunit 50153 "Open Client List Test"
{
    Subtype = Test;
    
    [Test]
    procedure OpenClientListTestFunction()
    var
        CustomerList: TestPage "PZD Customer List";
        VisibilityLastName: Boolean;
        VisibilityLastNo: Boolean;
    begin
        CustomerList.OpenView();
        VisibilityLastName := CustomerList."Last Name".Visible();
        VisibilityLastNo := CustomerList."No.".Visible();
        
        if (VisibilityLastName and VisibilityLastNo) = false then
            Error('Not all required fields are visible');
    end;
}