page 80005 "CRM Job List"
{
    ApplicationArea = Suite;
    Caption = 'Jobs - Dataverse';
    AdditionalSearchTerms = 'Jobs CDS, Jobs Common Data Service';
    Editable = false;
    PageType = List;
    SourceTable = "CDS fps_job";
    SourceTableView = SORTING(fps_jobid);
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field(No; Rec.fps_no)
                {
                    ApplicationArea = Suite;
                    //Caption = 'Name';
                    StyleExpr = FirstColumnStyle;
                    ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                }
                field(fps_jobid;Rec.fps_jobid)
                {
                    ApplicationArea = Suite;
                    //Caption = 'Primary Contact Name';
                    ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                }
                field(fps_description;fps_description)
                {
                    ApplicationArea = Suite;
                    //Caption = 'Primary Contact Name';
                    ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                }                
                field(fps_jobstatus;Rec.fps_jobstatus)
                {
                    ApplicationArea = Suite;
                    //Caption = 'Relationship Type';
                    ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                }
                field(fps_selltocustomerno;Rec.fps_selltocustomerno)
                {
                    ApplicationArea = Suite;
                    //Caption = 'Street 1';
                    ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                }
                field(fps_selltocustomername;Rec.fps_selltocustomername)
                {
                    ApplicationArea = Suite;
                    //Caption = 'Street 2';
                    ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                }
                field(fps_projectmanager;Rec.fps_projectmanager)
                {
                    ApplicationArea = Suite;
                    //Caption = 'ZIP/Postal Code';
                    ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                }
                field(Coupled; Coupled)
                {
                    ApplicationArea = Suite;
                    Caption = 'Coupled';
                    ToolTip = 'Specifies if the Dataverse record is coupled to Business Central.';
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
                ToolTip = 'Generate the entity from the coupled Dataverse job.';

                trigger OnAction()
                var
                    CDSJob: Record "CDS fps_job";
                    CRMIntegrationManagement: Codeunit "CRM Integration Management";
                begin
                    CurrPage.SetSelectionFilter(CDSJob);
                    CRMIntegrationManagement.CreateNewRecordsFromSelectedCRMRecords(CDSJob);
                end;
            }
            action(ShowOnlyUncoupled)
            {
                ApplicationArea = Suite;
                Caption = 'Hide Coupled Jobs';
                Image = FilterLines;
                ToolTip = 'Do not show coupled Jobs.';

                trigger OnAction()
                begin
                    MarkedOnly(true);
                end;
            }
            action(ShowAll)
            {
                ApplicationArea = Suite;
                Caption = 'Show Coupled Jobs';
                Image = ClearFilter;
                ToolTip = 'Show coupled Jobs.';

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
        if CRMIntegrationRecord.FindRecordIDFromID(fps_jobid, DATABASE::Job, RecordID) then
            if CurrentlyCoupledCDSJob.fps_jobid = fps_jobid then begin
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
        SetView(LookupCRMTables.GetIntegrationTableMappingView(DATABASE::"CDS fps_job"));
        FilterGroup(0);
    end;

    var
        CurrentlyCoupledCDSJob: Record "CDS fps_job";
        Coupled: Text;
        FirstColumnStyle: Text;

    procedure SetCurrentlyCoupledCDSJob(CDSJob: Record "CDS fps_job")
    begin
        CurrentlyCoupledCDSJob := CDSJob;
    end;
}