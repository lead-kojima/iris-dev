/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'FomSample.RM.Patient'
/// on 2024-09-11 at 16:29:02.235 [2024-09-11 07:29:02.235 UTC]
/// by user _SYSTEM
Class FomSample.RM.Patient.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property PatientId As %String [ Required, SqlColumnNumber = 2 ];

Property LastName As %String [ SqlColumnNumber = 3 ];

Property FirstName As %String [ SqlColumnNumber = 4 ];

Property LastNameKana As %String [ SqlColumnNumber = 5 ];

Property FirstNameKana As %String [ SqlColumnNumber = 6 ];

Property PhoneNumber As %String [ SqlColumnNumber = 7 ];

Property Gender As %String [ SqlColumnNumber = 8 ];

Property BirthDate As %String [ SqlColumnNumber = 9 ];

Property ZipCode As %String [ SqlColumnNumber = 10 ];

Property Address As %String [ SqlColumnNumber = 11 ];

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientId</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>FirstName</Value>
</Value>
<Value name="5">
<Value>LastNameKana</Value>
</Value>
<Value name="6">
<Value>FirstNameKana</Value>
</Value>
<Value name="7">
<Value>PhoneNumber</Value>
</Value>
<Value name="8">
<Value>Gender</Value>
</Value>
<Value name="9">
<Value>BirthDate</Value>
</Value>
<Value name="10">
<Value>ZipCode</Value>
</Value>
<Value name="11">
<Value>Address</Value>
</Value>
<Value name="12">
<Value>LastName</Value>
</Value>
</Data>
<DataLocation>^FomSample.RM.Patient.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^FomSample.RM.Patient.RecordD</IdLocation>
<IndexLocation>^FomSample.RM.Patient.RecordI</IndexLocation>
<StreamLocation>^FomSample.RM.Patient.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

Parameter RECORDMAPGENERATED = 1;

}
