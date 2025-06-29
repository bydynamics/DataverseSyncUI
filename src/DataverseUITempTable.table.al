table 80006 "Dataverse UI Temp Table"
{
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; CRMId; GUID)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Id; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Textfield1; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Textfield2; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Textfield3; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; CRMId)
        {
            Clustered = true;
        }
    }
}