Class FomSample.FHIRConverter.Bundle Extends %RegisteredObject
{

ClassMethod CreateTransaction(resource As HS.FHIRModel.FHIRClassSuper, ByRef bundle As HS.FHIRModel.R4.Bundle) As %Status
{
    if ($GET(bundle)="") {
        set bundle = ##class(HS.FHIRModel.R4.Bundle).%New()
        set bundle.type = "transaction"
        do bundle.IncludeEntry()
    }
    set st = ..AddEntry(resource, .bundle)

    return $$$OK
}

ClassMethod AddEntry(resource As HS.FHIRModel.FHIRClassSuper, ByRef bundle As HS.FHIRModel.R4.Bundle) As %Status
{
    set entry = bundle.entry.MakeEntry()
    set entry.fullUrl = "urn:uuid:"_$ZCONVERT($SYSTEM.Util.CreateGUID(),"L")
    do entry.IncludeResource()
    set entry.resource = resource
    do entry.IncludeRequest()
    // ここでは POST 固定としているが、必要に応じて method は選定する
    set entry.request.method = "POST"
    set entry.request.url = resource.resourceType
    // Patientリソースの場合、既に存在する identifier(患者ID) は POST しないように ifNoneExist を設定する
    set:resource.resourceType="Patient" entry.request.ifNoneExist = "identifier=urn:oid:1.2.392.100495.20.3.51.11234567890|"_resource.identifier.get(0).get("value")
    do bundle.entry.add(entry)

    return $$$OK
}

}
