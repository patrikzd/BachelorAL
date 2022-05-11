page 50118 "PZD Posted Customer Order Card"
{
    Caption = 'Posted Customer Order Card';
    PageType = Card;
    SourceTable = "PZD Posted Customer Order";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    Editable = Rec.Status = Rec.Status::Open;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Last Name"; Rec."Customer Last Name")
                {
                    ToolTip = 'Specifies the value of the Customer Last Name field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                    ApplicationArea = All;
                }
                field("Document End Date"; Rec."Document End Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group("Order Item")
            {
                Editable = Rec.Status = Rec.Status::Open;

                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if (xRec."Item Type" <> Rec."Item Type") then begin
                            Rec."Item No." := '';
                            Rec.Price := 0;
                            Rec."Payment Period" := Rec."Payment Period"::" "
                        end;

                    end;
                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Payment Period"; rec."Payment Period")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if (Rec."Item Type" = Rec."Item Type"::"Internet Plan") then
                            if (Rec."Payment Period" = Rec."Payment Period"::"Full Price") then
                                Error('Internet plans have to have a Payment period 12 or 24 Months');
                    end;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part("Phones"; "PZD Phone List Part")
            {
                Visible = Rec."Item Type" = Rec."Item Type"::Phone;
            }
            part("Internet Plans"; "PZD Internet Plans List Part")
            {
                Visible = Rec."Item Type" = Rec."Item Type"::"Internet Plan";
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Open Order")
            {
                ApplicationArea = All;
                Image = Open;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                end;
            }
            action("Close Order")
            {
                ApplicationArea = All;
                Image = Close;

                trigger OnAction()
                var
                    Phones: Record "PZD Phones";
                begin
                    Rec.TestField("Item Type");
                    Rec.TestField("Item No.");
                    Rec.TestField("Payment Period");
                    Rec.TestField("Customer No.");
                    if (Rec."Item Type" = Rec."Item Type"::Phone) then begin
                        Phones.Get(Rec."Item No.");
                        Phones.Availability := Phones.Availability - 1;
                        Phones.Modify();
                    end;
                    Rec.Status := Rec.Status::Closed;
                    Rec."Consultant ID" := UserId;
                end;
            }
        }
    }

    trigger OnClosePage()
    begin
        if (Rec.Status = Rec.Status::Open) then begin
            Error('Your Order was not Closed, the record will be deleted');
            Rec.Delete();
        end;

    end;
}
