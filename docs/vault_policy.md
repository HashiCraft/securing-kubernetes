---
id: vault_policy
title: Creating policy to allow access to secrets
sidebar_label: Create policy to manage access to secrets
---

Policy ties together secrets and authentication by defining which secrets and what administrative operations an authenticated user can perform. For example, an operator may have a policy which allows them to configure secrets for a PostgreSQL database, but not generate credentials. An application may have permission to create credentials but not configure the backend. Vault policy allows you correctly separate responsibility based on role.

Policy controls the permissions to access secrets in Vault. In order for our application to create database credentials, you need to define a policy in Vault to allow `read` access to the secret.

Vault applies policy based on the `path` of the secret. For example, the path for database secrets is `database/creds/<role>.` For the role created earlier, you can access the database secret at  `database/creds/db-app`. 

You also need to define capabilities (create, read, update, delete), or access level for the path. Creation of dynamic secrets requires the `read` capability.

```ruby
path "database/creds/db-app" {
  capabilities = ["read"]
}
```

If you have checked out the example code, this policy can be found at `./config/webpolicy.hcl`. You can write the policy to Vault using the `vault policy write <name> <location>` command. Run the following command which will create a policy named `web` from the example file.

```shell
vault policy write web ./web-policy.hcl
```

### Assigning Vault policy to Kubernetes Service Accounts

The Vault secret injector uses the Service Account Token allocated to the pod for authentication to Vault. Vault exchanges this for a Vault Token, which has policies assigned.

![Authentication workflow on Kubernetes](https://www.datocms-assets.com/2885/1576778470-vault-k8s-auth.png)

To create this mapping, you need to create a `role` in the Kubernetes authentication you configured earlier. This is done by writing configuration to `auth\kubernetes/role/<name>`. To assign the policy `web` when a pod authenticates using the service account `web,` in the namespace `default,` you need to set the following parameters:

* `bound_service_account_names` are the names of the service accounts provided as a comma-separated list that can use this role.

* `bound_service_account_namesapces` are the allowed namespaces for the service accounts.

* `policies` are the policies that you would like to attach to the token.

* `ttl` is the time to live for the Vault token returned from successful authentication.

The full command can be seen in the following snippet. Run this in your terminal to create the role.

```shell
vault write auth/kubernetes/role/web \
    bound_service_account_names=web \
    bound_service_account_namespaces=default \
    policies=web \
    ttl=1h
```
