pageextension 80001 "Opportunity List Ext." extends "Opportunity List"
{
    layout
    {
        addlast(Control1)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
                Caption = 'Job No.';
                ToolTip = 'Job No.';
            }
        }
    }

}
