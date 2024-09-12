Class build.Setup
{

ClassMethod SetupFHIR(ns As %String) As %Status
{
        #dim ex As %Exception.AbstractException
        set status=$$$OK

        try {
            // ネームスペースを作成するために"HSLIB"ネームスペースに移動
            zn "HSLIB"
            // 新しいネームスペースを作成
            do ##class(HS.Util.Installer.Foundation).Install(ns)

            // 作成したネームスペースに移動
            zn ns
            // FHIR対応用ネームスペース作成のために必要なインストールを実施
            do ##class(HS.FHIRServer.Installer).InstallNamespace()

            // FHIRリポジトリ用RESTのベースパス作成準備
            set appKey = "/csp/healthshare/"_ns_"/fhir/r4"
            set strategyClass = "HS.FHIRServer.Storage.JsonAdvSQL.InteractionsStrategy"
            set metadataPackages = $lb("hl7.fhir.r4.core@4.0.1")

            // FHIRサーバ機能を作成したネームスペースにインストール
            do ##class(HS.FHIRServer.Installer).InstallInstance(appKey, strategyClass, metadataPackages)

            // FHIRアプリケーション用の構成
            set strategy = ##class(HS.FHIRServer.API.InteractionsStrategy).GetStrategyForEndpoint(appKey) 
            set configData = strategy.GetServiceConfigData() 
            set configData.DebugMode = 4
            
            do strategy.SaveServiceConfigData(configData)
        }
        catch ex {
            set status = ex.AsStatus()
            w "error status: "_status
        }
        return status
}

}
