page 80006 "Dataverse User Setup"
{
    ApplicationArea = Suite;
    Caption = 'Usersetup - Dataverse';
    AdditionalSearchTerms = 'Usersetup CDS, Usersetup Common Data Service';
    Editable = false;
    PageType = List;
    SourceTable = "CDS fps_usersetup";    
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(createdby; Rec.createdby)
                {
                    ToolTip = 'Specifies the value of the Gemaakt door field.', Comment = '%';
                }
                field(createdon; Rec.createdon)
                {
                    ToolTip = 'Specifies the value of the Gemaakt op field.', Comment = '%';
                }
                field(createdonbehalfby; Rec.createdonbehalfby)
                {
                    ToolTip = 'Specifies the value of the Gemaakt door (gemachtigde) field.', Comment = '%';
                }
                field(fps_email; Rec.fps_email)
                {
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field(fps_userfullname; Rec.fps_userfullname)
                {
                    ToolTip = 'Specifies the value of the User Full Name field.', Comment = '%';
                }
                field(fps_userid; Rec.fps_userid)
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field(fps_usersetupid; Rec.fps_usersetupid)
                {
                    ToolTip = 'Specifies the value of the User Setup field.', Comment = '%';
                }
                field(importsequencenumber; Rec.importsequencenumber)
                {
                    ToolTip = 'Specifies the value of the Volgnummer van de importbewerking field.', Comment = '%';
                }
                field(modifiedby; Rec.modifiedby)
                {
                    ToolTip = 'Specifies the value of the Gewijzigd door field.', Comment = '%';
                }
                field(modifiedon; Rec.modifiedon)
                {
                    ToolTip = 'Specifies the value of the Gewijzigd op field.', Comment = '%';
                }
                field(modifiedonbehalfby; Rec.modifiedonbehalfby)
                {
                    ToolTip = 'Specifies the value of the Gewijzigd door (gemachtigde) field.', Comment = '%';
                }
                field(overriddencreatedon; Rec.overriddencreatedon)
                {
                    ToolTip = 'Specifies the value of the Record is gemaakt op field.', Comment = '%';
                }
                field(ownerid; Rec.ownerid)
                {
                    ToolTip = 'Specifies the value of the Eigenaar field.', Comment = '%';
                }
                field(owningbusinessunit; Rec.owningbusinessunit)
                {
                    ToolTip = 'Specifies the value of the Business unit die eigenaar is field.', Comment = '%';
                }
                field(owningteam; Rec.owningteam)
                {
                    ToolTip = 'Specifies the value of the Team dat eigenaar is field.', Comment = '%';
                }
                field(owninguser; Rec.owninguser)
                {
                    ToolTip = 'Specifies the value of the Gebruiker die eigenaar is field.', Comment = '%';
                }
                field(statecode; Rec.statecode)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(statuscode; Rec.statuscode)
                {
                    ToolTip = 'Specifies the value of the Status Reason field.', Comment = '%';
                }
                field(timezoneruleversionnumber; Rec.timezoneruleversionnumber)
                {
                    ToolTip = 'Specifies the value of the Versienummer van tijdzoneregel field.', Comment = '%';
                }
                field(utcconversiontimezonecode; Rec.utcconversiontimezonecode)
                {
                    ToolTip = 'Specifies the value of the Tijdzonecode voor UTC-conversie field.', Comment = '%';
                }
                field(versionnumber; Rec.versionnumber)
                {
                    ToolTip = 'Specifies the value of the Versienummer field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(CreateFromCRM)
            {
                ApplicationArea = Suite;
                Caption = 'Create in Business Central';
                Image = NewCustomer;
                ToolTip = 'Generate the entity from the coupled Dataverse User.';

                trigger OnAction()
                var
                    CDSUsersetup: Record "CDS fps_usersetup";
                    CRMIntegrationManagement: Codeunit "CRM Integration Management";
                begin
                    CurrPage.SetSelectionFilter(CDSUsersetup);
                    CRMIntegrationManagement.CreateNewRecordsFromSelectedCRMRecords(CDSUsersetup);
                end;
            }
            action(ShowOnlyUncoupled)
            {
                ApplicationArea = Suite;
                Caption = 'Hide Coupled Users';
                Image = FilterLines;
                ToolTip = 'Do not show coupled Users.';

                trigger OnAction()
                begin
                    MarkedOnly(true);
                end;
            }
            action(ShowAll)
            {
                ApplicationArea = Suite;
                Caption = 'Show Coupled Users';
                Image = ClearFilter;
                ToolTip = 'Show coupled Users.';

                trigger OnAction()
                begin
                    MarkedOnly(false);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(CreateFromCRM_Promoted; CreateFromCRM)
                {
                }
                actionref(ShowOnlyUncoupled_Promoted; ShowOnlyUncoupled)
                {
                }
                actionref(ShowAll_Promoted; ShowAll)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        CRMIntegrationRecord: Record "CRM Integration Record";
        RecordID: RecordID;
        EmptyRecordID: RecordID;
    begin
        if CRMIntegrationRecord.FindRecordIDFromID(fps_usersetupid, DATABASE::"User Setup", RecordID) then
            if CurrentlyCoupledCDSUsersetup.fps_usersetupid = fps_usersetupid then begin
                Coupled := 'Current';
                FirstColumnStyle := 'Strong';
                Mark(true);
            end else begin
                Coupled := 'Yes';
                FirstColumnStyle := 'Subordinate';
                Mark(false);
            end;

        if RecordID = EmptyRecordID then begin
            Coupled := 'No';
            FirstColumnStyle := 'None';
            Mark(true);
        end;
    end;

    trigger OnInit()
    begin
        CODEUNIT.Run(CODEUNIT::"CRM Integration Management");
        Commit();
    end;

    trigger OnOpenPage()
    var
        LookupCRMTables: Codeunit "Lookup CRM Tables";
    begin
        FilterGroup(4);
        SetView(LookupCRMTables.GetIntegrationTableMappingView(DATABASE::"CDS fps_usersetup"));
        FilterGroup(0);
    end;

    var
        CurrentlyCoupledCDSUsersetup: Record "CDS fps_usersetup";
        Coupled: Text;
        FirstColumnStyle: Text;

    procedure SetCurrentlyCoupledCDSJob(CDSUsersetup: Record "CDS fps_usersetup")
    begin
        CurrentlyCoupledCDSUsersetup := CDSUsersetup;
    end;    
}
