codeunit 50100 "PZD Page Subscribers"
{
    [EventSubscriber(ObjectType::Page, Page::"PZD Customer Issue Card", 'OnClosePageEvent', '', false, false)]
    local procedure PZDCustomerDocument_OnAfterActionEvent_CreateIssue(var Rec: Record "PZD Customer Issues")
    var
        CustomerIssues: Record "PZD Customer Issues";
        Customers: Record "PZD Customers";
    begin
        Customers.Get(Rec."Customer No.");
        if Rec.Description = '' then begin
            Message('Either Description is empty, record will be deleted');
            Rec.Delete();
        end;

    end;
}