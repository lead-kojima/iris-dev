Class FomSample.FHIRConverter.BodyMeasurement Extends %RegisteredObject
{

Parameter CategorySystem = "http://hl7.org/fhir/ValueSet/observation-category";

Parameter CategoryCode = "vital-signs";

Parameter CategoryDisplay = "Vital Signs";

Parameter CodeSystem = "http://loinc.org";

ClassMethod ToFHIR4Height(msg As FomSample.Message.BodyMeasurement) As HS.FHIRModel.R4.Observation
{
    #dim fom As HS.FHIRModel.R4.Observation
    set fom = ##class(HS.FHIRModel.R4.Observation).%New()

    // Memo: 
    // - IncludeXXXX() : 要素またはコレクション構造を追加
    // - MakeEntry() : コレクション・オブジェクトの要素を生成
    // - add() で SeqOfXXXXクラスのリストに %Push する

    // ステータス
    set fom.status = "final"

    // カテゴリ
    do fom.IncludeCategory()
    set category = fom.category.MakeEntry()
    do category.IncludeCoding()
    set coding = category.coding.MakeEntry()
    set coding.system = ..#CategorySystem
    set coding.code = ..#CategoryCode
    set coding.display = ..#CategoryDisplay
    do category.coding.add(coding)
    do fom.category.add(category)

    // コード
    do fom.IncludeCode()
    do fom.code.IncludeCoding()
    set coding = fom.code.coding.MakeEntry()
    set coding.system = ..#CodeSystem
    set coding.code = "8302-2"
    do fom.code.coding.add(coding)

    // Patientリファレンス
    do fom.IncludeSubject()
    set fom.subject.reference = "Patient/"_^||subjectId

    // 測定日
    set fom.effectiveDateTime = msg.HeightMeasurementDate

    // 身長情報
    do fom.IncludeValueQuantity()
    set fom.valueQuantity.value = $NUMBER(msg.Height)
    set fom.valueQuantity.unit = msg.HeightUnit

    return fom
}

ClassMethod ToFHIR4Weight(msg As FomSample.Message.BodyMeasurement) As HS.FHIRModel.R4.Observation
{
    #dim fom As HS.FHIRModel.R4.Observation
    set fom = ##class(HS.FHIRModel.R4.Observation).%New()

    // Memo: 
    // - IncludeXXXX() : 要素またはコレクション構造を追加
    // - MakeEntry() : コレクション・オブジェクトの要素を生成
    // - add() で SeqOfXXXXクラスのリストに %Push する

    // ステータス
    set fom.status = "final"

    // カテゴリ
    do fom.IncludeCategory()
    set category = fom.category.MakeEntry()
    do category.IncludeCoding()
    set coding = category.coding.MakeEntry()
    set coding.system = ..#CategorySystem
    set coding.code = ..#CategoryCode
    set coding.display = ..#CategoryDisplay
    do category.coding.add(coding)
    do fom.category.add(category)

    // コード
    do fom.IncludeCode()
    do fom.code.IncludeCoding()
    set coding = fom.code.coding.MakeEntry()
    set coding.system = ..#CodeSystem
    set coding.code = "29463-7"
    do fom.code.coding.add(coding)

    // Patientリファレンス
    do fom.IncludeSubject()
    set fom.subject.reference = "Patient/"_^||subjectId

    // 測定日
    set fom.effectiveDateTime = msg.WeightMeasurementDate

    // 体重情報
    do fom.IncludeValueQuantity()
    set fom.valueQuantity.value = $NUMBER(msg.Weight)
    set fom.valueQuantity.unit = msg.WeightUnit

    return fom
}

}
