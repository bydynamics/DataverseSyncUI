codeunit 70100 "Dataverse UI Events"
{
    procedure InsertIntegrationMapping(IntegrationTableMappingName: Code[20])
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        DataverseUITable: Record "Dataverse UI Table";
        DataverseUIField: Record "Dataverse UI Field";
    begin
        DataverseUITable.Reset;
        DataverseUITable.SetRange("Mapping Name", IntegrationTableMappingName);
        if DataverseUITable.FindFirst() then begin
            InsertIntegrationTableMapping(
                IntegrationTableMapping, DataverseUITable."Mapping Name",
                DataverseUITable."BC Table", DataverseUITable."Dataverse Table",
                DataverseUITable."Dataverse UID", DataverseUITable."Modified Field",
                '', '', DataverseUITable."Sync Only Coupled Records",
                DataverseUITable."Sync Direction".AsInteger());
            //fields
            DataverseUIField.Reset;
            DataverseUIField.SetRange("Mapping Name", IntegrationTableMappingName);
            if DataverseUIField.FindSet then
                repeat
                    InsertIntegrationFieldMapping(
                        DataverseUIField."Mapping Name",
                        DataverseUIField."BC Field",
                        DataverseUIField."Dataverse Field",
                        DataverseUIField."Sync Direction".AsInteger(),
                        DataverseUIField."Const Value",
                        DataverseUIField."Validate Field",
                        DataverseUIField."Validate Integr Table Field");
                until DataverseUIField.Next = 0;
        end;
    end;

    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean; Direction: Option)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, Direction, 'CDS');
    end;

    local procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', true, true)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        DataverseUITable: Record "Dataverse UI Table";
        DataverseUIField: Record "Dataverse UI Field";
    begin
        //tables
        DataverseUITable.Reset;
        if DataverseUITable.FindSet then
            repeat
                InsertIntegrationTableMapping(
                    IntegrationTableMapping, DataverseUITable."Mapping Name",
                    DataverseUITable."BC Table", DataverseUITable."Dataverse Table",
                    DataverseUITable."Dataverse UID", DataverseUITable."Modified Field",
                    '', '', DataverseUITable."Sync Only Coupled Records",
                    DataverseUITable."Sync Direction".AsInteger());

                //fields
                DataverseUIField.Reset;
                DataverseUIField.SetRange("Mapping Name", DataverseUITable."Mapping Name");
                if DataverseUIField.FindSet then
                    repeat
                        InsertIntegrationFieldMapping(
                            DataverseUIField."Mapping Name",
                            DataverseUIField."BC Field",
                            DataverseUIField."Dataverse Field",
                            DataverseUIField."Sync Direction".AsInteger(),
                            DataverseUIField."Const Value",
                            DataverseUIField."Validate Field",
                            DataverseUIField."Validate Integr Table Field");
                    until DataverseUIField.Next = 0;
            until DataverseUIField.Next() = 0;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Integration Management", 'OnBeforeHandleCustomIntegrationTableMapping', '', false, false)]
    local procedure HandleCustomIntegrationTableMappingReset(var IsHandled: Boolean; IntegrationTableMappingName: Code[20])
    begin
        InsertIntegrationMapping(IntegrationTableMappingName);
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
    local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean)
    var
        DataverseUITable: Record "Dataverse UI Table";
    begin
        DataverseUITable.Reset;
        if DataverseUITable.FindSet then
            repeat
                if BCTableNo = DataverseUITable."BC Table" then begin
                    CDSTableNo := DataverseUITable."Dataverse Table";
                    handled := true;
                end;
            until DataverseUITable.Next = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnAddEntityTableMapping', '', true, true)]
    local procedure HandleOnAddEntityTableMapping(var TempNameValueBuffer: Record "Name/Value Buffer" temporary);
    var
        CRMSetupDefaults: Codeunit "CRM Setup Defaults";
        DataverseUITable: Record "Dataverse UI Table";
    begin
        DataverseUITable.Reset;
        if DataverseUITable.FindSet then
            repeat
                CRMSetupDefaults.AddEntityTableMapping(DataverseUITable."Table Name Dataverse", DataverseUITable."BC Table", TempNameValueBuffer);
                CRMSetupDefaults.AddEntityTableMapping(DataverseUITable."Table Name Dataverse", DataverseUITable."Dataverse Table", TempNameValueBuffer);
            until DataverseUITable.Next = 0;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMTables', '', true, true)]
    local procedure HandleOnLookupCRMTables(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean)
    var
        DataverseUIList: Page "Dataverse UI List";
        DataverseUITempTable: Record "Dataverse UI Temp Table";
    begin
        DataverseUIList.SetGlobalVar(CRMTableID, NAVTableId, SavedCRMId, CRMId, IntTableFilter);

        DataverseUIList.LookupMode(true);
        if DataverseUIList.RunModal = ACTION::LookupOK then begin
            DataverseUIList.GetRecord(DataverseUITempTable);
            CRMId := DataverseUITempTable.CRMId;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Rec. Synch. Invoke", 'OnDeletionConflictDetected', '', false, false)]
    local procedure HandleOnDeletionConflictDetected(var IntegrationTableMapping: Record "Integration Table Mapping"; var SourceRecordRef: RecordRef; var DeletionConflictHandled: Boolean)
    var
        CRMIntegrationRecord: Record "CRM Integration Record";
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
    begin
        if DeletionConflictHandled then
            exit;

        if not (CRMIntegrationManagement.IsCDSIntegrationEnabled() or CRMIntegrationManagement.IsCRMIntegrationEnabled()) then
            exit;

        if IntegrationTableMapping."Deletion-Conflict Resolution" = IntegrationTableMapping."Deletion-Conflict Resolution"::"Delete Records" then begin
            //Delete coupling
            if CRMIntegrationRecord.IsRecordCoupled(SourceRecordRef.RecordId) then
                CRMIntegrationRecord.RemoveCouplingToRecord(SourceRecordRef);
            //Delete record
            if SourceRecordRef.Delete() then;

            DeletionConflictHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::GlobalTriggerManagement, 'OnAfterOnDatabaseDelete', '', false, false)]
    local procedure OnAfterOnDatabaseDelete(RecRef: RecordRef)
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        CRMIntegrationRecord: Record "CRM Integration Record";
        CDSRecRef: RecordRef;
        CDSFieldRef: FieldRef;
        CRMID: Guid;
        RecID: RecordId;
    begin
        IntegrationTableMapping.Reset;
        IntegrationTableMapping.SetRange("Table ID", RecRef.Number);
        If not IntegrationTableMapping.FindFirst() then
            exit;
        if IntegrationTableMapping."Deletion-Conflict Resolution" <> IntegrationTableMapping."Deletion-Conflict Resolution"::"Delete Records" then
            exit;

        //Delete Dataverse Record
        CRMIntegrationRecord.FindIDFromRecordRef(RecRef, CRMID);
        CDSRecRef.Open(IntegrationTableMapping."Integration Table ID");
        CDSFieldRef := CDSRecRef.Field(IntegrationTableMapping."Integration Table UID Fld. No.");
        CDSFieldRef.Value := CRMID;
        if CDSRecRef.Find('=') then begin
            RecID := CDSRecRef.RecordId;
            if CDSRecRef.Get(RecID) then
                CDSRecRef.Delete();
        end;

        //Delete coupling
        if CRMIntegrationRecord.IsRecordCoupled(RecRef.RecordId) then
            CRMIntegrationRecord.RemoveCouplingToRecord(RecRef);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", 'GetDatabaseTableTriggerSetup', '', true, true)]
    local procedure GetDatabaseTableTriggerSetup(var OnDatabaseDelete: Boolean; var OnDatabaseInsert: Boolean; var OnDatabaseModify: Boolean; TableId: Integer)
    begin
        OnDatabaseDelete := true;
    end;
}