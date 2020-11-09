k8s_ingress "consul-http" {
  cluster = "k8s_cluster.kubernetes"
  depends_on = ["helm.consul"]

  network {
    name = "network.cloud"
  }

  service  = "consul-ui"

  port {
    local  = 80
    remote = 80
    host   = 8500
  }
}

k8s_ingress "vault-http" {
  cluster = "k8s_cluster.kubernetes"
  service  = "vault"

  depends_on = ["helm.vault"]
  
  network {
    name = "network.cloud"
  }

  port {
    local  = 8200
    remote = 8200
    host   = 8200
  }
}