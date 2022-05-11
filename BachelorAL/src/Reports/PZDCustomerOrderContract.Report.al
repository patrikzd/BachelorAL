report 50100 "PZD Customer Order Contract"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'CustomerOrderContract.rdlc';
    Caption = 'PZD Customer Order Contract';
    dataset
    {
        dataitem(PZDCustomerOrder; "PZD Customer Order")
        {
            RequestFilterFields = "No.";
            column(Address; Address)
            {
            }
            column(CustomerLastName; "Customer Last Name")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DocumentEndDate; "Document End Date")
            {
            }
            column(ItemNo; "Item No.")
            {
            }
            column(ItemType; "Item Type")
            {
            }
            column(Price; Price)
            {
            }
            column(No_; "No.")
            {

            }
            column(SystemName; SystemName)
            {

            }
            column(ModelName; ModelName)
            {

            }
            column(Memory_Size; "Memory Size")
            {

            }
            column(Color; Color)
            {

            }
            column(CustSign; CustSign)
            {

            }
            column(ConsultSign; ConsultSign)
            {

            }
            column(Spacing; ___)
            {

            }
            column(Spacing2; __)
            {

            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        SystemName: Label 'Sales Management System';
        CustSign: Label 'Customer Sign Here';
        ConsultSign: Label 'Consultant Sign Here';
        ___: Label '_______________';
        __: Label '____________';



}
