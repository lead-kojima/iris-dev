Class FomSample.BH.BaseProcess Extends Ens.BusinessProcess [ Abstract ]
{

/// Bundleリソース
Property Bundle As HS.FHIRModel.R4.Bundle;

/// 情報送付先コンポーネント名指定 
Property TargetConfigName As %String(MAXLEN = 255);

/// FHIRエンドポイントのパス（必須） 
Property FHIREndpoint As %String(MAXLEN = 512);

Method Process() As %Status
{
    #dim ex As %Exception.AbstractException
    try {
        // FHIRリクエストの作成
        #dim fhirRequest As HS.FHIRServer.Interop.Request
        set fhirRequest = ##class(FomSample.FHIRConverter.RequestFactory).Create("/", ..FHIREndpoint, ..Bundle)

        // FHIRエンドポイントにリクエスト送信
        $$$ThrowOnError(..SendRequestSync(..TargetConfigName,fhirRequest,.res))
        
        if $LISTFIND($LISTBUILD("200", "201"), res.Response.Status) = 0 {
            set stream = ##class(HS.SDA3.QuickStream).%OpenId(res.QuickStreamId)
            throw ##class(%Exception.General).%New("FHIR OperationOutcome",,,stream.Read()) 
        }

        return $$$OK
    }
    catch ex {
        $$$LOGWARNING("[FHIR Process] エラー"_ex.AsStatus())
        return ex.AsStatus()
    }
}

Storage Default
{
<Data name="BaseProcessDefaultData">
<Subscript>"BaseProcess"</Subscript>
<Value name="1">
<Value>Bundle</Value>
</Value>
<Value name="2">
<Value>TargetConfigName</Value>
</Value>
<Value name="3">
<Value>FHIREndpoint</Value>
</Value>
</Data>
<DefaultData>BaseProcessDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
