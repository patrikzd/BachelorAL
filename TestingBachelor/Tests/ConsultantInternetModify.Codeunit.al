codeunit 50151 "Consultant Int Modify Test"
{
    Subtype = Test;

    [Test]
    procedure ConsultantModifyInternetPlanInformationTestFunction()
    var
        InternetOptionCard: TestPage "PZD Internet Option Card";
        InternetOptions: Record "PZD Internet Options";
        UserSetup: Record "User Setup";
    begin
        InternetOptionCard.OpenEdit();
        InternetOptions.FindLast();

        InternetOptionCard.GoToRecord(InternetOptions);
        InternetOptionCard."Plan Name".Activate();
        InternetOptionCard."Plan Name".SetValue('TEST');
    end;

    [PageHandler]
    procedure ErrorMessagesPageHandler(var ErrorMessages: TestPage "Error Messages")
    var
        UnexpectedErrorLabel: Label 'Unexpected error: %1', Comment = '%1 - Error message';
        ExpectedErrorTxt: Label 'You do not have permission to modify records';
    begin
        ErrorMessages.First();

        if ErrorMessages.Description.Value <> ExpectedErrorTxt then
            Error(UnexpectedErrorLabel, ErrorMessages.Description.Value);
        ErrorMessages.Close();
    end;

}