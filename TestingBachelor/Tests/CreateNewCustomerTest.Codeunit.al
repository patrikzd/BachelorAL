codeunit 50150 "Create New Customer Test"
{
    Subtype = Test;

    [Test]
    procedure CreateCustomerTestFunction()
    var
        Customers: Record "PZD Customers";
    begin
        Initialize();
        CreateCustomer(Customers);
    end;

    local procedure Initialize()
    var
        Customers: Record "PZD Customers";
    begin
        if isInitialized then
            exit;

        Customers.DeleteAll();

        isInitialized := true;
        Commit();
    end;

    local procedure CreateCustomer(var Customers: Record "PZD Customers")
    begin
        Customers.Init();
        Customers.Name := 'TEST';
        Customers."Last Name" := 'TEST';
        Customers.Address := 'TEST';
        Customers."Phone No." := 'TEST';
        Customers.Email := 'TEST';
        Customers.Insert(true);
    end;

    var
        isInitialized: Boolean;
}