tableextension 80006 "Dataverse User Setup" extends "User Setup"
{
    fields
    {
        field(80000; "User Full Name"; Text[80])
        {
            CalcFormula = lookup(User."Full Name" where("User Name" = field("User ID")));
            Caption = 'User Full Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
