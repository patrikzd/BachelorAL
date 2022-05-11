codeunit 50102 "PZD Standard Table Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterAssignHeaderValues', '', false, false)]
    local procedure PurchaseLine_OnAfterAssignHeaderValues(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header")
    var
        CustomProcedures: Codeunit "PZD Custom Procedures";
    begin
        if PurchLine.Type = PurchLine.Type::Phone then 
            CustomProcedures.CopyFromPhones(PurchLine, PurchHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnAfterConfirmPost', '', false, false)]
    local procedure PurchaseOrder_OnPostDocumentBeforeNavigateAfterPosting(PurchaseHeader: Record "Purchase Header")
    var
        Phones: Record "PZD Phones";
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.FindLast();
        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document No.",PurchaseHeader."No.");
        PurchaseLine.FindSet();
        repeat
            Phones.Get(PurchaseLine."No.");
            Phones.Availability := Phones.Availability + PurchaseLine.Quantity;
            Phones.Modify();
        until PurchaseLine.Next() = 0;
    end;
}