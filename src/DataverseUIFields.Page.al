page 70101 "Dataverse UI Fields"
{
    PageType = List;
    SourceTable = "Dataverse UI Field";

    layout
    {
        area(Content)
        {
            repeater(repeaterName)
            {
                field("Mapping Name"; rec."Mapping Name")
                {
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("BC Table"; rec."BC Table")
                {
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("BC Table Caption"; rec."BC Table Caption")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("BC Field"; rec."BC Field")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        "Field": Record "Field";
                        FieldSelection: Codeunit "Field Selection";
                    begin
                        Field.SetRange(TableNo, rec."BC Table");
                        if FieldSelection.Open(Field) then begin
                            rec.Validate("BC Field", Field."No.");
                        end;
                    end;
                }
                field("BC Field Caption"; rec."BC Field Caption")
                {
                    ApplicationArea = All;
                }
                field("Dataverse Table"; rec."Dataverse Table")
                {
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Dataverse Table Caption"; rec."Dataverse Table Caption")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Dataverse Field"; rec."Dataverse Field")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        "Field": Record "Field";
                        FieldSelection: Codeunit "Field Selection";
                    begin
                        Field.SetRange(TableNo, rec."Dataverse Table");
                        if FieldSelection.Open(Field) then begin
                            rec.Validate("Dataverse Field", Field."No.");
                        end;
                    end;
                }
                field("Dataverse Field Caption"; rec."Dataverse Field Caption")
                {
                    ApplicationArea = All;
                }
                field("Sync Direction"; rec."Sync Direction")
                {
                    ApplicationArea = All;
                }
                field("Const Value"; rec."Const Value")
                {
                    ApplicationArea = All;
                }
                field("Validate Field"; rec."Validate Field")
                {
                    ApplicationArea = All;
                }
                field("Validate Integr Table Field"; rec."Validate Integr Table Field")
                {
                    ApplicationArea = All;
                }
                field("Show Field on Page"; rec."Field on CDS Page")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        "Field": Record Field;
                        FieldSelection: Codeunit "Field Selection";
                    begin
                        Field.SetRange(TableNo, Database::"Dataverse UI Temp Table");
                        Field.SetFilter("No.", '<>1&..1999999999');
                        if FieldSelection.Open(Field) then begin
                            rec."Field on CDS Page" := Field."No.";
                        end;
                    end;
                }
            }
        }
    }
    var
        SelectedFieldNotSupportedErr: Label 'Please select a field with the type text.';
}