Class FomSample.FHIRConverter.Patient Extends %RegisteredObject
{

Parameter NameExUrl = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation";

ClassMethod ToFHIR(msg As FomSample.Message.Patient) As HS.FHIRModel.R4.Patient
{
    #dim fom As HS.FHIRModel.R4.Patient
    set fom = ##class(HS.FHIRModel.R4.Patient).%New()

    // Memo: 
    // - IncludeXXXX() : 要素またはコレクション構造を追加
    // - MakeEntry() : コレクション・オブジェクトの要素を生成
    // - add() で SeqOfXXXXクラスのリストに %Push する

    // 患者ID
    do fom.IncludeIdentifier()
    set identifier = fom.identifier.MakeEntry()
    set identifier.system = "urn:oid:1.2.392.100495.20.3.51.11234567890"
    set identifier.value = msg.PatientId
    do fom.identifier.add(identifier)

    // 姓名
    do fom.IncludeName()
    set name = fom.name.MakeEntry()
    do name.IncludeExtension()
    set nameEx = name.extension.MakeEntry()
    set nameEx.url = ..#NameExUrl
    set nameEx.valueCode = "IDE"
    do name.extension.add(nameEx)
    set name.family = msg.LastName
    do name.IncludeGiven()
    do name.given.add(msg.FirstName)
    set name.text = msg.LastName_" "_msg.FirstName
    do fom.name.add(name)

    // 姓名カナ
    set kana = fom.name.MakeEntry()
    do kana.IncludeExtension()
    set kanaEx = kana.extension.MakeEntry()
    set kanaEx.url = ..#NameExUrl
    set kanaEx.valueCode = "SYL"
    do kana.extension.add(kanaEx)
    set kana.family = msg.LastNameKana
    do kana.IncludeGiven()
    do kana.given.add(msg.FirstNameKana)
    set kana.text = msg.LastNameKana_" "_msg.FirstNameKana
    do fom.name.add(kana)

    // 電話番号
    do fom.IncludeTelecom()
    set telecom = fom.telecom.MakeEntry()
    set telecom.system = "phone"
    set telecom.value = msg.PhoneNumber
    set telecom.use = "mobile"
    do fom.telecom.add(telecom)

    // 性別
    set fom.gender = $CASE(msg.Gender, "男": "male", "女": "female", : "unknown")

    // 誕生日
    set fom.birthDate = msg.BirthDate

    // 住所
    do fom.IncludeAddress()
    set address = fom.address.MakeEntry()
    set address.text = msg.Address
    set address.postalCode = msg.ZipCode
    do fom.address.add(address)

    return fom
}

}
