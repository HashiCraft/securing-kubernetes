k8s_config "apps" {
  cluster = "k8s_cluster.kubernetes"
  depends_on = ["helm.consul"]

  paths = [
    "./k8s_config/search.yaml",
    "./k8s_config/payments.yaml",
    "./k8s_config/database.yaml"
  ]

  wait_until_ready = true
}