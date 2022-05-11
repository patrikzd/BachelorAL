codeunit 50152 "Consultant Change Status Test"
{
    Subtype = Test;

    procedure ChangeIssueStatueTestFunction()
    var
        CustomerIssueCardPage: TestPage "PZD Customer Issue Card";
        CustomerIssues: Record "PZD Customer Issues";
    begin
        CustomerIssues.FindFirst();
        CustomerIssueCardPage.OpenView();
        CustomerIssueCardPage.Description.SetValue('aaaa');
        CustomerIssueCardPage.GoToRecord(CustomerIssues);
        asserterror CustomerIssueCardPage.ReOpen.Invoke();
    end;
}