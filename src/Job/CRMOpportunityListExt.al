pageextension 80000 "CRM Opportunity List Ext." extends "CRM Opportunity List"
{
    layout
    {
        addlast(Group)
        {
            field(ivgroep_projectnummer; Rec.ivgroep_projectnummer)
            {
                ApplicationArea = All;
                Caption = 'ivgroep_projectnummer';
                ToolTip = 'ivgroep_projectnummer';
            }
        }
    }
}
