FROM google/cloud-sdk:228.0.0-alpine

RUN apk add --update --no-cache curl ca-certificates openjdk7-jre && \
  gcloud components install app-engine-java kubectl && \
  curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/v0.29.0/skaffold-linux-amd64 && \
  chmod +x skaffold && \
  mv skaffold /usr/local/bin && \
  curl -L https://storage.googleapis.com/kubernetes-helm/helm-v2.12.1-linux-amd64.tar.gz|tar xvz && \
  mv linux-amd64/helm /usr/bin/helm && \
  chmod +x /usr/bin/helm && \
  rm -rf linux-amd64 && \
  rm -f /var/cache/apk/*
