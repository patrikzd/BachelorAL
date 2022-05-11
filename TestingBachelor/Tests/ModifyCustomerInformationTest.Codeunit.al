codeunit 50154 "Modify Customer Info Test"
{
    Subtype = Test;

    [Test]
    procedure ModifyCustomerInformationTestFunction()
    var
        Customers: Record "PZD Customers";
    begin
        Customers.FindLast();
        ModifyClientInformation(Customers);
    end;

    local procedure ModifyClientInformation(var Customers: Record "PZD Customers")
    begin
        Customers.Address := 'TEST2';
        Customers."Phone No." := '123123';
        Customers.Email := 'TESTEMAIL';
        Customers.Modify();
    end;
}