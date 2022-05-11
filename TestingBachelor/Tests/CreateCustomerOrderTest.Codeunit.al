codeunit 50155 "Create Customer Order Test"
{
    Subtype = Test;

    [Test]
    procedure CreateCustomerOrderTestFunction()
    var
        CustomerOrderCard: TestPage "PZD Customer Order Card";
        Customers: Record "PZD Customers";
        CustomerOrder: Record "PZD Customer Order";
        Phones: Record "PZD Phones";
        Availability: Integer;
    begin
        CustomerOrderCard.OpenNew();
        Customers.FindFirst();
        CustomerOrderCard."Customer No.".SetValue(Customers."No.");
        CustomerOrderCard."Item Type".SetValue(CustomerOrder."Item Type"::Phone);
        CustomerOrderCard.Phones."Phone Model".Invoke();
        Phones.Get(CustomerOrderCard."Item No.".Value);
        Availability := Phones.Availability;
        CustomerOrderCard."Payment Period".SetValue(CustomerOrder."Payment Period"::"Full Price");
        CustomerOrderCard."Close Order".Invoke();
        Phones.Get(CustomerOrderCard."Item No.".Value);
        If Availability = Phones.Availability then
            Error('Phones availability was not decreased');

    end;
}