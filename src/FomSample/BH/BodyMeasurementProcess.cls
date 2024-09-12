Class FomSample.BH.BodyMeasurementProcess Extends FomSample.BH.BaseProcess
{

Parameter SETTINGS = "FHIREndpoint:FHIR Configuration: selector?context={HS.FHIRServer.Util.ContextSearch/FHIRServerEndpoints},TargetConfigName:FHIR Configuration: selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Method OnRequest(pRequest As FomSample.Message.BodyMeasurement, Output pResponse As Ens.Response) As %Status
{
    #dim ex As %Exception.AbstractException
    try {
        // 検索パラメータの設定（ケースに応じて適宜変更）
        set query = "identifier=urn:oid:1.2.392.100495.20.3.51.11234567890|"_pRequest.PatientId

        // Searchリクエストを作成する
        #dim req As HS.FHIRServer.Interop.Request
        set req = ##class(FomSample.FHIRConverter.RequestFactory).Search("Patient",..FHIREndpoint, query)

        // FHIRサーバへPatientリソースの検索を行うため、ビジネスオペレーションにリクエストする
        #dim res As HS.FHIRServer.Interop.Response
        $$$ThrowOnError(..SendRequestSync(..TargetConfigName,req,.res))
        if (res.QuickStreamId '= "") {
            set qs = ##class(HS.SDA3.QuickStream).%OpenId(res.QuickStreamId)
            set resource = {}.%FromJSON(qs)
            if (resource.entry > 0) {
                // プライベートグローバル変数に Patient リソースの論理IDをセットして、あとで subject（Patientリファレンス）に使用する
                set ^||subjectId = resource.entry.%Get(0).resource.id
            }
        }

        #dim fomH, fomW As HS.FHIRModel.R4.Observation
        #dim bundle As HS.FHIRModel.R4.Bundle

        // 身長情報
        set fomH = ##class(FomSample.FHIRConverter.BodyMeasurement).ToFHIR4Height(pRequest)
        set st = ##class(FomSample.FHIRConverter.Bundle).CreateTransaction(fomH, .bundle)

        // 体重情報
        set fomW = ##class(FomSample.FHIRConverter.BodyMeasurement).ToFHIR4Weight(pRequest)
        set st = ##class(FomSample.FHIRConverter.Bundle).AddEntry(fomW, .bundle)
        set ..Bundle = bundle

        set st = ..Process()
        return:(st = -1) st
        return $$$OK
    }
    catch ex {
        return ex.AsStatus()
    }
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
