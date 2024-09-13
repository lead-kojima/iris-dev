# Production on FHIR object model

## FHIR Object Model
IRIS for Health 2024.1からの新機能で、対象FHIRバージョンはR4です。

FHIRリソースをオブジェクトモデル化したクラス群で、IDE上の入力補完機能、デバッグの簡素化などが主なメリットです。

2024年9月時点では、未対応の部分があるようです。
1. R5
2. カスタムプロファイル
3. DTLエディタでの利用

## ビルド＆起動
```terminal
docker-compose up -d --build
```

ビルドすることでネームスペースの作成(fomsample)、FHIRエンドポイントの追加、プロダクション関連クラスのインポートと自動開始の設定が行われます。[Patientリソース作成](#patientリソース作成)をターミナルから実行いただくことで、Patientリソースが作成されます。

## 管理ポータル
- `http://localhost:53773/iris/csp/sys/UtilHome.csp?$NAMESPACE=FOMSAMPLE`
- Login `_system / SYS`

## Patientリソース作成
```terminal
docker exec -d iris_fom_sample cp samples/Patient.csv /var/iris/in.p
```
/var/iris/in.pは、Patient.csvを監視するディレクトリです

## Observationリソース作成
※Patientリソースを作成してから実行してください
```terminal
docker exec -d iris_fom_sample cp samples/BodyMeasurement.csv /var/iris/in.bm
```
/var/iris/in.bmは、BodyMeasurement.csvを監視するディレクトリです

## FHIRエンドポイント
- Patient `http://localhost:53773/csp/healthshare/fomsample/fhir/r4/Patient`
- Observation `http://localhost:53773/csp/healthshare/fomsample/fhir/r4/Observation`

※認証なしで実行可能

## プロダクション概要
![production overview](assets/production%20overview.png)

## ポイント
1. FHIRエンドポイントにGET要求をする場合、HS.FHIRServer.Interop.Request クラスの Request.BaseURL プロパティに、SessionApplication プロパティと同じ値を設定する必要があります。IRISバージョン 2023.2 以降はその仕様のようです。

2. Bundleリソースの entry.request.ifNoneExist プロパティにクエリパラメータを設定することで、POST要求するときに既に存在しているかをFHIRサーバが自動で判別し、無駄なPOSTをしないように振る舞ってくれます。ヒストリーにも残りません。便利！