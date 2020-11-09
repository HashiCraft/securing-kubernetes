k8s_cluster "kubernetes" {
  driver  = "k3s"
  version = "v1.0.1"

  nodes = 1

  network {
    name = "network.cloud"
  }

  image {
    name = "consul:1.9.0-beta"
  }
}

helm "consul" {
  cluster = "k8s_cluster.kubernetes"

  chart = "github.com/hashicorp/consul-helm"
  values = "./helm/consul-values.yaml"

  health_check {
    timeout = "60s"
    pods = ["app=consul", "component=server"]
  }
}

helm "vault" {
  cluster = "k8s_cluster.kubernetes"

  chart = "github.com/hashicorp/vault-helm"
  values = "./helm/vault-values.yaml"

  health_check {
    timeout = "120s"
    pods = ["app.kubernetes.io/name=vault"]
  }
}