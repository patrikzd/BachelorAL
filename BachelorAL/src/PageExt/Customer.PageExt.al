pageextension 50100 "PZD Customer Page" extends "Customer Card"
{
    layout
    {
        modify(Blocked)
        {
            Enabled = false;
            Visible = false;
        }
        modify("Balance (LCY)")
        {
            Enabled = false;
            Visible = false;
        }
        modify("Balance (LCY)2")
        {
            Enabled = false;
            Visible = false;
        }
        modify("Balance Due (LCY)")
        {
            Enabled = false;
            Visible = false;
        }
        modify("CustSalesLCY - CustProfit - AdjmtCostLCY")
        {
            Enabled = false;
            Visible = false;
        }
        modify("BalanceAsVendor")
        {
            Enabled = false;
            Visible = false;
        }
        modify(County)
        {
            Enabled = false;
            Visible = false;
        }
        modify("Home Page")
        {
            Enabled = false;
            Visible = false;
        }
        modify(Invoicing)
        {
            Enabled = false;
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