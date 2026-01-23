# --- ステージ1: ビルド環境 (Maven + JDK) ---
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
# MavenでビルドしてWARファイルを作成
RUN mvn clean package

# --- ステージ2: 実行環境 (Tomcat) ---
FROM tomcat:10.1-jdk21-temurin
# TomcatのデフォルトWebアプリを削除（任意）
RUN rm -rf /usr/local/tomcat/webapps/*
# ステージ1で作成したWARファイルをTomcatの配備フォルダにコピー
# ROOT.warという名前にすると、localhost:8080/ で直接アクセス可能になります
COPY --from=build /app/module-api/target/hello-q-world.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]