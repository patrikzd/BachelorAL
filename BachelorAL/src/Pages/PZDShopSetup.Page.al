page 50103 "PZD Shop Setup"
{
    Caption = 'Shop Setup';
    PageType = Card;
    SourceTable = "PZD Shop Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Reader Nos."; Rec."Reader Nos.")
                {
                    ToolTip = 'Specifies the value of Reader No.Series';
                }
                field("Internet Nos."; Rec."Internet Nos.")
                {
                    ToolTip = 'Specifies the value of Reader No.Series';
                }
                field("Phone Nos."; Rec."Phone Nos.")
                {
                    ToolTip = 'Specifies the value of Phone No.Series';
                }
                field("Issue Nos."; Rec."Issue Nos.")
                {
                    ToolTip = 'Specifies the value of Issue No.Series';
                }
                field("Order Nos."; Rec."Order Nos.")
                {
                    ToolTip = 'Specifies the value of Order No.Series';
                }
            }
        }
    }
}
