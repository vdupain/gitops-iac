# Quickstart Guide PoC Proxmox/Terraform/Talos

## Accès PVE pour Terraform

### Utilisateur / Rôle

```sh
pveum user add terraform@pve --password <password>
```

```sh
pveum role add Terraform -privs "Datastore.Allocate Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify SDN.Use VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt User.Modify"
```

```sh
pveum aclmod / -user terraform@pve -role Terraform
```

### Génération du Token

```sh
pveum user token add terraform@pve provider --privsep=0
```

```sh
┌──────────────┬──────────────────────────────────────┐
│ key          │ value                                │
╞══════════════╪══════════════════════════════════════╡
│ full-tokenid │ terraform@pve!provider               │
├──────────────┼──────────────────────────────────────┤
│ info         │ {"privsep":"0"}                      │
├──────────────┼──────────────────────────────────────┤
│ value        │ 4beff67f-c33b-4904-99f2-c853ad76b24b │
└──────────────┴──────────────────────────────────────┘
```

```sh
export TF_VAR_pve_api_token="terraform@pve\!provider=4beff67f-c33b-4904-99f2-c853ad76b24b"
```

### Configuration SSH

```sh
eval $(ssh-agent)
ssh-add ~/.ssh/id_ed25519
ssh-add -l
```

A ajouter dans son .bashrc/.zshrc/...
```sh
if [ -z "$SSH_AUTH_SOCK" ] ; then
 eval `ssh-agent -s`
 ssh-add ~/.ssh/id_ed25519
fi
```


## Provisionning des VMs

### Initialisation du projet Terraform

```sh
terraform init
```

### Validation du code

```sh
terraform validate
```

### Création et suppression des VMs

```sh
terraform apply -auto-approve
terraform destroy -auto-approve
```

## Docs

* <https://registry.terraform.io/providers/bpg/proxmox/latest>
* <https://blog.stephane-robert.info/docs/virtualiser/type1/proxmox/terraform/>

