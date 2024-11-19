codeunit 50118 "CRM Int. Table. Subscriber Ext"
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;

    var
        SourceDestCodePatternTxt: Label '%1-%2', Locked = true;
        CRMSynchHelper: Codeunit "CRM Synch. Helper";
        CRMProductName: Codeunit "CRM Product Name";
        CDSIntegrationImpl: Codeunit "CDS Integration Impl.";

        RecordMustBeCoupledErr: Label '%1 %2 must be coupled to a record in %3.', Comment = '%1 =field caption, %2 = field value, %3 - product name ';
        CustomerHasChangedErr: Label 'Cannot create the invoice in %2. The customer from the original %2 sales order %1 was changed or is no longer coupled.', Comment = '%1=CRM sales order number, %2 = Dataverse service name';
        CustomerNotCoupledErr: Label 'Customer is not coupled.';

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Rec. Synch. Invoke", 'OnBeforeInsertRecord', '', false, false)]
    procedure OnBeforeInsertRecord(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        CRMConnectionSetup: Record "CRM Connection Setup";
        CDSIntTableSubscriber: Codeunit "CDS Int. Table. Subscriber";

    begin
        case GetSourceDestCode(SourceRecordRef, DestinationRecordRef) of

            'Job-CDS fps_job':
                begin
                    //CheckSalesInvoiceLineItemsAreCoupled(SourceRecordRef);
                    UpdateCRMInvoiceBeforeInsertRecord(SourceRecordRef, DestinationRecordRef);
                end;            
        end;
    end;

    local procedure GetSourceDestCode(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef): Text
    begin
        if (SourceRecordRef.Number() <> 0) and (DestinationRecordRef.Number() <> 0) then
            exit(StrSubstNo(SourceDestCodePatternTxt, SourceRecordRef.Name(), DestinationRecordRef.Name()));
        exit('');
    end;

    local procedure UpdateCRMInvoiceBeforeInsertRecord(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef)
    var
        CRMAccount: Record "CRM Account";
        CRMIntegrationRecord: Record "CRM Integration Record";
        CDSJob: Record "CDS fps_job";
        Customer: Record Customer;
        Job: Record Job;
        ShipmentMethod: Record "Shipment Method";
        CRMSalesOrderToSalesOrder: Codeunit "CRM Sales Order to Sales Order";
        OutStream: OutStream;
        AccountId: Guid;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeUpdateCRMInvoiceBeforeInsertRecord(SourceRecordRef, DestinationRecordRef, IsHandled);
        if IsHandled then
            exit;

        SourceRecordRef.SetTable(Job);
        DestinationRecordRef.SetTable(CDSJob);

        Customer.Get(Job."Sell-to Customer No.");

        if not CRMIntegrationRecord.FindIDFromRecordID(Customer.RecordId(), AccountId) then
            if not CRMSynchHelper.SynchRecordIfMappingExists(Database::Customer, Database::"CRM Account", Customer.RecordId()) then
                Error(CustomerHasChangedErr, Job."No.", CRMProductName.CDSServiceName())
            else
                if not CRMIntegrationRecord.FindIDFromRecordID(Customer.RecordId(), AccountId) then
                    Error(RecordMustBeCoupledErr, Customer.TableCaption(), Customer."No.", CRMProductName.CDSServiceName());

        CDSJob.CustomerId := AccountId;
        CDSJob.CustomerIdType := CDSJob.CustomerIdType::account;
        DestinationRecordRef.GetTable(CDSjob);

        //UpdateOwnerIdAndCompanyId(DestinationRecordRef);

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Rec. Synch. Invoke", 'OnAfterTransferRecordFields', '', false, false)]
    procedure OnAfterTransferRecordFields(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        SalesHeader: Record "Sales Header";
        CRMConnectionSetup: Record "CRM Connection Setup";
    begin
        case GetSourceDestCode(SourceRecordRef, DestinationRecordRef) of
            'CDS fps_job-Job':
                begin
                    AddCustomerNoToJob(SourceRecordRef, DestinationRecordRef);
                end;
        end;
    end; 

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Rec. Synch. Invoke", 'OnAfterInsertRecord', '', false, false)]
    procedure OnAfterInsertRecord(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        SalesHeader: Record "Sales Header";
        CRMConnectionSetup: Record "CRM Connection Setup";
    begin
        case GetSourceDestCode(SourceRecordRef, DestinationRecordRef) of
            'CDS fps_job-Job':
                begin
                    AddCustomerNoToCDSJob(SourceRecordRef, DestinationRecordRef);
                end;
        end;
    end;             

   local procedure AddCustomerNoToJob(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        CRMConnectionSetup: Record "CRM Connection Setup";
        CDSJob: Record "CDS fps_job";
        Customer: Record Customer;
        Job: Record Job;
        CRMIntegrationRecord: Record "CRM Integration Record";
        CustomerRecordId: RecordId;
    begin
        //if not CRMConnectionSetup.IsBidirectionalSalesOrderIntEnabled() then
        //    exit;
        SourceRecordRef.SetTable(CDSJob);
        DestinationRecordRef.SetTable(Job);
        if not CRMIntegrationRecord.FindRecordIDFromID(cdsjob.CustomerId, Database::Customer, CustomerRecordId) then
            Error(CustomerNotCoupledErr);
        Customer.Get(CustomerRecordId);
        Job.Validate("Sell-to Customer No.", Customer."No.");
        DestinationRecordRef.GetTable(Job);

        // CDSJob.fps_selltocustomerno := Customer."No.";
        // CDSJob.fps_selltocustomername := Customer.Name;
        // CDSJob.fps_no := Job."No.";
        // SourceRecordRef.GetTable(CDSJob);
        // SourceRecordRef.Modify(false);
    end;  

   local procedure AddCustomerNoToCDSJob(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        CRMConnectionSetup: Record "CRM Connection Setup";
        CDSJob: Record "CDS fps_job";
        Customer: Record Customer;
        Job: Record Job;
        CRMIntegrationRecord: Record "CRM Integration Record";
        CustomerRecordId: RecordId;
    begin
        //if not CRMConnectionSetup.IsBidirectionalSalesOrderIntEnabled() then
        //    exit;
        SourceRecordRef.SetTable(CDSJob);
        DestinationRecordRef.SetTable(Job);
        // if not CRMIntegrationRecord.FindRecordIDFromID(cdsjob.CustomerId, Database::Customer, CustomerRecordId) then
        //     Error(CustomerNotCoupledErr);
        // Customer.Get(CustomerRecordId);
        // Job.Validate("Sell-to Customer No.", Customer."No.");
        // DestinationRecordRef.GetTable(Job);

        CDSJob.fps_selltocustomerno := Job."Sell-to Customer No.";
        CDSJob.fps_selltocustomername := Job."Sell-to Customer Name";
        CDSJob.fps_no := Job."No.";
        SourceRecordRef.GetTable(CDSJob);
        SourceRecordRef.Modify(false);
    end;  

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCRMInvoiceBeforeInsertRecord(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef; var IsHandled: Boolean)
    begin
    end;

}
