page 50110 "PZD Customer Issue Card"
{
    Caption = 'Customer Issue Card';
    PageType = Card;
    SourceTable = "PZD Customer Issues";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Last Name"; Rec."Customer Last Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;

                }
                field("Task Assigned to"; Rec."Task Assigned to")
                {
                    ToolTip = 'Specifies the value of the Task Assigned to field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Resolve)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                begin
                    UserSetup.Get(UserId);
                    if (UserSetup.UserRoles <> UserSetup.UserRoles::Technician) then
                        Error('This task is not assigned to you');
                    Rec.Status := true;
                end;
            }
            action(ReOpen)
            {
                Caption = 'Reopen';
                ApplicationArea = All;

                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                begin
                    UserSetup.Get(UserId);
                    if (UserSetup.UserRoles <> UserSetup.UserRoles::Technician) then
                        Error('This task is not assigned to you');
                    Rec.Status := false;
                end;
            }
        }

    }
}
