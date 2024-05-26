# Testing

## Lister les ips

```sh
terraform output -json | jq -r '.[].value[]' | cut -d '/' -f1
```

## Docs

* <https://developer.hashicorp.com/terraform/cli/commands/output>