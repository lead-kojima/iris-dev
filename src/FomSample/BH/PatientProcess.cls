Class FomSample.BH.PatientProcess Extends FomSample.BH.BaseProcess
{

Parameter SETTINGS = "FHIREndpoint:FHIR Configuration: selector?context={HS.FHIRServer.Util.ContextSearch/FHIRServerEndpoints},TargetConfigName:FHIR Configuration: selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Method OnRequest(pRequest As FomSample.Message.Patient, Output pResponse As Ens.Response) As %Status
{
    #dim ex As %Exception.AbstractException
    try {
        #dim fom As HS.FHIRModel.R4.Patient
        #dim bundle As HS.FHIRModel.R4.Bundle
        set fom = ##class(FomSample.FHIRConverter.Patient).ToFHIR(pRequest)
        set st = ##class(FomSample.FHIRConverter.Bundle).CreateTransaction(fom, .bundle)
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
