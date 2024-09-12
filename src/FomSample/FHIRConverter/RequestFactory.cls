Class FomSample.FHIRConverter.RequestFactory Extends %RegisteredObject
{

ClassMethod Create(path As %String, endpoint As %String, bundle As HS.FHIRModel.R4.Bundle) As HS.FHIRServer.Interop.Request
{
  set qs = ##class(HS.SDA3.QuickStream).%New()
  set quickStreamId = qs.%Id()
  // ストリーム出力
  set dyn = bundle.toDao()
  do dyn.%ToJSON(qs)

  set req=##class(HS.FHIRServer.Interop.Request).%New()
  set req.Request.RequestMethod = "POST"
  set req.Request.RequestPath = path
  set req.Request.RequestFormatCode = "JSON"
  set req.Request.ResponseFormatCode = "JSON"
  set req.Request.SessionApplication = endpoint
  set req.QuickStreamId = quickStreamId

  return req
}

ClassMethod Search(path As %String, endpoint As %String, query As %String) As HS.FHIRServer.Interop.Request
{
  set req = ##class(HS.FHIRServer.Interop.Request).%New()
  set req.Request.RequestMethod = "GET"
  set req.Request.RequestPath = path
  set req.Request.RequestFormatCode = "JSON"
  set req.Request.ResponseFormatCode = "JSON"
  set req.Request.SessionApplication = endpoint
  set req.Request.BaseURL = endpoint
  set req.Request.QueryString = query

  return req
}

}
