tableextension 80000 "CRM Opportunity Ext." extends "CRM Opportunity"
{
    fields
    {
        field(80000; ivgroep_projectnummer; Text[100])
        {
            Caption = 'ivgroep_projectnummer';
            DataClassification = ToBeClassified;
            ExternalName = 'ivgroep_projectnummer';
            ExternalType = 'String'; 
            TableRelation = "Job";            
        }
    }
}
