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
                    UpdateCDSJobBeforeInsertRecord(SourceRecordRef, DestinationRecordRef);
                end;            
            'Job-CDS ctb_project':
                begin
                    //CheckSalesInvoiceLineItemsAreCoupled(SourceRecordRef);
                    UpdateCDSProjectBeforeInsertRecord(SourceRecordRef, DestinationRecordRef);
                end;                       
        end;                             
    end;

    local procedure GetSourceDestCode(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef): Text
    begin
        if (SourceRecordRef.Number() <> 0) and (DestinationRecordRef.Number() <> 0) then
            exit(StrSubstNo(SourceDestCodePatternTxt, SourceRecordRef.Name(), DestinationRecordRef.Name()));
        exit('');
    end;

    local procedure UpdateCDSJobBeforeInsertRecord(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef)
    var
        CRMIntegrationRecord: Record "CRM Integration Record";
        CDSJob: Record "CDS fps_job";
        Customer: Record Customer;
        Job: Record Job;
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

    local procedure UpdateCDSProjectBeforeInsertRecord(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef)
    var
        CRMIntegrationRecord: Record "CRM Integration Record";
        CDSProject: Record "CDS ctb_project";
        Customer: Record Customer;
        Job: Record Job;
        AccountId: Guid;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeUpdateCRMInvoiceBeforeInsertRecord(SourceRecordRef, DestinationRecordRef, IsHandled);
        if IsHandled then
            exit;

        SourceRecordRef.SetTable(Job);
        DestinationRecordRef.SetTable(CDSProject);

        Customer.Get(Job."Sell-to Customer No.");

        if not CRMIntegrationRecord.FindIDFromRecordID(Customer.RecordId(), AccountId) then
            if not CRMSynchHelper.SynchRecordIfMappingExists(Database::Customer, Database::"CRM Account", Customer.RecordId()) then
                Error(CustomerHasChangedErr, Job."No.", CRMProductName.CDSServiceName())
            else
                if not CRMIntegrationRecord.FindIDFromRecordID(Customer.RecordId(), AccountId) then
                    Error(RecordMustBeCoupledErr, Customer.TableCaption(), Customer."No.", CRMProductName.CDSServiceName());

        CDSProject.cgk_accountid := AccountId;
        //CDSProject.CustomerIdType := CDSProject.CustomerIdType::account;
        DestinationRecordRef.GetTable(CDSProject);
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
                    AddCDSJobCustomerNoToJob(SourceRecordRef, DestinationRecordRef);
                end;
            'CDS ctb_project-Job':
                begin
                    AddCDSProjectCustomerNoToJob(SourceRecordRef, DestinationRecordRef);
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
            'CDS ctb_project-Job':
                begin
                    AddCustomerNoToCDSProject(SourceRecordRef, DestinationRecordRef);
                end;                
        end;
    end; 

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Rec. Synch. Invoke", 'OnBeforeTransferRecordFields', '', false, false)]
    // procedure OnBeforeTransferRecordFields(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    // var
    //     CRMConnectionSetup: Record "CRM Connection Setup";
    // begin
    //     case GetSourceDestCode(SourceRecordRef, DestinationRecordRef) of
    //         'CDS fps_job-Job':
    //             begin
    //                 AddCustomerNoToCDSJob(SourceRecordRef, DestinationRecordRef);
    //             end;
    //         'CDS ctb_project-Job':
    //             begin
    //                 AddCustomerNoToCDSProject(SourceRecordRef, DestinationRecordRef);
    //             end;                
    //     end;
    // end;            

   local procedure AddCDSJobCustomerNoToJob(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
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

   local procedure AddCDSProjectCustomerNoToJob(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        CRMConnectionSetup: Record "CRM Connection Setup";
        CDSProject: Record "CDS ctb_project";
        Customer: Record Customer;
        Job: Record Job;
        CRMIntegrationRecord: Record "CRM Integration Record";
        CustomerRecordId: RecordId;
    begin
        //if not CRMConnectionSetup.IsBidirectionalSalesOrderIntEnabled() then
        //    exit;
        SourceRecordRef.SetTable(CDSProject);
        DestinationRecordRef.SetTable(Job);
        if not CRMIntegrationRecord.FindRecordIDFromID(CDSProject.cgk_accountid, Database::Customer, CustomerRecordId) then
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
        //SourceRecordRef.Modify(false);
    end;  

   local procedure AddCustomerNoToCDSProject(SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        CRMConnectionSetup: Record "CRM Connection Setup";
        CDSProject: Record "CDS ctb_project";
        Customer: Record Customer;
        Job: Record Job;
        CRMIntegrationRecord: Record "CRM Integration Record";
        CustomerRecordId: RecordId;
        RecRef: RecordRef;
    begin
        //if not CRMConnectionSetup.IsBidirectionalSalesOrderIntEnabled() then
        //    exit;

        SourceRecordRef.SetTable(CDSProject);
        DestinationRecordRef.SetTable(Job);
        // if not CRMIntegrationRecord.FindRecordIDFromID(cdsjob.CustomerId, Database::Customer, CustomerRecordId) then
        //     Error(CustomerNotCoupledErr);
        // Customer.Get(CustomerRecordId);
        // Job.Validate("Sell-to Customer No.", Customer."No.");
        // DestinationRecordRef.GetTable(Job);
        // it is required to calculate these fields, otherwise CDS fails to modify the entity

        // it is required to calculate these fields, otherwise CDS fails to modify the entity
        if (CDSProject.cgk_accountidname = '') or (CDSProject.cgk_accountidname = '') then begin
            CDSProject.SetAutoCalcFields(cgk_accountidname, cgk_accountidname);
            CDSProject.Find();
        end;   
        CDSProject.cgk_selltocustomerno := Job."Sell-to Customer No.";
        CDSProject.cgk_selltocustomername := Job."Sell-to Customer Name";
        CDSProject.ctb_projectcode := Job."No.";
        CDSProject.Modify(false);
        SourceRecordRef.GetTable(CDSProject);             
    end;  

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCRMInvoiceBeforeInsertRecord(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef; var IsHandled: Boolean)
    begin
    end;

}
