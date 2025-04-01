table 80006 "CDS ctb_project"
{
ExternalName = 'ctb_project';
TableType = CDS;
Description = 'An entity to store information about Job';
fields
{
field(67; cgk_accountid; GUID)
{
ExternalName = 'cgk_accountid';
ExternalType = 'Lookup';
Description = '';
Caption = 'Account';
TableRelation = "CRM Account"."AccountId";
}
field(68; cgk_accountidname; Text[160])
{
CalcFormula = lookup("CRM Account".Name where(AccountId = field(cgk_accountid)));
Caption = 'Account Name';
ExternalAccess = Read;
ExternalName = 'cgk_accountidname';
ExternalType = 'String';
FieldClass = FlowField;
}
field(79; cgk_bcprojectmanagerid; GUID)
{
ExternalName = 'cgk_bcprojectmanagerid';
ExternalType = 'Lookup';
Description = '';
Caption = 'Project Manager';
TableRelation = "CDS fps_usersetup"."fps_usersetupid";
}
field(80; cgk_bcprojectmanageriduserid; Text[100])
{
CalcFormula = lookup("CDS fps_usersetup".fps_userid where(fps_usersetupid = field(cgk_bcprojectmanagerid)));
Caption = 'Project Manager User Id';
ExternalAccess = Read;
ExternalName = 'cgk_bcprojectmanageriduserid';
ExternalType = 'String';
FieldClass = FlowField;
}
field(65; cgk_opportunityid; GUID)
{
ExternalName = 'cgk_opportunityid';
ExternalType = 'Lookup';
Description = '';
Caption = 'Opportunity';
TableRelation = "CRM Opportunity"."OpportunityId";
}
field(75; cgk_projectstatusbc; Option)
{
ExternalName = 'cgk_projectstatusbc';
ExternalType = 'Picklist';
Description = '';
Caption = 'Project status BC';
OptionMembers = Planning,Quote,Order,Delivered,Completed,Rejected;
}
field(3; createdby; GUID)
{
ExternalName = 'createdby';
ExternalType = 'Lookup';
Description = 'De unieke id van de gebruiker die de record heeft gemaakt.';
Caption = 'Gemaakt door';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(2; createdon; DateTime)
{
ExternalName = 'createdon';
ExternalType = 'DateTime';
ExternalAccess = Read;
Description = 'De datum en het tijdstip waarop de record is gemaakt.';
Caption = 'Gemaakt op';
}
field(6; createdonbehalfby; GUID)
{
ExternalName = 'createdonbehalfby';
ExternalType = 'Lookup';
Description = 'De unieke id van de gemachtigde gebruiker die de record heeft gemaakt.';
Caption = 'Gemaakt door (gemachtigde)';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(34; ctb_additive; Text[50])
{
ExternalName = 'ctb_additive';
ExternalType = 'String';
Description = 'Extra regel voor de projectlocatie.';
Caption = 'Extra Regel';
}
field(35; ctb_city; Text[50])
{
ExternalName = 'ctb_city';
ExternalType = 'String';
Description = 'Plaats van de projectlocatie.';
Caption = 'Plaats';
}
field(36; ctb_country; Text[50])
{
ExternalName = 'ctb_country';
ExternalType = 'String';
Description = 'Land van de projectlocatie.';
Caption = 'Land';
}
field(38; ctb_county; Text[50])
{
ExternalName = 'ctb_county';
ExternalType = 'String';
Description = 'Provincie van het adresblok.';
Caption = 'Provincie';
}
field(39; ctb_description; Text[250])
{
ExternalName = 'ctb_description';
ExternalType = 'Memo';
Description = 'Beschrijving van het project.';
Caption = 'Beschrijving';
}
field(40; ctb_enddate; Date)
{
ExternalName = 'ctb_enddate';
ExternalType = 'DateTime';
Description = 'Einddatum van het project.';
Caption = 'Einddatum';
}
field(33; ctb_name; Text[100])
{
ExternalName = 'ctb_name';
ExternalType = 'String';
Description = 'The name of the custom entity.';
Caption = 'Job Description';
}
field(41; ctb_number; Text[50])
{
ExternalName = 'ctb_number';
ExternalType = 'String';
Description = 'Huisnummer van de projectlocatie.';
Caption = 'Nummer';
}
field(43; ctb_postalcode; Text[20])
{
ExternalName = 'ctb_postalcode';
ExternalType = 'String';
Description = 'Postcode van de projectlocatie.';
Caption = 'Postcode';
}
field(44; ctb_projectcode; Text[20])
{
ExternalName = 'ctb_projectcode';
ExternalType = 'String';
Description = 'Code of the project.';
Caption = 'Projectcode';
TableRelation = Job."No.";
}
field(1; ctb_projectid; GUID)
{
ExternalName = 'ctb_projectid';
ExternalType = 'Uniqueidentifier';
Description = 'De unieke id voor entiteitsexemplaren';
Caption = 'Project';
}
field(45; ctb_projectscope; Decimal)
{
ExternalName = 'ctb_projectscope';
ExternalType = 'Money';
Description = 'Totale projectomvang.';
Caption = 'Projectomvang';
}
field(49; ctb_projectscope_base; Decimal)
{
ExternalName = 'ctb_projectscope_base';
ExternalType = 'Money';
ExternalAccess = Read;
Description = 'Waarde van Project Scope in basisvaluta.';
Caption = 'Project Scope (basis)';
}
field(51; ctb_referenceproject; Boolean)
{
ExternalName = 'ctb_referenceproject';
ExternalType = 'Boolean';
Description = 'Geeft aan of het om een referentieproject gaat.';
Caption = 'Referentieproject';
}
field(53; ctb_sequence; Text[5])
{
ExternalName = 'ctb_sequence';
ExternalType = 'String';
Description = 'Volgorde van het subproject.';
Caption = 'Volgorde';
}
field(54; ctb_startdate; Date)
{
ExternalName = 'ctb_startdate';
ExternalType = 'DateTime';
Description = 'Startdatum van het project.';
Caption = 'Startdatum';
}
field(55; ctb_street; Text[50])
{
ExternalName = 'ctb_street';
ExternalType = 'String';
Description = 'Straat van de projectlocatie.';
Caption = 'Straat';
}
field(56; ctb_systemcalculated; Boolean)
{
ExternalName = 'ctb_systemcalculated';
ExternalType = 'Boolean';
Description = 'Geeft aan of het bedrag automatisch berekend wordt.';
Caption = 'Omzet';
}
field(58; ctb_tagcodes; Text[250])
{
ExternalName = 'ctb_tagcodes';
ExternalType = 'Memo';
Description = 'Field to store Tag Codes of linked Tags.';
Caption = 'Tag Codes';
}
field(59; ctb_totalamount; Decimal)
{
ExternalName = 'ctb_totalamount';
ExternalType = 'Money';
Description = 'Potenti‰le omzet van het project.';
Caption = 'Potenti‰le omzet';
}
field(60; ctb_totalamount_base; Decimal)
{
ExternalName = 'ctb_totalamount_base';
ExternalType = 'Money';
ExternalAccess = Read;
Description = 'Waarde van Total Amount in basisvaluta.';
Caption = 'Total Amount (basis)';
}
field(48; exchangerate; Decimal)
{
ExternalName = 'exchangerate';
ExternalType = 'Decimal';
ExternalAccess = Read;
Description = 'Wisselkoers voor de valuta die aan de entiteit is gekoppeld met betrekking tot de basisvaluta.';
Caption = 'Wisselkoers';
}
field(29; importsequencenumber; Integer)
{
ExternalName = 'importsequencenumber';
ExternalType = 'Integer';
Description = 'Volgnummer van de import waardoor deze record is gemaakt.';
Caption = 'Volgnummer van de import';
}
field(5; modifiedby; GUID)
{
ExternalName = 'modifiedby';
ExternalType = 'Lookup';
Description = 'Unieke id van de gebruiker die de record heeft gewijzigd.';
Caption = 'Gewijzigd door';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(4; modifiedon; DateTime)
{
ExternalName = 'modifiedon';
ExternalType = 'DateTime';
ExternalAccess = Read;
Description = 'De datum en het tijdstip waarop de record is gewijzigd.';
Caption = 'Gewijzigd op';
}
field(7; modifiedonbehalfby; GUID)
{
ExternalName = 'modifiedonbehalfby';
ExternalType = 'Lookup';
Description = 'De unieke id van de gemachtigde gebruiker die de record heeft gewijzigd.';
Caption = 'Gewijzigd door (gemachtigde)';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(30; overriddencreatedon; DateTime)
{
ExternalName = 'overriddencreatedon';
ExternalType = 'DateTime';
ExternalAccess = Read;
Description = 'Datum en tijd waarop de record is gemigreerd.';
Caption = 'Record is gemaakt op';
}
field(16; ownerid; GUID)
{
ExternalName = 'ownerid';
ExternalType = 'Owner';
Description = 'Eigenaar-id';
Caption = 'Eigenaar';
}
field(21; owningbusinessunit; GUID)
{
ExternalName = 'owningbusinessunit';
ExternalType = 'Lookup';
Description = 'De unieke id voor de Business Unit die eigenaar is van de record';
Caption = 'Eigendom van Business Unit';
TableRelation = "CRM Businessunit"."BusinessUnitId";
}
field(23; owningteam; GUID)
{
ExternalName = 'owningteam';
ExternalType = 'Lookup';
Description = 'De unieke id voor het team dat eigenaar is van de record.';
Caption = 'Team dat eigenaar is';
TableRelation = "CRM Team"."TeamId";
}
field(22; owninguser; GUID)
{
ExternalName = 'owninguser';
ExternalType = 'Lookup';
Description = 'De unieke id voor de gebruiker die eigenaar is van de record.';
Caption = 'Gebruiker die eigenaar is';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(25; statecode; Option)
{
Caption = 'Status';
Description = 'Shows whether the contact is active or inactive. Inactive contacts are read-only and can''t be edited unless they are reactivated.';
ExternalAccess = Modify;
ExternalName = 'statecode';
ExternalType = 'State';
InitValue = Active;
OptionCaption = 'Active,Inactive';
OptionOrdinalValues = 0, 1;
OptionMembers = Active,Inactive;
}
field(27; statuscode; Option)
{
Caption = 'Status Reason';
Description = 'Select the contact''s status.';
ExternalName = 'statuscode';
ExternalType = 'Status';
InitValue = " ";
OptionCaption = ' ,Active,Inactive';
OptionOrdinalValues = -1, 1, 2;
OptionMembers = " ",Active,Inactive;
}
field(31; timezoneruleversionnumber; Integer)
{
ExternalName = 'timezoneruleversionnumber';
ExternalType = 'Integer';
Description = 'Uitsluitend voor intern gebruik.';
Caption = 'Versienummer van tijdzoneregel';
}
field(46; transactioncurrencyid; GUID)
{
ExternalName = 'transactioncurrencyid';
ExternalType = 'Lookup';
Description = 'Unieke id van de valuta die aan de entiteit is gekoppeld.';
Caption = 'Valuta';
TableRelation = "CRM Transactioncurrency"."TransactionCurrencyId";
}
field(32; utcconversiontimezonecode; Integer)
{
ExternalName = 'utcconversiontimezonecode';
ExternalType = 'Integer';
Description = 'Tijdzonecode die is gebruikt toen de record werd gemaakt.';
Caption = 'Tijdzonecode van UTC-conversie';
}
field(28; versionnumber; BigInteger)
{
ExternalName = 'versionnumber';
ExternalType = 'BigInt';
Description = 'Versienummer';
Caption = 'Versienummer';
}
field(70; cgk_selltocustomername; Text[100])
{
ExternalName = 'cgk_selltocustomername';
ExternalType = 'String';
Description = 'Type the Sell-to Customer Name of the Job';
Caption = 'Sell-to Customer Name';
}
field(71; cgk_selltocustomerno; Text[20])
{
ExternalName = 'cgk_selltocustomerno';
ExternalType = 'String';
Description = 'Type the Sell-to Customer No. of the Job';
Caption = 'Sell-to Customer No.';
TableRelation = Customer."No.";
}
}
keys
{
key(PK; ctb_projectid)
{
Clustered = true;
}
key(Key1; ctb_name)
{
}
key(Key2; createdon)
{
}
}
fieldgroups
{
fieldgroup(Dropdown; ctb_name)
{
}
}
}
 