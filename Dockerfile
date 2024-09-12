#イメージのタグはこちら（https://containers.intersystems.com/contents）でご確認ください
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:2024.1
FROM $IMAGE

USER root

# コンテナ内のワークディレクトリを /opt/app に設定
# ビジネスサービスが監視するディレクトリも所有者を設定(/var/iris/in.xx)
WORKDIR /opt/app
RUN mkdir -p /var/iris/in.p \
    /var/iris/in.bm \
    && chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} \
    /opt/app \
    /var/iris/in.p \
    /var/iris/in.bm
USER ${ISC_PACKAGE_MGRUSER}

# ファイルのコピー
COPY build/ .
COPY samples samples
COPY src src

# iris.scriptに記載された内容を実行
RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly