FROM dart:stable AS b1
WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .

RUN dart pub get --offline

RUN dart compile exe bin/dart_orm_docker_test.dart -o bin/server


FROM node:alpine3.17 AS b2
WORKDIR /app

RUN npm install prisma
RUN npx prisma init
# 复制的是 provider 为 js 的配置文件，为了打包时无需 dart 环境
COPY ./deploy/schema.prisma ./prisma/schema.prisma
COPY ./.env ./.env
RUN npx prisma generate


FROM alpine:3.17

COPY --from=dart:stable /runtime /

COPY --from=b1 /app/bin/server /app/bin/
COPY --from=b1 /app/.env /app/.env
COPY --from=b1 /app/db/test.db /app/db/test.db

COPY --from=b2 /app/node_modules/prisma/query-engine-linux-musl-openssl-3.0.x /app/prisma-query-engine

ENV TZ=Asia/Shanghai

RUN apk add --no-cache npm 

WORKDIR /app
CMD ["./bin/server"]
