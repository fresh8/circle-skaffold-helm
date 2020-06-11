FROM google/cloud-sdk:296.0.1-alpine

RUN apk add --update --no-cache curl ca-certificates openjdk7-jre && \
  gcloud components install app-engine-java kubectl && \
  curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/v1.10.1/skaffold-linux-amd64 && \
  chmod +x skaffold && \
  mv skaffold /usr/local/bin && \
  curl -L https://get.helm.sh/helm-v3.2.3-linux-amd64.tar.gz|tar xvz && \
  mv linux-amd64/helm /usr/bin/helm && \
  chmod +x /usr/bin/helm && \
  rm -rf linux-amd64 && \
  rm -f /var/cache/apk/*

RUN helm version
RUN skaffold version
