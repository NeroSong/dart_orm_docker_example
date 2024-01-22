FROM dart:stable AS b1
WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .

RUN dart pub get --offline

# Install Node.js LTS to builder
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - &&\
    apt-get install -y nodejs

RUN npm install prisma
RUN npx prisma generate

RUN dart compile exe bin/dart_orm_docker_test.dart -o bin/server

# Copy Prisma Engine deps so to `/runtime/`
RUN FILES="libz.so libgcc_s.so libssl.so libcrypto.so"; \
    for file in $FILES; do \
    so="$(find / -name "${file}*" -print -quit)"; \
    dir="$(dirname "$so")"; \
    mkdir -p "/runtime${dir}"; \
    cp "$so" "/runtime$so"; \
    echo "Copied $so to /runtime${so}"; \
    done


FROM scratch

COPY --from=b1 /runtime /
COPY --from=b1 /app/bin/server /app/bin/
COPY --from=b1 /app/.env /app/.env
COPY --from=b1 /app/db/test.db /app/db/test.db
COPY --from=b1 /app/prisma-query-engine /app/prisma-query-engine

ENV TZ=Asia/Shanghai

WORKDIR /app
CMD ["./bin/server"]
