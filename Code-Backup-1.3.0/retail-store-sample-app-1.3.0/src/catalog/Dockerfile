#Build the catalog service
FROM public.ecr.aws/amazonlinux/amazonlinux:2023 AS build

RUN dnf install --setopt=install_weak_deps=False -q -y \
    git \
    golang \
    && \
    dnf clean all

RUN mkdir -p "${GOPATH}/src" "${GOPATH}/bin" /use/src/app

WORKDIR /use/src/app

ENV GOPROXY=https://goproxy.io,direct

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o main main.go

FROM public.ecr.aws/amazonlinux/amazonlinux:2023

#SHADOW UTILS PACKAGE REQUIRED AS THE CATALOG SERVICE RUNS AS NON-ROOT USER AND NEEDS TO CREATE A USER AND GROUP FOR IT.

RUN dnf install --setopt=install_weak_deps=False -q -y \
    shadow-utils \
    && \
    dnf clean all

ENV APPUSER=svc_blv_cataloguser
ENV APPUID=1234
ENV APPGID=1234

RUN useradd \
    --home "/app" \
    --create-home \
    --user-group \
    --uid "${APPUID}" \
    "${APPUSER}"

WORKDIR /app

USER ${APPUSER}

COPY --chown=svc_blv_cataloguser:svc_blv_cataloguser --from=build /use/src/app/main .

COPY ./ATTRIBUTION.md ./LICENSES.md

ENV GIN_MODE=release

ENTRYPOINT ["/app/main"]