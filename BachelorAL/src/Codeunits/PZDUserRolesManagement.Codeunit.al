codeunit 50101 "PZD User Roles Management"
{

    procedure CreateRecord()
    var
        UserSetup: Record "User Setup";
        NoPermissionErr: Label 'You do not have permission to create records';
    begin
        UserSetup.Get(UserId());
        if UserSetup.UserRoles <> UserSetup.UserRoles::Manager then
            Error(NoPermissionErr);
    end;

    procedure ModifyRecord()
    var
        UserSetup: Record "User Setup";
        NoPermissionErr: Label 'You do not have permission to modify records';
    begin
        UserSetup.Get(UserId());
        if UserSetup.UserRoles <> UserSetup.UserRoles::Manager then
            Error(NoPermissionErr);
    end;

    procedure AssignTechnician()
    var
        UserSetup: Record "User Setup";
        NoPermissionErr: Label 'Only a manager can assign issues';
    begin
        UserSetup.Get(UserId());
        if UserSetup.UserRoles <> UserSetup.UserRoles::Manager then
            Error(NoPermissionErr);
    end;
}