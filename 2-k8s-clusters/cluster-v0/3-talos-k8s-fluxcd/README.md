# Gitops k8s

## Bootstrap FluxCD

```sh
export GITHUB_TOKEN=<gh-token>
flux bootstrap github  --owner=vdupain --repository=gitops --branch=main \
    --personal --path=clusters/minimal --token-auth \
    --kubeconfig ../2-talos-k8s-cluster/kubeconfig-talos-cluster
```

## Docs

* <https://fluxcd.io/>
