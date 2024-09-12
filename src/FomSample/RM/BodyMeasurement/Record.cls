/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'FomSample.RM.BodyMeasurement'
/// on 2024-09-11 at 16:29:17.583 [2024-09-11 07:29:17.583 UTC]
/// by user _SYSTEM
Class FomSample.RM.BodyMeasurement.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property PatientId As %String [ Required, SqlColumnNumber = 2 ];

Property Height As %String [ SqlColumnNumber = 3 ];

Property HeightMeasurementDate As %String [ SqlColumnNumber = 4 ];

Property HeightUnit As %String [ SqlColumnNumber = 5 ];

Property Weight As %String [ SqlColumnNumber = 6 ];

Property WeightMeasurementDate As %String [ SqlColumnNumber = 7 ];

Property WeightUnit As %String [ SqlColumnNumber = 8 ];

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
<Value>HeightMeasurementDate</Value>
</Value>
<Value name="5">
<Value>HeightUnit</Value>
</Value>
<Value name="6">
<Value>Weight</Value>
</Value>
<Value name="7">
<Value>WeightMeasurementDate</Value>
</Value>
<Value name="8">
<Value>WeightUnit</Value>
</Value>
<Value name="9">
<Value>Height</Value>
</Value>
</Data>
<DataLocation>^FomSample.RM.BodyMeDC78.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^FomSample.RM.BodyMeDC78.RecordD</IdLocation>
<IndexLocation>^FomSample.RM.BodyMeDC78.RecordI</IndexLocation>
<StreamLocation>^FomSample.RM.BodyMeDC78.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

Parameter RECORDMAPGENERATED = 1;

}
