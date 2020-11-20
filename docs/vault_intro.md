---
id: vault_intro
title: Securing application credentials with Vault
sidebar_label: Secure application credentials with Vault
---

Providing database credentials for your Kubernetes applications has always proved operationally challenging. For optimum security, we ideally need to implement the following requirements for database credentials:

* Each Kubernetes pod should have a unique set of credentials
* Credentials should be disabled or deleted when a pod terminates
* Credentials should be short-lived and rotated frequently
* Access should be restricted by application function, a system which only needs to read a specific table, should have database access which grants this particular purpose

While these requirements are essential for reducing the blast radius in the event of an attack, they are operationally challenging. The reality is that without automation, it is impossible to satisfy them. HashiCorp Vault solves this problem by enabling operators to provide dynamically generated credentials for applications. Vault manages the lifecycle of credentials, rotating and revoking as required.

## Summary of Integration Workflow

We will use metadata annotations to inject dynamically generated database secrets into a Kubernetes pod. The integration automatically handles all the authentication with Vault and the management of the secrets, the application just reads the secrets from the filesystem or enviroment variables.

When a new deployment is submitted to Kubernetes, a mutating webhook modifies the deployment and injects a Vault sidecar. This sidecar manages the authentication to Vault and the retrieval of secrets. The retrieved secrets are written to a pod volume mount or environment variable that your application can read.

## Setting up Vault on Kubernetes

