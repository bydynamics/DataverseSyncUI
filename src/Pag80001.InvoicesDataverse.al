page 80004 "Invoices - Dataverse"
{
    ApplicationArea = All;
    Caption = 'Invoices - Dataverse';
    PageType = List;
    SourceTable = "CRM Invoice";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(AccountId; Rec.AccountId)
                {
                    ToolTip = 'Specifies the value of the Account field.', Comment = '%';
                }
                field(AccountIdName; Rec.AccountIdName)
                {
                    ToolTip = 'Specifies the value of the AccountIdName field.', Comment = '%';
                }
                field(BillTo_City; Rec.BillTo_City)
                {
                    ToolTip = 'Specifies the value of the Bill To City field.', Comment = '%';
                }
                field(BillTo_Composite; Rec.BillTo_Composite)
                {
                    ToolTip = 'Specifies the value of the Bill To Address field.', Comment = '%';
                }
                field(BillTo_Country; Rec.BillTo_Country)
                {
                    ToolTip = 'Specifies the value of the Bill To Country/Region field.', Comment = '%';
                }
                field(BillTo_Fax; Rec.BillTo_Fax)
                {
                    ToolTip = 'Specifies the value of the Bill To Fax field.', Comment = '%';
                }
                field(BillTo_Line1; Rec.BillTo_Line1)
                {
                    ToolTip = 'Specifies the value of the Bill To Street 1 field.', Comment = '%';
                }
                field(BillTo_Line2; Rec.BillTo_Line2)
                {
                    ToolTip = 'Specifies the value of the Bill To Street 2 field.', Comment = '%';
                }
                field(BillTo_Line3; Rec.BillTo_Line3)
                {
                    ToolTip = 'Specifies the value of the Bill To Street 3 field.', Comment = '%';
                }
                field(BillTo_Name; Rec.BillTo_Name)
                {
                    ToolTip = 'Specifies the value of the Bill To Name field.', Comment = '%';
                }
                field(BillTo_PostalCode; Rec.BillTo_PostalCode)
                {
                    ToolTip = 'Specifies the value of the Bill To ZIP/Postal Code field.', Comment = '%';
                }
                field(BillTo_StateOrProvince; Rec.BillTo_StateOrProvince)
                {
                    ToolTip = 'Specifies the value of the Bill To State/Province field.', Comment = '%';
                }
                field(BillTo_Telephone; Rec.BillTo_Telephone)
                {
                    ToolTip = 'Specifies the value of the Bill To Phone field.', Comment = '%';
                }
                field(CompanyId; Rec.CompanyId)
                {
                    ToolTip = 'Specifies the value of the Company Id field.', Comment = '%';
                }
                field(ContactId; Rec.ContactId)
                {
                    ToolTip = 'Specifies the value of the Contact field.', Comment = '%';
                }
                field(ContactIdName; Rec.ContactIdName)
                {
                    ToolTip = 'Specifies the value of the ContactIdName field.', Comment = '%';
                }
                field(CreatedBy; Rec.CreatedBy)
                {
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
                field(CreatedByName; Rec.CreatedByName)
                {
                    ToolTip = 'Specifies the value of the CreatedByName field.', Comment = '%';
                }
                field(CreatedOn; Rec.CreatedOn)
                {
                    ToolTip = 'Specifies the value of the Created On field.', Comment = '%';
                }
                field(CreatedOnBehalfBy; Rec.CreatedOnBehalfBy)
                {
                    ToolTip = 'Specifies the value of the Created By (Delegate) field.', Comment = '%';
                }
                field(CreatedOnBehalfByName; Rec.CreatedOnBehalfByName)
                {
                    ToolTip = 'Specifies the value of the CreatedOnBehalfByName field.', Comment = '%';
                }
                field(CustomerId; Rec.CustomerId)
                {
                    ToolTip = 'Specifies the value of the Customer field.', Comment = '%';
                }
                    field(CustomerIdType; Rec.CustomerIdType)
                    {
                        ToolTip = 'Specifies the value of the Customer Type field.', Comment = '%';
                    }
                field(DateDelivered; Rec.DateDelivered)
                {
                    ToolTip = 'Specifies the value of the Date Delivered field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(DiscountAmount; Rec.DiscountAmount)
                {
                    ToolTip = 'Specifies the value of the Invoice Discount Amount field.', Comment = '%';
                }
                field(DiscountAmount_Base; Rec.DiscountAmount_Base)
                {
                    ToolTip = 'Specifies the value of the Invoice Discount Amount (Base) field.', Comment = '%';
                }
                field(DiscountPercentage; Rec.DiscountPercentage)
                {
                    ToolTip = 'Specifies the value of the Invoice Discount (%) field.', Comment = '%';
                }
                field(DueDate; Rec.DueDate)
                {
                    ToolTip = 'Specifies the value of the Due Date field.', Comment = '%';
                }
                field(EntityImageId; Rec.EntityImageId)
                {
                    ToolTip = 'Specifies the value of the Entity Image Id field.', Comment = '%';
                }
                field(ExchangeRate; Rec.ExchangeRate)
                {
                    ToolTip = 'Specifies the value of the Exchange Rate field.', Comment = '%';
                }
                field(FreightAmount; Rec.FreightAmount)
                {
                    ToolTip = 'Specifies the value of the Freight Amount field.', Comment = '%';
                }
                field(FreightAmount_Base; Rec.FreightAmount_Base)
                {
                    ToolTip = 'Specifies the value of the Freight Amount (Base) field.', Comment = '%';
                }
                field(ImportSequenceNumber; Rec.ImportSequenceNumber)
                {
                    ToolTip = 'Specifies the value of the Import Sequence Number field.', Comment = '%';
                }
                field(InvoiceId; Rec.InvoiceId)
                {
                    ToolTip = 'Specifies the value of the Invoice field.', Comment = '%';
                }
                field(InvoiceNumber; Rec.InvoiceNumber)
                {
                    ToolTip = 'Specifies the value of the Invoice ID field.', Comment = '%';
                }
                field(IsPriceLocked; Rec.IsPriceLocked)
                {
                    ToolTip = 'Specifies the value of the Prices Locked field.', Comment = '%';
                }
                field(LastBackofficeSubmit; Rec.LastBackofficeSubmit)
                {
                    ToolTip = 'Specifies the value of the Last Submitted to Back Office field.', Comment = '%';
                }
                field(ModifiedBy; Rec.ModifiedBy)
                {
                    ToolTip = 'Specifies the value of the Modified By field.', Comment = '%';
                }
                field(ModifiedByName; Rec.ModifiedByName)
                {
                    ToolTip = 'Specifies the value of the ModifiedByName field.', Comment = '%';
                }
                field(ModifiedOn; Rec.ModifiedOn)
                {
                    ToolTip = 'Specifies the value of the Modified On field.', Comment = '%';
                }
                field(ModifiedOnBehalfBy; Rec.ModifiedOnBehalfBy)
                {
                    ToolTip = 'Specifies the value of the Modified By (Delegate) field.', Comment = '%';
                }
                field(ModifiedOnBehalfByName; Rec.ModifiedOnBehalfByName)
                {
                    ToolTip = 'Specifies the value of the ModifiedOnBehalfByName field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(OpportunityId; Rec.OpportunityId)
                {
                    ToolTip = 'Specifies the value of the Opportunity field.', Comment = '%';
                }
                field(OpportunityIdName; Rec.OpportunityIdName)
                {
                    ToolTip = 'Specifies the value of the OpportunityIdName field.', Comment = '%';
                }
                field(OverriddenCreatedOn; Rec.OverriddenCreatedOn)
                {
                    ToolTip = 'Specifies the value of the Record Created On field.', Comment = '%';
                }
                field(OwnerId; Rec.OwnerId)
                {
                    ToolTip = 'Specifies the value of the Owner field.', Comment = '%';
                }
                field(OwnerIdType; Rec.OwnerIdType)
                {
                    ToolTip = 'Specifies the value of the OwnerIdType field.', Comment = '%';
                }
                field(OwningBusinessUnit; Rec.OwningBusinessUnit)
                {
                    ToolTip = 'Specifies the value of the Owning Business Unit field.', Comment = '%';
                }
                field(OwningTeam; Rec.OwningTeam)
                {
                    ToolTip = 'Specifies the value of the Owning Team field.', Comment = '%';
                }
                field(OwningUser; Rec.OwningUser)
                {
                    ToolTip = 'Specifies the value of the Owning User field.', Comment = '%';
                }
                field(PaymentTermsCodeEnum; Rec.PaymentTermsCodeEnum)
                {
                    ToolTip = 'Specifies the value of the Payment Terms field.', Comment = '%';
                }
                field(PriceLevelId; Rec.PriceLevelId)
                {
                    ToolTip = 'Specifies the value of the Price List field.', Comment = '%';
                }
                field(PriceLevelIdName; Rec.PriceLevelIdName)
                {
                    ToolTip = 'Specifies the value of the PriceLevelIdName field.', Comment = '%';
                }
                field(PricingErrorCode; Rec.PricingErrorCode)
                {
                    ToolTip = 'Specifies the value of the Pricing Error field.', Comment = '%';
                }
                field(PriorityCode; Rec.PriorityCode)
                {
                    ToolTip = 'Specifies the value of the Priority field.', Comment = '%';
                }
                field(ProcessId; Rec.ProcessId)
                {
                    ToolTip = 'Specifies the value of the Process field.', Comment = '%';
                }
                field(SalesOrderId; Rec.SalesOrderId)
                {
                    ToolTip = 'Specifies the value of the Order field.', Comment = '%';
                }
                field(SalesOrderIdName; Rec.SalesOrderIdName)
                {
                    ToolTip = 'Specifies the value of the SalesOrderIdName field.', Comment = '%';
                }
                field(ShipTo_City; Rec.ShipTo_City)
                {
                    ToolTip = 'Specifies the value of the Ship To City field.', Comment = '%';
                }
                field(ShipTo_Composite; Rec.ShipTo_Composite)
                {
                    ToolTip = 'Specifies the value of the Ship To Address field.', Comment = '%';
                }
                field(ShipTo_Country; Rec.ShipTo_Country)
                {
                    ToolTip = 'Specifies the value of the Ship To Country/Region field.', Comment = '%';
                }
                field(ShipTo_Fax; Rec.ShipTo_Fax)
                {
                    ToolTip = 'Specifies the value of the Ship To Fax field.', Comment = '%';
                }
                field(ShipTo_FreightTermsCode; Rec.ShipTo_FreightTermsCode)
                {
                    ToolTip = 'Specifies the value of the Ship To Freight Terms field.', Comment = '%';
                }
                field(ShipTo_Line1; Rec.ShipTo_Line1)
                {
                    ToolTip = 'Specifies the value of the Ship To Street 1 field.', Comment = '%';
                }
                field(ShipTo_Line2; Rec.ShipTo_Line2)
                {
                    ToolTip = 'Specifies the value of the Ship To Street 2 field.', Comment = '%';
                }
                field(ShipTo_Line3; Rec.ShipTo_Line3)
                {
                    ToolTip = 'Specifies the value of the Ship To Street 3 field.', Comment = '%';
                }
                field(ShipTo_Name; Rec.ShipTo_Name)
                {
                    ToolTip = 'Specifies the value of the Ship To Name field.', Comment = '%';
                }
                field(ShipTo_PostalCode; Rec.ShipTo_PostalCode)
                {
                    ToolTip = 'Specifies the value of the Ship To ZIP/Postal Code field.', Comment = '%';
                }
                field(ShipTo_StateOrProvince; Rec.ShipTo_StateOrProvince)
                {
                    ToolTip = 'Specifies the value of the Ship To State/Province field.', Comment = '%';
                }
                field(ShipTo_Telephone; Rec.ShipTo_Telephone)
                {
                    ToolTip = 'Specifies the value of the Ship To Phone field.', Comment = '%';
                }
                field(ShippingMethodCodeEnum; Rec.ShippingMethodCodeEnum)
                {
                    ToolTip = 'Specifies the value of the Shipping Method field.', Comment = '%';
                }
                field(StageId; Rec.StageId)
                {
                    ToolTip = 'Specifies the value of the Process Stage field.', Comment = '%';
                }
                field(StateCode; Rec.StateCode)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(StatusCode; Rec.StatusCode)
                {
                    ToolTip = 'Specifies the value of the Status Reason field.', Comment = '%';
                }

                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }

                field(TimeZoneRuleVersionNumber; Rec.TimeZoneRuleVersionNumber)
                {
                    ToolTip = 'Specifies the value of the Time Zone Rule Version Number field.', Comment = '%';
                }
                field(TotalAmount; Rec.TotalAmount)
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
                field(TotalAmountLessFreight; Rec.TotalAmountLessFreight)
                {
                    ToolTip = 'Specifies the value of the Total Pre-Freight Amount field.', Comment = '%';
                }
                field(TotalAmountLessFreight_Base; Rec.TotalAmountLessFreight_Base)
                {
                    ToolTip = 'Specifies the value of the Total Pre-Freight Amount (Base) field.', Comment = '%';
                }
                field(TotalAmount_Base; Rec.TotalAmount_Base)
                {
                    ToolTip = 'Specifies the value of the Total Amount (Base) field.', Comment = '%';
                }
                field(TotalDiscountAmount; Rec.TotalDiscountAmount)
                {
                    ToolTip = 'Specifies the value of the Total Discount Amount field.', Comment = '%';
                }
                field(TotalDiscountAmount_Base; Rec.TotalDiscountAmount_Base)
                {
                    ToolTip = 'Specifies the value of the Total Discount Amount (Base) field.', Comment = '%';
                }
                field(TotalLineItemAmount; Rec.TotalLineItemAmount)
                {
                    ToolTip = 'Specifies the value of the Total Detail Amount field.', Comment = '%';
                }
                field(TotalLineItemAmount_Base; Rec.TotalLineItemAmount_Base)
                {
                    ToolTip = 'Specifies the value of the Total Detail Amount (Base) field.', Comment = '%';
                }
                field(TotalLineItemDiscountAmount; Rec.TotalLineItemDiscountAmount)
                {
                    ToolTip = 'Specifies the value of the Total Line Item Discount Amount field.', Comment = '%';
                }
                field(TotalLineItemDiscountAmount_Ba; Rec.TotalLineItemDiscountAmount_Ba)
                {
                    ToolTip = 'Specifies the value of the Total Line Item Discount Amount (Base) field.', Comment = '%';
                }
                field(TotalTax; Rec.TotalTax)
                {
                    ToolTip = 'Specifies the value of the Total Tax field.', Comment = '%';
                }
                field(TotalTax_Base; Rec.TotalTax_Base)
                {
                    ToolTip = 'Specifies the value of the Total Tax (Base) field.', Comment = '%';
                }
                field(TransactionCurrencyId; Rec.TransactionCurrencyId)
                {
                    ToolTip = 'Specifies the value of the Currency field.', Comment = '%';
                }
                field(TransactionCurrencyIdName; Rec.TransactionCurrencyIdName)
                {
                    ToolTip = 'Specifies the value of the TransactionCurrencyIdName field.', Comment = '%';
                }
                field(TraversedPath; Rec.TraversedPath)
                {
                    ToolTip = 'Specifies the value of the Traversed Path field.', Comment = '%';
                }
                field(UTCConversionTimeZoneCode; Rec.UTCConversionTimeZoneCode)
                {
                    ToolTip = 'Specifies the value of the UTC Conversion Time Zone Code field.', Comment = '%';
                }
                field(VersionNumber; Rec.VersionNumber)
                {
                    ToolTip = 'Specifies the value of the Version Number field.', Comment = '%';
                }
                field(WillCall; Rec.WillCall)
                {
                    ToolTip = 'Specifies the value of the Ship To field.', Comment = '%';
                }
            }
        }
    }
    trigger OnInit()
    begin
        CODEUNIT.Run(CODEUNIT::"CRM Integration Management");
        Commit();
    end;    
}
