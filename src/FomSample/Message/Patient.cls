Class FomSample.Message.Patient Extends Ens.Request
{

/// 患者ID
Property PatientId As %String;

/// 姓
Property LastName As %String;

/// 名
Property FirstName As %String;

/// 姓カナ
Property LastNameKana As %String;

/// 名カナ
Property FirstNameKana As %String;

/// 電話番号
Property PhoneNumber As %String;

/// 性別
Property Gender As %String;

/// 誕生日
Property BirthDate As %String;

/// 郵便番号
Property ZipCode As %String;

/// 住所
Property Address As %String;

// デバッグ用

Method %OnNew(a As %String, b As %String, c As %String, d As %String, e As %String, f As %String, g As %String, h As %String, i As %String, j As %String) As %Status
{
    set ..PatientId = a
    set ..LastName = b
    set ..FirstName = c
    set ..LastNameKana = d
    set ..FirstNameKana = e
    set ..PhoneNumber = f
    set ..Gender = g
    set ..BirthDate = h
    set ..ZipCode = i
    set ..Address = j
    return $$$OK
}

Storage Default
{
<Data name="PatientDefaultData">
<Subscript>"Patient"</Subscript>
<Value name="1">
<Value>PatientId</Value>
</Value>
<Value name="2">
<Value>LastName</Value>
</Value>
<Value name="3">
<Value>FirstName</Value>
</Value>
<Value name="4">
<Value>LastNameKana</Value>
</Value>
<Value name="5">
<Value>FirstNameKana</Value>
</Value>
<Value name="6">
<Value>PhoneNumber</Value>
</Value>
<Value name="7">
<Value>Gender</Value>
</Value>
<Value name="8">
<Value>BirthDate</Value>
</Value>
<Value name="9">
<Value>ZipCode</Value>
</Value>
<Value name="10">
<Value>Address</Value>
</Value>
</Data>
<DefaultData>PatientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
