codeunit 50103 "PZD Custom Procedures"
{
    trigger OnRun()
    begin
        SubmitPayments;
    end;

    procedure CopyFromPhones(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header")
    var
        Phones: Record "PZD Phones";
    begin
        Phones.Get(PurchLine."No.");
        PurchLine."VAT Bus. Posting Group" := Phones."VAT Bus. Posting Group";
        PurchLine."VAT Prod. Posting Group" := Phones."VAT Prod. Posting Group";
        PurchLine."Direct Unit Cost" := Phones."Phone Cost";
        PurchLine."Gen. Prod. Posting Group" := Phones."VAT Prod. Posting Group";
    end;

    procedure PostOrder(CustomerOrder: Record "PZD Customer Order")
    var
        PostedCustomerOrder: Record "PZD Posted Customer Order";
    begin
        PostedCustomerOrder.Init();
        PostedCustomerOrder.TransferFields(CustomerOrder);
        PostedCustomerOrder.Insert();
        PostedCustomerOrder.Modify();

        CustomerOrder.Delete()
    end;

    procedure SubmitPayments()
    var
        ReadStream: InStream;
        WriteStream: OutStream;
        FileName: Text[20];
        TempBlob: Codeunit "Temp Blob";
        FileText: Text[20];
        Payment: List of [Text];
        PaymentAmount: Decimal;
        CustomerOrder: Record "PZD Customer Order";
        PaymentLeft: Decimal;
    begin
        TempBlob.CreateInStream(ReadStream);
        UploadIntoStream('Upload a file', '', '', FileName, ReadStream);
        TempBlob.CreateOutStream(WriteStream);
        while not ReadStream.EOS do begin
            ReadStream.ReadText(FileText);
            Payment := FileText.Split(' ');

            Evaluate(PaymentAmount, Payment.Get(2));
            CustomerOrder.Get(Payment.Get(1));

            PaymentLeft := CustomerOrder."Payment Amount Left" - PaymentAmount;
            CustomerOrder."Payment Amount Left" := PaymentLeft;
            CustomerOrder.Modify();

            CustomerOrder.Validate("Payment Amount Left", PaymentLeft);
        end;
    end;

    procedure SalesToday() SalesToday: Integer;
    var
        CustomerOrder: Record "PZD Customer Order";
    begin
        CustomerOrder.SetRange("Document Date", System.Today);
        SalesToday := CustomerOrder.Count;
        exit(SalesToday);
    end;

    procedure TimeSheetAvailable() TimeSheetCount: Integer;
    var
        Resource: Record Resource;
        TimeSheetHeader: Record "Time Sheet Header";
    begin
        Resource.SetRange("Time Sheet Owner User ID", UserId);
        Resource.FindFirst();
        TimeSheetHeader.SetRange("Resource No.", Resource."No.");
        TimeSheetCount := TimeSheetHeader.Count;
        exit(TimeSheetCount);
    end;
}