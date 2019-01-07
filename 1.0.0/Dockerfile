FROM google/cloud-sdk:228.0.0-alpine

# variable "HELM_VERSION" and "SKAFFOLD_VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg HELM_VERSION=2.12.0 --build-arg SKAFFOLD_VERSION=0.20.0 -t fresh8/circle-skaffold-helm:1.0.0 .

ARG HELM_VERSION
ARG SKAFFOLD_VERSION

ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"

RUN apk add --update --no-cache curl ca-certificates openjdk7-jre && \
  gcloud components install app-engine-java kubectl && \
  curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/v${SKAFFOLD_VERSION}/skaffold-linux-amd64 && \
  chmod +x skaffold && \
  mv skaffold /usr/local/bin && \
  curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
  mv linux-amd64/helm /usr/bin/helm && \
  chmod +x /usr/bin/helm && \
  rm -rf linux-amd64 && \
  apk del curl && \
  rm -f /var/cache/apk/*
