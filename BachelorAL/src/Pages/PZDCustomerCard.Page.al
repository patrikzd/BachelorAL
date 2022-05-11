page 50102 "PZD Customer Card"
{
    Caption = 'Customer Card';
    PageType = Card;
    SourceTable = "PZD Customers";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.TestField(Name);
                    end;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.TestField("Last Name");
                    end;
                }
            }
            group("Address & Contact")
            {

                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.TestField(Address);
                    end;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.TestField(City);
                    end;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.TestField("Phone No.");
                    end;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.TestField(Email);
                    end;
                }
            }
            part("Customer Issues"; "PZD Customer Issue ListPart")
            {
                Visible = true;
                SubPageLink = "Customer No." = field("No.");
            }
            part("Customer Orders"; "PZD Customer Order ListPart")
            {
                SubPageLink = "Customer No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateIssue)
            {
                RunPageMode = Create;
                Caption = 'Create a Customer Issue';
                ToolTip = 'Adds a new issue asociated with a customer';
                Image = IssueFinanceCharge;
                // RunPageLink = "Customer No." = field("No.");
                // RunObject = page "PZD Customer Issue Card"; 
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    CustomerIssues: Record "PZD Customer Issues";
                    CustomerIssueCard: Page "PZD Customer Issue Card";
                begin
                    CustomerIssues.Init();
                    CustomerIssues."Customer No." := Rec."No.";
                    CustomerIssues."Customer Name" := Rec.Name;
                    CustomerIssues."Customer Last Name" := Rec."Last Name";
                    CustomerIssues."Customer Address" := Rec.Address;
                    CustomerIssues.Insert(true);
                    CustomerIssueCard.SetRecord(CustomerIssues);
                    CustomerIssueCard.Run();
                    CurrPage.Update();
                end;
            }
        }
    }
}
