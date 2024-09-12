Class FomSample.Message.BodyMeasurement Extends Ens.Request
{

/// 患者ID
Property PatientId As %String;

/// 身長
Property Height As %String;

/// 身長の計測日
Property HeightMeasurementDate As %String;

/// 身長の単位
Property HeightUnit As %String;

/// 体重
Property Weight As %String;

/// 体重の計測日
Property WeightMeasurementDate As %String;

/// 体重の単位
Property WeightUnit As %String;

// デバッグ用

Method %OnNew(a As %String, b As %String, c As %String, d As %String, e As %String, f As %String, g As %String) As %Status
{
    set ..PatientId = a
    set ..Height = b
    set ..HeightMeasurementDate = c
    set ..HeightUnit = d
    set ..Weight = e
    set ..WeightMeasurementDate = f
    set ..WeightUnit = g
    return $$$OK
}

Storage Default
{
<Data name="BodyMeasurementDefaultData">
<Subscript>"BodyMeasurement"</Subscript>
<Value name="1">
<Value>PatientId</Value>
</Value>
<Value name="2">
<Value>Height</Value>
</Value>
<Value name="3">
<Value>HeightMeasurementDate</Value>
</Value>
<Value name="4">
<Value>HeightUnit</Value>
</Value>
<Value name="5">
<Value>Weight</Value>
</Value>
<Value name="6">
<Value>WeightMeasurementDate</Value>
</Value>
<Value name="7">
<Value>WeightUnit</Value>
</Value>
</Data>
<DefaultData>BodyMeasurementDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
