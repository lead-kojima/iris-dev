Class FOMSAMPLEPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="FOMSAMPLEPKG.FoundationProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="患者CSVの取込" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="HeaderCount">1</Setting>
    <Setting Target="Host" Name="RecordMap">FomSample.RM.Patient</Setting>
    <Setting Target="Host" Name="TargetConfigNames">FomSample.BH.PatientProcess</Setting>
    <Setting Target="Adapter" Name="FilePath">/var/iris/in.p</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
  </Item>
  <Item Name="身体計測CSVの取込" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="HeaderCount">1</Setting>
    <Setting Target="Host" Name="RecordMap">FomSample.RM.BodyMeasurement</Setting>
    <Setting Target="Host" Name="TargetConfigNames">FomSample.BH.BodyMeasurementProcess</Setting>
    <Setting Target="Adapter" Name="FilePath">/var/iris/in.bm</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
  </Item>
  <Item Name="FomSample.BH.PatientProcess" Category="" ClassName="FomSample.BH.PatientProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FHIREndpoint">/csp/healthshare/fomsample/fhir/r4</Setting>
    <Setting Target="Host" Name="TargetConfigName">HS.FHIRServer.Interop.Operation</Setting>
  </Item>
  <Item Name="FomSample.BH.BodyMeasurementProcess" Category="" ClassName="FomSample.BH.BodyMeasurementProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FHIREndpoint">/csp/healthshare/fomsample/fhir/r4</Setting>
    <Setting Target="Host" Name="TargetConfigName">HS.FHIRServer.Interop.Operation</Setting>
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
  </Item>
  <Item Name="HS.Util.Trace.Operations" Category="" ClassName="HS.Util.Trace.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="FHIRペイロードのトレース用" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
