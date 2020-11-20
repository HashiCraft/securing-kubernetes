---
id: vault_auth
title: Configuring Kubernetes Authentication in Vault
sidebar_label: Configure Kubernetes Authentication in Vault
---

To access secrets in Vault, you need to be authenticated; authentication is in the form of pluggable backends. For example, you can use a Kubernetes Service Account token to authenticate to Vault. For human access, you could use something like GitHub tokens. In both of these instances, Vault does not directly store the credentials; instead, it uses a trusted third party to validate the credentials.

With Kubernetes Service Account tokens, when an application attempts to authenticate with Vault, Vault makes a call to the Kubernetes API to ensure the validity of the token. If the token is valid, it returns an internally managed Vault Token, used by the application for future requests.

![Authentication workflow on Kubernetes](https://www.datocms-assets.com/2885/1576778470-vault-k8s-auth.png)

To enable applications to authenticate with Vault, we need to enable the Kubernetes authentication backend. This backend allows the application to obtain a Vault token by authenticating with Vault using a Kubernetes Service Account token. The Vault injector automatically manages the process of authentication for you, but you do need to configure Vault for this process to work.

For Vault to verify the Kubernetes Service Account token, the authentication backend needs to know the location of the Kubernetes API and needs to have valid credentials to access the API. You must ensure the Vault cluster uses the correct Kubernetes RBAC rules and service account. The Vault Helm chart and [Vault documentation](https://www.vaultproject.io/docs/auth/kubernetes.html) outlines the proper permissions.

The first step is to enable the Kubernetes authentication backend in Vault.

```shell
vault auth enable kubernetes
```

Like the database backend, authentication backends also need to be configured, let’s look at the parameters required for this configuration.

The `token_reviewer` parameter is set to a value Kubernetes Service Account token. Vault uses this token to authenticate itself when making calls with the Kubernetes API.

When making a call to the API Vault validates the TLS certificates used by the Kubernetes API. To perform this validation the CA certificate for the Kubernetes server is needed. You set `kubernetes_ca_cert` parameter with the contents of this certificate.

Finally the `kubernetes_host` parameter needs to be set to the address for the Kubernetes API. Vault will use the value of this parameter when making HTTP calls to the API.

If you are running Vault on Kubernetes you can use the following command to set this configuration. The Vault server pod already has a service account token with this information, so we can run a `kubectl exec` to execute the configure command directly in the pod:

```shell
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
  sh -c ' \
    vault write auth/kubernetes/config \
       token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
       kubernetes_host=https://${KUBERNETES_PORT_443_TCP_ADDR}:443 \
       kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt'
```

This configuration is only necessary when setting up a new Kubernetes cluster to work with Vault and only needs to be completed once.
