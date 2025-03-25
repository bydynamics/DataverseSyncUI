table 80005 "CDS fps_usersetup"
{
ExternalName = 'fps_usersetup';
TableType = CDS;
Description = 'An entity to store information about User Setup';
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
field(35; fps_email; Text[100])
{
ExternalName = 'fps_email';
ExternalType = 'String';
Description = 'Type the E-Mail of the User Setup';
Caption = 'E-Mail';
}
field(34; fps_userid; Text[50])
{
ExternalName = 'fps_userid';
ExternalType = 'String';
Description = 'Type the User ID of the User Setup';
Caption = 'User ID';
}
field(1; fps_usersetupid; GUID)
{
ExternalName = 'fps_usersetupid';
ExternalType = 'Uniqueidentifier';
Description = 'Unieke id van entiteitsexemplaren';
Caption = 'User Setup';
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
key(PK; fps_usersetupid)
{
Clustered = true;
}
key(Name; fps_userid)
{
}
}
fieldgroups
{
fieldgroup(Dropdown; fps_userid)
{
}
}
}
 