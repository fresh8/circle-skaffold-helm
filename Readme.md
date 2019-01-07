# Circle CI, gcloud-sdk, helm, skaffold

A container for deploying to GKE from circle ci using skaffold and helm.

# Build

variable `"HELM_VERSION"` and `"SKAFFOLD_VERSION"` must be passed as docker environment variables during the image build e.g.

```
docker build --no-cache --build-arg HELM_VERSION=2.12.0 --build-arg SKAFFOLD_VERSION=0.20.0 -t fresh8/circle-skaffold-helm:1.0.0 .
```

