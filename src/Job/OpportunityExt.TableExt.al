tableextension 80001 "Opportunity Ext." extends Opportunity
{
    fields
    {
        field(50000; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job";
        }
    }
}
