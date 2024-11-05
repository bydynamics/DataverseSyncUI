table 80004 "CDS fps_job"
{
ExternalName = 'fps_job';
TableType = CDS;
Description = 'An entity to store information about Job';
fields
{
field(3; createdby; GUID)
{
ExternalName = 'createdby';
ExternalType = 'Lookup';
Description = 'Unieke id van de gebruiker die de record heeft gemaakt.';
Caption = 'Gemaakt door';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(2; createdon; Date)
{
ExternalName = 'createdon';
ExternalType = 'DateTime';
ExternalAccess = Read;
Description = 'Datum en tijdstip waarop de record is gemaakt.';
Caption = 'Gemaakt op';
}
field(6; createdonbehalfby; GUID)
{
ExternalName = 'createdonbehalfby';
ExternalType = 'Lookup';
Description = 'Unieke id van de gemachtigde gebruiker die de record heeft gemaakt.';
Caption = 'Gemaakt door (gemachtigde)';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(35; fps_description; Text[100])
{
ExternalName = 'fps_description';
ExternalType = 'String';
Description = 'Type the Description of the Job';
Caption = 'Description';
}
field(1; fps_jobid; GUID)
{
ExternalName = 'fps_jobid';
ExternalType = 'Uniqueidentifier';
Description = 'Unieke id van entiteitsexemplaren';
Caption = 'Job';
}
field(39; fps_jobstatus; Option)
{
ExternalName = 'fps_jobstatus';
ExternalType = 'Picklist';
Description = 'Type the Job Status of the Job';
Caption = 'Job Status';
InitValue = Planning;
OptionCaption = 'Planning,Quote,Order,Delivered,Completed,Rejected';
OptionOrdinalValues = 0, 1, 2, 3, 4, 5;
OptionMembers = Planning,Quote,Order,Delivered,Completed,Rejected;
}
field(34; fps_no; Text[20])
{
ExternalName = 'fps_no';
ExternalType = 'String';
Description = 'Type the No. of the Job';
Caption = 'No.';
}
field(36; fps_projectmanager; Text[50])
{
ExternalName = 'fps_projectmanager';
ExternalType = 'String';
Description = 'Type the Project Manager of the Job';
Caption = 'Project Manager';
}
field(38; fps_selltocustomername; Text[100])
{
ExternalName = 'fps_selltocustomername';
ExternalType = 'String';
Description = 'Type the Sell-to Customer Name of the Job';
Caption = 'Sell-to Customer Name';
}
field(37; fps_selltocustomerno; Text[20])
{
ExternalName = 'fps_selltocustomerno';
ExternalType = 'String';
Description = 'Type the Sell-to Customer No. of the Job';
Caption = 'Sell-to Customer No.';
}
field(30; importsequencenumber; Integer)
{
ExternalName = 'importsequencenumber';
ExternalType = 'Integer';
Description = 'Volgnummer van de import waarmee deze record is gemaakt.';
Caption = 'Volgnummer van de importbewerking';
}
field(5; modifiedby; GUID)
{
ExternalName = 'modifiedby';
ExternalType = 'Lookup';
Description = 'Unieke id van de gebruiker die de record heeft gewijzigd.';
Caption = 'Gewijzigd door';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(4; modifiedon; Date)
{
ExternalName = 'modifiedon';
ExternalType = 'DateTime';
ExternalAccess = Read;
Description = 'Datum en tijdstip waarop de record is gewijzigd.';
Caption = 'Gewijzigd op';
}
field(7; modifiedonbehalfby; GUID)
{
ExternalName = 'modifiedonbehalfby';
ExternalType = 'Lookup';
Description = 'Unieke id van de gemachtigde gebruiker die de record heeft gewijzigd.';
Caption = 'Gewijzigd door (gemachtigde)';
TableRelation = "CRM Systemuser"."SystemUserId";
}
field(31; overriddencreatedon; Date)
{
ExternalName = 'overriddencreatedon';
ExternalType = 'DateTime';
ExternalAccess = Read;
Description = 'Datum en tijdstip waarop de record is gemigreerd.';
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
Description = 'Unieke id van de business unit die eigenaar is van de record';
Caption = 'Business unit die eigenaar is';
TableRelation = "CRM Businessunit"."BusinessUnitId";
}
field(23; owningteam; GUID)
{
ExternalName = 'owningteam';
ExternalType = 'Lookup';
Description = 'Unieke id van het team dat eigenaar is van de record.';
Caption = 'Team dat eigenaar is';
TableRelation = "CRM Team"."TeamId";
}
field(22; owninguser; GUID)
{
ExternalName = 'owninguser';
ExternalType = 'Lookup';
Description = 'Unieke id van de gebruiker die eigenaar is van de record.';
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
field(32; timezoneruleversionnumber; Integer)
{
ExternalName = 'timezoneruleversionnumber';
ExternalType = 'Integer';
Description = 'Uitsluitend voor intern gebruik.';
Caption = 'Versienummer van tijdzoneregel';
}
field(33; utcconversiontimezonecode; Integer)
{
ExternalName = 'utcconversiontimezonecode';
ExternalType = 'Integer';
Description = 'Tijdzonecode die is gebruikt bij het maken van de record.';
Caption = 'Tijdzonecode voor UTC-conversie';
}
field(29; versionnumber; BigInteger)
{
ExternalName = 'versionnumber';
ExternalType = 'BigInt';
Description = 'Versienummer';
Caption = 'Versienummer';
}
}
keys
{
key(PK; fps_jobid)
{
Clustered = true;
}
key(Name; fps_no)
{
}
}
fieldgroups
{
fieldgroup(Dropdown; fps_no)
{
}
}
}
 