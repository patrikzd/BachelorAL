page 50120 "PZD Manager Role Center"
{
    PageType = RoleCenter;
    Caption = 'Manager Role Center';

    layout
    {
        area(RoleCenter)
        {
            group(Customer)
            {
                part("Customer List"; "PZD Manager Main Activities")
                {
                    Caption = 'Manager''s Activities';
                }
                part("PZD Consultant Transactions"; "PZD Consultant Transactions")
                {
                    Caption = 'Consultant''s Transactions';
                }
                part("PZD Customer Issue ListPart"; "PZD Customer Issue ListPart")
                {
                    Caption = 'Customer''s Issue List';
                }
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(CreateOrder)
            {
                RunPageMode = Create;
                ApplicationArea = Basic, Suite;
                Caption = 'Create a New Order';
                ToolTip = 'Create a New Order';
                RunObject = page "PZD Customer Order Card";
            }
            action(SubmitPayments)
            {
                ApplicationArea = All;
                Caption = 'Upload a Payment File';

                RunObject = codeunit "PZD Custom Procedures";
            }
            action(CreatePurchase)
            {
                Caption = 'Create Purchase Order';
                ApplicationArea = All;
                RunPageMode = Create;
                RunObject = page "Purchase Order";
            }
            action(PostedPurchases)
            {
                Caption = 'Phone Purchase History';
                ApplicationArea = All;
                RunObject = page "Posted Purchase Invoice Lines";
            }
            action(FinishedOrders)
            {
                RunPageMode = View;
                Caption = 'Posted Customer Orders';
                ApplicationArea = All;
                RunObject = page "PZD Posted Customer Order List";
            }
            action(CreateTimeSheets)
            {
                ApplicationArea = All;
                Caption = 'Create Time Sheets';
                RunObject = page "Time Sheet List";
            }
        }
    }
}