#Build Stage
FROM public.ecr.aws/amazonlinux/amazonlinux:2023 AS build

RUN dnf install --setopt=install_weak_deps=False -q -y \
    maven \
    java-21-amazon-corretto-headless \
    which \
    tar \
    gzip \
    && \
    dnf clean all

VOLUME /tmp
WORKDIR /

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .

RUN chmod +x mvnw && ./mvnw dependency:go-offline -B -q

COPY ./src ./src

RUN ./mvnw -DskipTests package -q && \
    mv /target/carts-0.0.1-SNAPSHOT.jar /app.jar

FROM public.ecr.aws/amazonlinux/amazonlinux:2023

RUN dnf install --setopt=install_weak_deps=False -q -y \
    java-21-amazon-corretto-headless \
    shadow-utils \
    && \
    dnf clean all

ENV APPUSER=appuser
ENV APPUID=1000
ENV APPGID=1000

RUN useradd \
    --home "/app" \
    --create-home \
    --user-group \
    --uid "$APPUID" \
    "$APPUSER"

WORKDIR /app
USER appuser

COPY ./ATTRIBUTION.md ./LICENSES.md

COPY --chown=appuser:appuser --from=build /app.jar .

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app/app.jar" ]