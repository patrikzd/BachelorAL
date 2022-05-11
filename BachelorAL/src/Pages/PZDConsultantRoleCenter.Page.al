page 50100 "PZD Consultant Role Center"
{
    PageType = RoleCenter;
    Caption = 'Consultant Role Center';

    layout
    {
        area(RoleCenter)
        {
            group(Customer)
            {
                part("Customer List"; "PZD Consultant Main Activities")
                {
                    Caption = 'Consultant Activities';
                }
                part("PZD Consultant Transactions"; "PZD Consultant Transactions")
                {
                    Caption = 'Consultant''s Transactions';
                }
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(Create)
            {
                RunPageMode = Create;
                Caption = 'Add a New Customer';
                ToolTip = 'Add a New Customer into the system';
                Image = NewDocument;
                RunObject = page "PZD Customer Card";
                ApplicationArea = Basic, Suite;
            }
            action(ViewList)
            {
                RunPageMode = View;
                Caption = 'View Customer List';
                ToolTip = 'Views Customer List';
                Image = List;
                RunObject = page "PZD Customer List";
                ApplicationArea = Basic, Suite;
            }
            action(ViewPlans)
            {
                RunPageMode = View;
                Caption = 'View Internet Plans';
                ToolTip = 'Views Internet Plans';
                RunObject = page "PZD Internet Option List";
                ApplicationArea = Basic, Suite;
            }
            action(CreateOrder)
            {
                RunPageMode = Create;
                ApplicationArea = Basic, Suite;
                Caption = 'Create a New Order';
                ToolTip = 'Create a New Order';
                RunObject = page "PZD Customer Order Card";
            }
        }
    }
}