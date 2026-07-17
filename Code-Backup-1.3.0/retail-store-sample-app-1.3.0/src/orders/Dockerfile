FROM public.ecr.aws/amazonlinux/amazonlinux:2023 as build

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
COPY pom.xml .
COPY mvnw .

RUN ./mvnw dependency:go-offline -B -q

COPY ./src ./src

RUN ./mvnw -DskipTests package -q && \
    mv /target/orders-0.0.1-SNAPSHOT.jar /app.jar

FROM public.ecr.aws/amazonlinux/amazonlinux:2023

RUN dnf install --setopt=install_weak_deps=False -q -y \
    shadow-utils \
    java-21-amazon-corretto-headless \
    && \
    dnf clean all

WORKDIR /app

ENV APPUSER=appuser
ENV APPUID=1000
ENV APPGID=1000

RUN useradd \
    --home "/app" \
    --create-home \
    --user-group \
    --uid "$APPUID" \
    "$APPUSER"

USER appuser

COPY ./ATTRIBUTION.md ./LICENCE.md
COPY --chown=appuser:appuser --from=build /app.jar .

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app/app.jar" ]