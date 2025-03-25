page 80006 "UserSetupDataverse"
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
}
