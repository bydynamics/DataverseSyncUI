page 80007 "Dataverse Project"
{
    ApplicationArea = All;
    Caption = 'Project - Dataverse';
    AdditionalSearchTerms = 'Project CDS, Project Common Data Service';
    PageType = List;
    SourceTable = "CDS ctb_project";
    SourceTableView = sorting(createdon) order(ascending);
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ctb_name; Rec.ctb_name)
                {
                    ToolTip = 'Specifies the value of the Job Description field.', Comment = '%';
                } 
                field(ctb_projectcode; Rec.ctb_projectcode)
                {
                    ToolTip = 'Specifies the value of the Projectcode field.', Comment = '%';
                }                               
                field(cgk_bcprojectmanageriduserid; Rec.cgk_bcprojectmanageriduserid)
                {
                    ToolTip = 'Specifies the value of the Project Manager User field.', Comment = '%';
                }                 
                field(cgk_accountidName; Rec.cgk_accountidName)
                {
                    ToolTip = 'Specifies the value of the Account field.', Comment = '%';
                } 
                field(cgk_selltocustomerno; Rec.cgk_selltocustomerno)
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.', Comment = '%';
                }
                field(cgk_selltocustomername; Rec.cgk_selltocustomername)
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer Name field.', Comment = '%';
                }
                field(cgk_opportunityid; Rec.cgk_opportunityid)
                {
                    ToolTip = 'Specifies the value of the Opportunity field.', Comment = '%';
                }
                field(cgk_projectstatusbc; Rec.cgk_projectstatusbc)
                {
                    ToolTip = 'Specifies the value of the Project status BC field.', Comment = '%';
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
                    Visible = false;
                }
                field(ctb_additive; Rec.ctb_additive)
                {
                    ToolTip = 'Specifies the value of the Extra Regel field.', Comment = '%';
                    Visible = false;
                }
                field(ctb_city; Rec.ctb_city)
                {
                    ToolTip = 'Specifies the value of the Plaats field.', Comment = '%';
                    Visible = false;
                }
                field(ctb_country; Rec.ctb_country)
                {
                    ToolTip = 'Specifies the value of the Land field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_county; Rec.ctb_county)
                {
                    ToolTip = 'Specifies the value of the Provincie field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_description; Rec.ctb_description)
                {
                    ToolTip = 'Specifies the value of the Beschrijving field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_enddate; Rec.ctb_enddate)
                {
                    ToolTip = 'Specifies the value of the Einddatum field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_number; Rec.ctb_number)
                {
                    ToolTip = 'Specifies the value of the Nummer field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_postalcode; Rec.ctb_postalcode)
                {
                    ToolTip = 'Specifies the value of the Postcode field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_projectid; Rec.ctb_projectid)
                {
                    ToolTip = 'Specifies the value of the Project field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_projectscope; Rec.ctb_projectscope)
                {
                    ToolTip = 'Specifies the value of the Projectomvang field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_projectscope_base; Rec.ctb_projectscope_base)
                {
                    ToolTip = 'Specifies the value of the Project Scope (basis) field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_referenceproject; Rec.ctb_referenceproject)
                {
                    ToolTip = 'Specifies the value of the Referentieproject field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_sequence; Rec.ctb_sequence)
                {
                    ToolTip = 'Specifies the value of the Volgorde field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_startdate; Rec.ctb_startdate)
                {
                    ToolTip = 'Specifies the value of the Startdatum field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_street; Rec.ctb_street)
                {
                    ToolTip = 'Specifies the value of the Straat field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_systemcalculated; Rec.ctb_systemcalculated)
                {
                    ToolTip = 'Specifies the value of the Omzet field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_tagcodes; Rec.ctb_tagcodes)
                {
                    ToolTip = 'Specifies the value of the Tag Codes field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_totalamount; Rec.ctb_totalamount)
                {
                    ToolTip = 'Specifies the value of the Potenti‰le omzet field.', Comment = '%';
                    Visible = false;                    
                }
                field(ctb_totalamount_base; Rec.ctb_totalamount_base)
                {
                    ToolTip = 'Specifies the value of the Total Amount (basis) field.', Comment = '%';
                    Visible = false;                    
                }
                field(exchangerate; Rec.exchangerate)
                {
                    ToolTip = 'Specifies the value of the Wisselkoers field.', Comment = '%';
                    Visible = false;                    
                }
                field(importsequencenumber; Rec.importsequencenumber)
                {
                    ToolTip = 'Specifies the value of the Volgnummer van de import field.', Comment = '%';
                    Visible = false;                    
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
                    Visible = false;                    
                }
                field(overriddencreatedon; Rec.overriddencreatedon)
                {
                    ToolTip = 'Specifies the value of the Record is gemaakt op field.', Comment = '%';
                    Visible = false;                    
                }
                field(ownerid; Rec.ownerid)
                {
                    ToolTip = 'Specifies the value of the Eigenaar field.', Comment = '%';
                    Visible = false;                    
                }
                field(owningbusinessunit; Rec.owningbusinessunit)
                {
                    ToolTip = 'Specifies the value of the Eigendom van Business Unit field.', Comment = '%';
                    Visible = false;                    
                }
                field(owningteam; Rec.owningteam)
                {
                    ToolTip = 'Specifies the value of the Team dat eigenaar is field.', Comment = '%';
                    Visible = false;                    
                }
                field(owninguser; Rec.owninguser)
                {
                    ToolTip = 'Specifies the value of the Gebruiker die eigenaar is field.', Comment = '%';
                    Visible = false;                    
                }
                field(statecode; Rec.statecode)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    Visible = false;                    
                }
                field(statuscode; Rec.statuscode)
                {
                    ToolTip = 'Specifies the value of the Status Reason field.', Comment = '%';
                    Visible = false;                    
                }
                field(timezoneruleversionnumber; Rec.timezoneruleversionnumber)
                {
                    ToolTip = 'Specifies the value of the Versienummer van tijdzoneregel field.', Comment = '%';
                    Visible = false;                    
                }
                field(transactioncurrencyid; Rec.transactioncurrencyid)
                {
                    ToolTip = 'Specifies the value of the Valuta field.', Comment = '%';
                    Visible = false;                    
                }
                field(utcconversiontimezonecode; Rec.utcconversiontimezonecode)
                {
                    ToolTip = 'Specifies the value of the Tijdzonecode van UTC-conversie field.', Comment = '%';
                    Visible = false;                    
                }
                field(versionnumber; Rec.versionnumber)
                {
                    ToolTip = 'Specifies the value of the Versienummer field.', Comment = '%';
                    Visible = false;                    
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
                ToolTip = 'Generate the entity from the coupled Dataverse project.';

                trigger OnAction()
                var
                    CDSProject: Record "CDS ctb_project";
                    CRMIntegrationManagement: Codeunit "CRM Integration Management";
                begin
                    CurrPage.SetSelectionFilter(CDSProject);
                    CRMIntegrationManagement.CreateNewRecordsFromSelectedCRMRecords(CDSProject);
                end;
            }
            action(ShowOnlyUncoupled)
            {
                ApplicationArea = Suite;
                Caption = 'Hide Coupled Projects';
                Image = FilterLines;
                ToolTip = 'Do not show coupled Projects.';

                trigger OnAction()
                begin
                    MarkedOnly(true);
                end;
            }
            action(ShowAll)
            {
                ApplicationArea = Suite;
                Caption = 'Show Coupled Projects';
                Image = ClearFilter;
                ToolTip = 'Show coupled Projects.';

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
        if CRMIntegrationRecord.FindRecordIDFromID(ctb_projectid, DATABASE::Job, RecordID) then
            if CurrentlyCoupledCDSProject.ctb_projectid = ctb_projectid then begin
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
        SetView(LookupCRMTables.GetIntegrationTableMappingView(DATABASE::"CDS ctb_project"));
        FilterGroup(0);
    end;

    var
        CurrentlyCoupledCDSProject: Record "CDS ctb_project";
        Coupled: Text;
        FirstColumnStyle: Text;

    procedure SetCurrentlyCoupledCDSJob(CDSProject: Record "CDS ctb_project")
    begin
        CurrentlyCoupledCDSProject := CDSProject;
    end;    
}
