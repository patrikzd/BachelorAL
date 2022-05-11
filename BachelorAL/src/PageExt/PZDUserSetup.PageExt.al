pageextension 50101 "PZD User Setup" extends "User Setup"
{
    layout
    {
        addafter(Email)
        {
            field(UserRoles; Rec.UserRoles)
            {
                ApplicationArea = All;
            }
        }
    }
}